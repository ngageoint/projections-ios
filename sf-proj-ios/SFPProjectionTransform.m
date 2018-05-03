//
//  SFPProjectionTransform.m
//  sf-ios-proj
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "SFPProjectionTransform.h"
#import "SFPProjectionFactory.h"
#import "SFPGeometryProjectionTransform.h"
#import "SFPProjectionConstants.h"

@implementation SFPProjectionTransform

-(instancetype) initWithFromProjection: (SFPProjection *) fromProjection andToProjection: (SFPProjection *) toProjection{
    self = [super init];
    if(self != nil){
        self.fromProjection = fromProjection;
        self.toProjection = toProjection;
    }
    return self;
}

-(instancetype) initWithFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg{

    return [self initWithFromAuthority:PROJ_AUTHORITY_EPSG andFromIntCode:fromEpsg andToAuthority:PROJ_AUTHORITY_EPSG andToIntCode:toEpsg];
}

-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode{
    
    NSString *fromStringCode = [NSString stringWithFormat:@"%d", fromCode];
    NSString *toStringCode = [NSString stringWithFormat:@"%d", toCode];
    
    return [self initWithFromAuthority:fromAuthority andFromCode:fromStringCode andToAuthority:toAuthority andToCode:toStringCode];
}

-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    
    SFPProjection * fromProjection = [SFPProjectionFactory projectionWithAuthority:fromAuthority andCode:fromCode];
    SFPProjection * toProjection = [SFPProjectionFactory projectionWithAuthority:toAuthority andCode:toCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(instancetype) initWithFromProjection: (SFPProjection *) fromProjection andToEpsg: (int) toEpsg{
    
    NSString *toCode = [NSString stringWithFormat:@"%d", toEpsg];
    
    return [self initWithFromProjection:fromProjection andToAuthority:PROJ_AUTHORITY_EPSG andToCode:toCode];
}

-(instancetype) initWithFromProjection: (SFPProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    
    SFPProjection * toProjection = [SFPProjectionFactory projectionWithAuthority:toAuthority andCode:toCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(instancetype) initWithFromEpsg: (int) fromEpsg andToProjection: (SFPProjection *) toProjection{
    
    NSString *fromCode = [NSString stringWithFormat:@"%d", fromEpsg];
    
    return [self initWithFromAuthority:PROJ_AUTHORITY_EPSG andFromCode:fromCode andToProjection:toProjection];
}

-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (SFPProjection *) toProjection{
    
    SFPProjection * fromProjection = [SFPProjectionFactory projectionWithAuthority:fromAuthority andCode:fromCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(CLLocationCoordinate2D) transform: (CLLocationCoordinate2D) from{
    SFPLocationCoordinate3D * result = [self transform3d:[[SFPLocationCoordinate3D alloc] initWithCoordinate:from]];
    return result.coordinate;
}

-(SFPLocationCoordinate3D *) transform3d: (SFPLocationCoordinate3D *) from{
    
    CLLocationCoordinate2D to = CLLocationCoordinate2DMake(from.coordinate.latitude, from.coordinate.longitude);
    
    if(self.fromProjection.isLatLong){
        to.latitude *= DEG_TO_RAD;
        to.longitude *= DEG_TO_RAD;
    }
    
    double zValue = 0;
    BOOL hasZ = [from hasZ];
    if(hasZ){
        zValue = [from.z doubleValue];
    }
    
    int value = pj_transform(self.fromProjection.crs, self.toProjection.crs, 1, 0, &to.longitude, &to.latitude, hasZ ? &zValue : NULL);
    
    if(value != 0){
        [NSException raise:@"Transform Error" format:@"Failed to transform authority: %@, code: %@, latitude: %f, longitude: %f to authority: %@, code: %@, Error: %d", self.fromProjection.authority, self.fromProjection.code, from.coordinate.latitude, from.coordinate.longitude, self.toProjection.authority, self.toProjection.code, value];
    }
    
    if(self.toProjection.isLatLong){
        to.latitude *= RAD_TO_DEG;
        to.longitude *= RAD_TO_DEG;
    }
    
    NSDecimalNumber * toZ = nil;
    if(hasZ){
        toZ = [[NSDecimalNumber alloc] initWithDouble:zValue];
    }
    
    return [[SFPLocationCoordinate3D alloc] initWithCoordinate:to andZ:toZ];
}

-(SFPoint *) transformWithPoint: (SFPoint *) from{
    
    SFPGeometryProjectionTransform * geometryTransform = [[SFPGeometryProjectionTransform alloc] initWithProjectionTransform:self];
    SFPoint * to = [geometryTransform transformPoint:from];
    
    return to;
}

-(NSArray<SFPoint *> *) transformWithPoints: (NSArray<SFPoint *> *) from{
    
    NSMutableArray<SFPoint *> *to = [[NSMutableArray alloc] init];
    
    SFPGeometryProjectionTransform * geometryTransform = [[SFPGeometryProjectionTransform alloc] initWithProjectionTransform:self];
    for(SFPoint *fromPoint in from){
        SFPoint * toPoint = [geometryTransform transformPoint:fromPoint];
        [to addObject:toPoint];
    }
    
    return to;
}

-(SFGeometry *) transformWithGeometry: (SFGeometry *) from{
    
    SFPGeometryProjectionTransform * geometryTransform = [[SFPGeometryProjectionTransform alloc] initWithProjectionTransform:self];
    SFGeometry * to = [geometryTransform transformGeometry:from];
    
    return to;
}

-(SFGeometryEnvelope *) transformWithGeometryEnvelope: (SFGeometryEnvelope *) envelope{
    
    CLLocationCoordinate2D lowerLeft = CLLocationCoordinate2DMake([envelope.minY doubleValue], [envelope.minX doubleValue]);
    CLLocationCoordinate2D lowerRight = CLLocationCoordinate2DMake([envelope.minY doubleValue], [envelope.maxX doubleValue]);
    CLLocationCoordinate2D upperRight = CLLocationCoordinate2DMake([envelope.maxY doubleValue], [envelope.maxX doubleValue]);
    CLLocationCoordinate2D upperLeft = CLLocationCoordinate2DMake([envelope.maxY doubleValue], [envelope.minX doubleValue]);

    CLLocationCoordinate2D projectedLowerLeft = [self transform:lowerLeft];
    CLLocationCoordinate2D projectedLowerRight = [self transform:lowerRight];
    CLLocationCoordinate2D projectedUpperRight = [self transform:upperRight];
    CLLocationCoordinate2D projectedUpperLeft = [self transform:upperLeft];
    
    double minX = MIN(projectedLowerLeft.longitude, projectedUpperLeft.longitude);
    double maxX = MAX(projectedLowerRight.longitude, projectedUpperRight.longitude);
    double minY = MIN(projectedLowerLeft.latitude, projectedLowerRight.latitude);
    double maxY = MAX(projectedUpperLeft.latitude, projectedUpperRight.latitude);
    
    SFGeometryEnvelope * projectedGeometryEnvelope = [[SFGeometryEnvelope alloc] initWithMinXDouble:minX andMinYDouble:minY andMaxXDouble:maxX andMaxYDouble:maxY];
    
    return projectedGeometryEnvelope;
}

-(NSArray *) transformWithX: (double) x andY: (double) y{
    CLLocationCoordinate2D fromCoord = CLLocationCoordinate2DMake(y, x);
    CLLocationCoordinate2D toCoord = [self transform:fromCoord];
    return [[NSArray alloc] initWithObjects:[NSDecimalNumber numberWithDouble:toCoord.longitude], [NSDecimalNumber numberWithDouble:toCoord.latitude], nil];
}

-(BOOL) isSameProjection{
    return [self.fromProjection isEqualToProjection:self.toProjection];
}

@end
