//
//  SFPGeometryProjectionTransform.h
//  sf-ios-proj
//
//  Created by Brian Osborn on 1/18/16.
//  Copyright © 2016 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFPProjectionTransform.h"
#import "SFPoint.h"
#import "SFLineString.h"
#import "SFPolygon.h"
#import "SFMultiPoint.h"
#import "SFMultiLineString.h"
#import "SFMultiPolygon.h"
#import "SFCircularString.h"
#import "SFCompoundCurve.h"
#import "SFPolyhedralSurface.h"
#import "SFTIN.h"
#import "SFTriangle.h"
#import "SFGeometryCollection.h"

@interface SFPGeometryProjectionTransform : NSObject

/**
 *  Initialize
 *
 *  @param transform projection transform
 *
 *  @return new instance
 */
-(instancetype) initWithProjectionTransform: (SFPProjectionTransform *) transform;

/**
 *  Transform the geometry
 *
 *  @param geometry geometry
 *
 *  @return projected geometry
 */
-(SFGeometry *) transformGeometry: (SFGeometry *) geometry;

/**
 *  Transform the point
 *
 *  @param point point
 *
 *  @return projected point
 */
-(SFPoint *) transformPoint: (SFPoint *) point;

/**
 *  Transform the line string
 *
 *  @param lineString line string
 *
 *  @return projected line string
 */
-(SFLineString *) transformLineString: (SFLineString *) lineString;

/**
 *  Transform the polygon
 *
 *  @param polygon polygon
 *
 *  @return projected polygon
 */
-(SFPolygon *) transformPolygon: (SFPolygon *) polygon;

/**
 *  Transform the multi point
 *
 *  @param multiPoint multi point
 *
 *  @return projected multi point
 */
-(SFMultiPoint *) transformMultiPoint: (SFMultiPoint *) multiPoint;

/**
 *  Transform the multi line string
 *
 *  @param multiLineString multi line string
 *
 *  @return projected multi line string
 */
-(SFMultiLineString *) transformMultiLineString: (SFMultiLineString *) multiLineString;

/**
 *  Transform the multi polygon
 *
 *  @param multiPolygon multi polygon
 *
 *  @return projected multi polygon
 */
-(SFMultiPolygon *) transformMultiPolygon: (SFMultiPolygon *) multiPolygon;

/**
 *  Transform the circular string
 *
 *  @param circularString circular string
 *
 *  @return projected circular string
 */
-(SFCircularString *) transformCircularString: (SFCircularString *) circularString;

/**
 *  Transform the compound curve
 *
 *  @param compoundCurve compound curve
 *
 *  @return projected compound curve
 */
-(SFCompoundCurve *) transformCompoundCurve: (SFCompoundCurve *) compoundCurve;

/**
 *  Transform the polyhedrals surface
 *
 *  @param polyhedralSurface polyhedrals surface
 *
 *  @return projected polyhedrals surface
 */
-(SFPolyhedralSurface *) transformPolyhedralSurface: (SFPolyhedralSurface *) polyhedralSurface;

/**
 *  Transform the tin
 *
 *  @param tin tin
 *
 *  @return projected tin
 */
-(SFTIN *) transformTIN: (SFTIN *) tin;

/**
 *  Transform the triangle
 *
 *  @param triangle triangle
 *
 *  @return projected triangle
 */
-(SFTriangle *) transformTriangle: (SFTriangle *) triangle;

/**
 *  Transform the geometry collection
 *
 *  @param geometryCollection geometry collection
 *
 *  @return projected geometry collection
 */
-(SFGeometryCollection *) transformGeometryCollection: (SFGeometryCollection *) geometryCollection;

@end
