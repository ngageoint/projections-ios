//
//  SFPProjectionTransform.h
//  sf-ios-proj
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFPProjection.h"
#import "SFPoint.h"
#import "SFPLocationCoordinate3D.h"

/**
 *  Projection transformation between a from and to projection
 */
@interface SFPProjectionTransform : NSObject

/**
 *  From projection
 */
@property (nonatomic, strong) SFPProjection *fromProjection;

/**
 *  To projection
 */
@property (nonatomic, strong) SFPProjection *toProjection;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toProjection   to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (SFPProjection *) fromProjection andToProjection: (SFPProjection *) toProjection;

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
-(instancetype) initWithFromProjection: (SFPProjection *) fromProjection andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (SFPProjection *) fromProjection andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromEpsg     from epsg
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToProjection: (SFPProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToProjection: (SFPProjection *) toProjection;

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
-(SFPLocationCoordinate3D *) transform3d: (SFPLocationCoordinate3D *) from;

/**
 *  Transform a point
 *
 *  @param from point to transform
 *
 *  @return transformed point
 */
-(SFPoint *) transformWithPoint: (SFPoint *) from;

/**
 *  Transform an array of points
 *
 *  @param from points to transform
 *
 *  @return transformed points
 */
-(NSArray<SFPoint *> *) transformWithPoints: (NSArray<SFPoint *> *) from;

/**
 *  Transform a geometry
 *
 *  @param from geometry
 *
 *  @return projected geometry
 */
-(SFGeometry *) transformWithGeometry: (SFGeometry *) from;

/**
 *  Transform the geometry envelope
 *
 *  @param envelope geometry envelope
 *
 *  @return geometry envelope
 */
-(SFGeometryEnvelope *) transformWithGeometryEnvelope: (SFGeometryEnvelope *) envelope;

/**
 *  Transform a x and y coordinate
 *
 *  @param x x coordinate
 *  @param y y coordinate
 *
 *  @return array containing x and y coordinate
 */
-(NSArray *) transformWithX: (double) x andY: (double) y;

/**
 * Is the from and to projection the same?
 *
 * @return true if the same projection
 */
-(BOOL) isSameProjection;

@end
