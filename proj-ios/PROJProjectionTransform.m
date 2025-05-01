//
//  PROJProjectionTransform.m
//  proj-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

//# "proj.h"
@import proj;
@import CoordinateReferenceSystems;

#import <Projections/PROJProjectionTransform.h>
#import <Projections/PROJProjectionFactory.h>
#import <Projections/PROJProjectionConstants.h>

@interface PROJProjectionTransform()

/**
 *  Transform context
 */
@property (nonatomic) PJ_CONTEXT *context;

/**
 *  Projection Transform
 */
@property (nonatomic) PJ *transform;

/**
 *  Swap the axis values of the from projection
 */
@property (nonatomic) BOOL swapFrom;

/**
 *  Swap the axis values of the to projection
 */
@property (nonatomic) BOOL swapTo;

@end

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
        _fromProjection = fromProjection;
        _toProjection = toProjection;

        _context = proj_context_create();

        BOOL isFromCRS = proj_is_crs(fromProjection.crs);
        BOOL isToCRS = proj_is_crs(toProjection.crs);

        _swapFrom = isFromCRS && [self swapAxisWithProjection:fromProjection];
        _swapTo = isToCRS && [self swapAxisWithProjection:toProjection];

        if (isFromCRS && isToCRS) {
            _transform = proj_create_crs_to_crs_from_pj(_context, fromProjection.crs, toProjection.crs, NULL, NULL);
        } else {
            const char *fromString = [self stringFromProjection:fromProjection];
            const char *toString = [self stringFromProjection:toProjection];
            _transform = proj_create_crs_to_crs(_context, fromString, toString, NULL);
        }

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
    
    PROJProjection *fromProjection = [PROJProjectionFactory projectionWithAuthority:fromAuthority andCode:fromCode];
    PROJProjection *toProjection = [PROJProjectionFactory projectionWithAuthority:toAuthority andCode:toCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg{
    
    NSString *toCode = [NSString stringWithFormat:@"%d", toEpsg];
    
    return [self initWithFromProjection:fromProjection andToAuthority:PROJ_AUTHORITY_EPSG andToCode:toCode];
}

-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode{
    
    PROJProjection *toProjection = [PROJProjectionFactory projectionWithAuthority:toAuthority andCode:toCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(instancetype) initWithFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection{
    
    NSString *fromCode = [NSString stringWithFormat:@"%d", fromEpsg];
    
    return [self initWithFromAuthority:PROJ_AUTHORITY_EPSG andFromCode:fromCode andToProjection:toProjection];
}

-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection{
    
    PROJProjection *fromProjection = [PROJProjectionFactory projectionWithAuthority:fromAuthority andCode:fromCode];
    
    return [self initWithFromProjection:fromProjection andToProjection:toProjection];
}

-(instancetype) initWithProjectionTransform: (PROJProjectionTransform *) transform{
    return [self initWithFromProjection:transform.fromProjection andToProjection:transform.toProjection];
}

-(const char *) stringFromProjection: (PROJProjection *) projection{
    const char *value;
    if (proj_is_crs(projection.crs)) {
        value = proj_as_wkt(_context, projection.crs, PJ_WKT2_2019, NULL);
    } else if (projection.params != nil) {
        value = [projection.params UTF8String];
    } else {
        value = proj_as_proj_string(_context, projection.crs, PJ_PROJ_4, NULL);
    }
    return value;
}

-(void) free{
    [self destroy];
}

-(void) close{
    [self destroy];
}

-(void) destroy{
    if(_transform != NULL){
        proj_destroy(_transform);
        _transform = NULL;
    }
    if(_context != NULL){
        proj_context_destroy(_context);
        _context = NULL;
    }
}

-(CLLocationCoordinate2D) transform: (CLLocationCoordinate2D) from{
    PROJLocationCoordinate3D *result = [self transform3d:[PROJLocationCoordinate3D coordinateWithCoordinate:from]];
    return result.coordinate;
}

-(PROJLocationCoordinate3D *) transform3d: (PROJLocationCoordinate3D *) from{
    
    double x = from.coordinate.longitude;
    double y = from.coordinate.latitude;

    double z = 0;
    BOOL hasZ = [from hasZ];
    if (hasZ) {
        z = [from.z doubleValue];
    }

    if (_swapFrom) {
        double swap = x;
        x = y;
        y = swap;
    }

    PJ_COORD c_in = proj_coord(x, y, z, 0);

    PJ_COORD c_out = proj_trans(_transform, PJ_FWD, c_in);

    double toX = c_out.xy.x;
    double toY = c_out.xy.y;

    NSDecimalNumber *toZ = nil;
    if (hasZ) {
        toZ = [[NSDecimalNumber alloc] initWithDouble:c_out.xyz.z];
    }

    if (_swapTo) {
        double swap = toX;
        toX = toY;
        toY = swap;
    }

    CLLocationCoordinate2D to = CLLocationCoordinate2DMake(toY, toX);

    return [PROJLocationCoordinate3D coordinateWithCoordinate:to andZ:toZ];
}

-(BOOL) swapAxisWithProjection: (PROJProjection *) projection{
    BOOL swap = NO;
    PJ *crs = projection.crs;
    PJ *cs = proj_crs_get_coordinate_system(_context, crs);
    int axisCount = proj_cs_get_axis_count(_context, cs);
    if (axisCount > 0) {
        if (axisCount > 1) {
            const char *firstAxisDirection = "";
            const char *secondAxisDirection = "";
            proj_cs_get_axis_info(_context, cs, 0, NULL, NULL, &firstAxisDirection, NULL, NULL, NULL, NULL);
            proj_cs_get_axis_info(_context, cs, 1, NULL, NULL, &secondAxisDirection, NULL, NULL, NULL, NULL);
            enum CRSAxisDirectionType firstAxis = [CRSAxisDirectionTypes type:[NSString stringWithUTF8String:firstAxisDirection]];
            enum CRSAxisDirectionType secondAxis = [CRSAxisDirectionTypes type:[NSString stringWithUTF8String:secondAxisDirection]];
            swap = [self swapWithFirstAxis:firstAxis andSecondAxis:secondAxis];
        }
    } else {
        CRSObject *crsObject = projection.definitionCRS;
        if (crsObject != nil) {
            if ([crsObject isKindOfClass:[CRSCompoundCoordinateReferenceSystem class]]) {
                CRSCompoundCoordinateReferenceSystem *compound = (CRSCompoundCoordinateReferenceSystem *) crsObject;
                for (int i = 0; i < compound.coordinateReferenceSystems.count; i++) {
                    CRSObject *compoundCrs = [compound.coordinateReferenceSystems objectAtIndex:i];
                    swap = [self swapWithCRS:compoundCrs];
                    if (swap) {
                        break;
                    }
                }
            } else {
                swap = [self swapWithCRS:crsObject];
            }
        }
    }
    proj_destroy(cs);
    return swap;
}

-(BOOL) swapWithCRS: (CRSObject *) crs {
    BOOL swap = NO;
    if ([crs isKindOfClass:[CRSSimpleCoordinateReferenceSystem class]]) {
        CRSSimpleCoordinateReferenceSystem *simple = (CRSSimpleCoordinateReferenceSystem *) crs;
        CRSCoordinateSystem *cs = simple.coordinateSystem;
        if (cs != nil) {
            NSMutableArray<CRSAxis *> *axes = cs.axes;
            if (axes != nil && axes.count > 1) {
                enum CRSAxisDirectionType firstAxis = [axes objectAtIndex:0].direction;
                enum CRSAxisDirectionType secondAxis = [axes objectAtIndex:1].direction;
                swap = [self swapWithFirstAxis:firstAxis andSecondAxis:secondAxis];
            }
        }
    }
    return swap;
}

-(BOOL) swapWithFirstAxis: (enum CRSAxisDirectionType) firstAxis andSecondAxis: (enum CRSAxisDirectionType) secondAxis {
    BOOL swap = NO;
    if (firstAxis != -1 && secondAxis != -1) {
        switch (firstAxis) {
            case CRS_AXIS_NORTH:
            case CRS_AXIS_SOUTH:
                swap = YES;
                break;
            default:
                break;
        }
        if (swap) {
            swap = NO;
            switch (secondAxis) {
                case CRS_AXIS_EAST:
                case CRS_AXIS_WEST:
                    swap = YES;
                    break;
                default:
                    break;
            }
        }
    }
    return swap;
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
