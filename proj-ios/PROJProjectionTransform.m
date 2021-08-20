//
//  PROJProjectionTransform.m
//  proj-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "PROJProjectionTransform.h"
#import "PROJProjectionFactory.h"
#import "PROJProjectionConstants.h"

@implementation PROJProjectionTransform

+(PROJProjectionTransform *) transformFromProjection: (PROJProjection *) fromProjection andToProjection: (PROJProjection *) toProjection{
    return [[PROJProjectionTransform alloc] initWithFromProjection:fromProjection andToProjection:toProjection];
}

+(PROJProjectionTransform *) transformFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg{
    return [[PROJProjectionTransform alloc] initWithFromEpsg:fromEpsg andToEpsg:toEpsg];
}

+(PROJProjectionTransform *) transformFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode{
    return [[PROJProjectionTransform alloc] initWithFromAuthority:fromAuthority andFromIntCode:fromCode andToAuthority:toAuthority andToIntCode:toCode];
}

+(PROJProjectionTransform *) transformFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    return [[PROJProjectionTransform alloc] initWithFromAuthority:fromAuthority andFromCode:fromCode andToAuthority:toAuthority andToCode:toCode];
}

+(PROJProjectionTransform *) transformFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg{
    return [[PROJProjectionTransform alloc] initWithFromProjection:fromProjection andToEpsg:toEpsg];
}

+(PROJProjectionTransform *) transformFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    return [[PROJProjectionTransform alloc] initWithFromProjection:fromProjection andToAuthority:toAuthority andToCode:toCode];
}

+(PROJProjectionTransform *) transformFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection{
    return [[PROJProjectionTransform alloc] initWithFromEpsg:fromEpsg andToProjection:toProjection];
}

+(PROJProjectionTransform *) transformFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection{
    return [[PROJProjectionTransform alloc] initWithFromAuthority:fromAuthority andFromCode:fromCode andToProjection:toProjection];
}

-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToProjection: (PROJProjection *) toProjection{
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
    
    PROJProjection * fromProjection = [PROJProjectionFactory projectionWithAuthority:fromAuthority andCode:fromCode];
    PROJProjection * toProjection = [PROJProjectionFactory projectionWithAuthority:toAuthority andCode:toCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg{
    
    NSString *toCode = [NSString stringWithFormat:@"%d", toEpsg];
    
    return [self initWithFromProjection:fromProjection andToAuthority:PROJ_AUTHORITY_EPSG andToCode:toCode];
}

-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    
    PROJProjection * toProjection = [PROJProjectionFactory projectionWithAuthority:toAuthority andCode:toCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(instancetype) initWithFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection{
    
    NSString *fromCode = [NSString stringWithFormat:@"%d", fromEpsg];
    
    return [self initWithFromAuthority:PROJ_AUTHORITY_EPSG andFromCode:fromCode andToProjection:toProjection];
}

-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection{
    
    PROJProjection * fromProjection = [PROJProjectionFactory projectionWithAuthority:fromAuthority andCode:fromCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(CLLocationCoordinate2D) transform: (CLLocationCoordinate2D) from{
    PROJLocationCoordinate3D * result = [self transform3d:[PROJLocationCoordinate3D coordinateWithCoordinate:from]];
    return result.coordinate;
}

-(PROJLocationCoordinate3D *) transform3d: (PROJLocationCoordinate3D *) from{
    
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
    
    return [PROJLocationCoordinate3D coordinateWithCoordinate:to andZ:toZ];
}

-(NSArray<NSDecimalNumber *> *) transformWithX: (double) x andY: (double) y{
    CLLocationCoordinate2D fromCoord = CLLocationCoordinate2DMake(y, x);
    CLLocationCoordinate2D toCoord = [self transform:fromCoord];
    return [NSArray arrayWithObjects:[NSDecimalNumber numberWithDouble:toCoord.longitude], [NSDecimalNumber numberWithDouble:toCoord.latitude], nil];
}

-(NSArray<NSDecimalNumber *> *) transformWithMinX: (double) minX andMinY: (double) minY andMaxX: (double) maxX andMaxY: (double) maxY{
    
    CLLocationCoordinate2D lowerLeft = CLLocationCoordinate2DMake(minY, minX);
    CLLocationCoordinate2D lowerRight = CLLocationCoordinate2DMake(minY, maxX);
    CLLocationCoordinate2D upperRight = CLLocationCoordinate2DMake(maxY, maxX);
    CLLocationCoordinate2D upperLeft = CLLocationCoordinate2DMake(maxY, minX);

    CLLocationCoordinate2D projectedLowerLeft = [self transform:lowerLeft];
    CLLocationCoordinate2D projectedLowerRight = [self transform:lowerRight];
    CLLocationCoordinate2D projectedUpperRight = [self transform:upperRight];
    CLLocationCoordinate2D projectedUpperLeft = [self transform:upperLeft];
    
    double toMinX = MIN(projectedLowerLeft.longitude, projectedUpperLeft.longitude);
    double toMaxX = MAX(projectedLowerRight.longitude, projectedUpperRight.longitude);
    double toMinY = MIN(projectedLowerLeft.latitude, projectedLowerRight.latitude);
    double toMaxY = MAX(projectedUpperLeft.latitude, projectedUpperRight.latitude);
    
    return [NSArray arrayWithObjects:
            [NSDecimalNumber numberWithDouble:toMinX],
            [NSDecimalNumber numberWithDouble:toMinY],
            [NSDecimalNumber numberWithDouble:toMaxX],
            [NSDecimalNumber numberWithDouble:toMaxY], nil];
}

-(BOOL) isSameProjection{
    return [self.fromProjection isEqualToProjection:self.toProjection];
}

-(PROJProjectionTransform *) inverseTransformation{
    return [PROJProjectionTransform transformFromProjection:self.toProjection andToProjection:self.fromProjection];
}

@end
