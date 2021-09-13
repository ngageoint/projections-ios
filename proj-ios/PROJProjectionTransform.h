//
//  PROJProjectionTransform.h
//  proj-ios
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PROJProjection.h"
#import "PROJLocationCoordinate3D.h"

@class PROJProjection;

/**
 *  Projection transformation between a from and to projection
 */
@interface PROJProjectionTransform : NSObject

/**
 *  From projection
 */
@property (nonatomic, strong) PROJProjection *fromProjection;

/**
 *  To projection
 */
@property (nonatomic, strong) PROJProjection *toProjection;

/**
 *  Create
 *
 *  @param fromProjection from projection
 *  @param toProjection   to projection
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformFromProjection: (PROJProjection *) fromProjection andToProjection: (PROJProjection *) toProjection;

/**
 *  Create
 *
 *  @param fromEpsg from epsg
 *  @param toEpsg   to epsg
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg;

/**
 *  Create
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode;

/**
 *  Create
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Create
 *
 *  @param fromProjection from projection
 *  @param toEpsg         to epsg
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg;

/**
 *  Create
 *
 *  @param fromProjection from projection
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Create
 *
 *  @param fromEpsg     from epsg
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection;

/**
 *  Create
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection;

/**
 *  Create
 *
 *  @param transform projection transform
 *
 *  @return new projection transform
 */
+(PROJProjectionTransform *) transformWithProjectionTransform: (PROJProjectionTransform *) transform;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toProjection   to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToProjection: (PROJProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromEpsg from epsg
 *  @param toEpsg   to epsg
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromIntCode: (int) fromCode andToAuthority: (NSString *) toAuthority andToIntCode: (int) toCode;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toEpsg         to epsg
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (PROJProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromEpsg     from epsg
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToProjection: (PROJProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (PROJProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param transform projection transform
 *
 *  @return new projection transform
 */
-(instancetype) initWithProjectionTransform: (PROJProjectionTransform *) transform;

/**
 * Free the projection memory
 */
-(void) free;

/**
 *  Transform a location coordinate
 *
 *  @param from location coordinate
 *
 *  @return transformed location coordinate
 */
-(CLLocationCoordinate2D) transform: (CLLocationCoordinate2D) from;

/**
 *  Transform a 3d location coordinate
 *
 *  @param from 3d location coordinate
 *
 *  @return transformed 3d location coordinate
 */
-(PROJLocationCoordinate3D *) transform3d: (PROJLocationCoordinate3D *) from;

/**
 *  Transform a x and y coordinate
 *
 *  @param x x coordinate
 *  @param y y coordinate
 *
 *  @return transformed coordinates as [x, y]
 */
-(NSArray<NSDecimalNumber *> *) transformX: (double) x andY: (double) y;

/**
 * Transform the coordinate bounds
 *
 * @param minX min x
 * @param minY min y
 * @param maxX max x
 * @param maxY max y
 *
 * @return transformed coordinate bounds as [minX, minY, maxX, maxY]
 */
-(NSArray<NSDecimalNumber *> *) transformMinX: (double) minX andMinY: (double) minY andMaxX: (double) maxX andMaxY: (double) maxY;

/**
 * Is the from and to projection the same?
 *
 * @return true if the same projection
 */
-(BOOL) isSameProjection;

/**
 * Get the inverse transformation
 *
 * @return inverse transformation
 */
-(PROJProjectionTransform *) inverseTransformation;

@end
