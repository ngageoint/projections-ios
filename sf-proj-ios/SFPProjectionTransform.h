//
//  SFPProjectionTransform.h
//  sf-ios-proj
//
//  Created by Brian Osborn on 5/21/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFPProjection.h"
#import "SFPBoundingBox.h"
#import "WKBPoint.h"
#import "SFPLocationCoordinate3D.h"
#import "SFPSpatialReferenceSystem.h"

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
 *  Initialize
 *
 *  @param fromSrs from spatial reference system
 *  @param toSrs   to spatial reference system
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromSrs: (SFPSpatialReferenceSystem *) fromSrs andToSrs: (SFPSpatialReferenceSystem *) toSrs;

/**
 *  Initialize
 *
 *  @param fromSrs      from spatial reference system
 *  @param toProjection to projection
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromSrs: (SFPSpatialReferenceSystem *) fromSrs andToProjection: (SFPProjection *) toProjection;

/**
 *  Initialize
 *
 *  @param fromProjection from projection
 *  @param toSrs          to spatial reference system
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromProjection: (SFPProjection *) fromProjection andToSrs: (SFPSpatialReferenceSystem *) toSrs;

/**
 *  Initialize
 *
 *  @param fromSrs from spatial reference system
 *  @param toEpsg  to epsg
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromSrs: (SFPSpatialReferenceSystem *) fromSrs andToEpsg: (int) toEpsg;

/**
 *  Initialize
 *
 *  @param fromSrs from spatial reference system
 *  @param toAuthority   to authority
 *  @param toCode        to code
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromSrs: (SFPSpatialReferenceSystem *) fromSrs andToAuthority: (NSString *) toAuthority andToCode: (NSString *) toCode;

/**
 *  Initialize
 *
 *  @param fromEpsg from epsg
 *  @param toSrs    to spatial reference system
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromEpsg: (int) fromEpsg andToSrs: (SFPSpatialReferenceSystem *) toSrs;

/**
 *  Initialize
 *
 *  @param fromAuthority from authority
 *  @param fromCode      from code
 *  @param toSrs    to spatial reference system
 *
 *  @return new projection transform
 */
-(instancetype) initWithFromAuthority: (NSString *) fromAuthority andFromCode: (NSString *) fromCode andToSrs: (SFPSpatialReferenceSystem *) toSrs;

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
-(WKBPoint *) transformWithPoint: (WKBPoint *) from;

/**
 *  Transform an array of points
 *
 *  @param from points to transform
 *
 *  @return transformed points
 */
-(NSArray<WKBPoint *> *) transformWithPoints: (NSArray<WKBPoint *> *) from;

/**
 *  Transform a geometry
 *
 *  @param from geometry
 *
 *  @return projected geometry
 */
-(WKBGeometry *) transformWithGeometry: (WKBGeometry *) from;

/**
 *  Transform a bounding box
 *
 *  @param boundingBox bounding box to transform
 *
 *  @return transformed bounding box
 */
-(SFPBoundingBox *) transformWithBoundingBox: (SFPBoundingBox *) boundingBox;

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
