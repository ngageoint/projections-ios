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

+(PROJProjectionTransform *) transformWithProjectionTransform: (PROJProjectionTransform *) transform{
    return [[PROJProjectionTransform alloc] initWithProjectionTransform:transform];
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

-(instancetype) initWithProjectionTransform: (PROJProjectionTransform *) transform{
    return [self initWithFromProjection:transform.fromProjection andToProjection:transform.toProjection];
}

-(void) free{
    [_fromProjection free];
    [_toProjection free];
}

-(CLLocationCoordinate2D) transform: (CLLocationCoordinate2D) from{
    PROJLocationCoordinate3D * result = [self transform3d:[PROJLocationCoordinate3D coordinateWithCoordinate:from]];
    return result.coordinate;
}

-(PROJLocationCoordinate3D *) transform3d: (PROJLocationCoordinate3D *) from{
    
    PJ_COORD c_in;
    
    BOOL hasZ = [from hasZ];
    if(hasZ){
        c_in.xyz.x = from.coordinate.longitude;
        c_in.xyz.y = from.coordinate.latitude;
        c_in.xyz.z = [from.z doubleValue];
    } else {
        c_in.xy.x = from.coordinate.longitude;
        c_in.xy.y = from.coordinate.latitude;
    }
    
    PJ_CONTEXT *context = proj_context_create();
    
    const char *fromString = proj_as_proj_string(context, self.fromProjection.crs, PJ_PROJ_4, NULL);
    const char *toString = proj_as_proj_string(context, self.toProjection.crs, PJ_PROJ_4, NULL);
    
    PJ *transform = proj_create_crs_to_crs(context, fromString, toString, NULL);

    PJ_COORD c_out = proj_trans(transform, PJ_FWD, c_in);

    proj_destroy(transform);
    proj_context_destroy(context);
    
    CLLocationCoordinate2D to;
    NSDecimalNumber *toZ = nil;
    if(hasZ){
        to = CLLocationCoordinate2DMake(c_out.xyz.y, c_out.xyz.x);
        toZ = [[NSDecimalNumber alloc] initWithDouble:c_out.xyz.z];
    } else {
        to = CLLocationCoordinate2DMake(c_out.xy.y, c_out.xy.x);
    }
    
    return [PROJLocationCoordinate3D coordinateWithCoordinate:to andZ:toZ];
}

-(NSArray<NSDecimalNumber *> *) transformX: (double) x andY: (double) y{
    CLLocationCoordinate2D fromCoord = CLLocationCoordinate2DMake(y, x);
    CLLocationCoordinate2D toCoord = [self transform:fromCoord];
    return [NSArray arrayWithObjects:[NSDecimalNumber numberWithDouble:toCoord.longitude], [NSDecimalNumber numberWithDouble:toCoord.latitude], nil];
}

-(NSArray<NSDecimalNumber *> *) transformMinX: (double) minX andMinY: (double) minY andMaxX: (double) maxX andMaxY: (double) maxY{
    
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
    
    if(toMinX > toMaxX){
        toMinX = MAX(projectedLowerLeft.longitude, projectedUpperLeft.longitude);
        toMaxX = MIN(projectedLowerRight.longitude, projectedUpperRight.longitude);
    }
    
    if(toMinY > toMaxY){
        toMinY = MAX(projectedLowerLeft.latitude, projectedLowerRight.latitude);
        toMaxY = MIN(projectedUpperLeft.latitude, projectedUpperRight.latitude);
    }
    
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
