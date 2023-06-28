//
//  PROJCRSParser.h
//  proj-ios
//
//  Created by Brian Osborn on 7/9/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "proj.h"
#import "CRSProjectedCoordinateReferenceSystem.h"
#import "CRSCompoundCoordinateReferenceSystem.h"

/**
 * Coordinate Reference System Well-known text parser
 */
@interface PROJCRSParser : NSObject

/**
 * Parse crs well-known text into a proj4 coordinate reference system
 *
 * @param wkt
 *            crs well-known text
 * @return coordinate reference system
 */
+(PJ *) parseText: (NSString *) wkt;

/**
 * Convert a CRS object into a proj4 coordinate reference system
 *
 * @param crs
 *            CRS object
 * @return coordinate reference system
 */
+(PJ *) convertCRS: (CRSObject *) crs;

/**
 * Convert a geodetic or geographic crs into a proj4 coordinate reference
 * system
 *
 * @param geo
 *            geodetic or geographic crs
 * @return coordinate reference system
 */
+(PJ *) convertGeo: (CRSGeoCoordinateReferenceSystem *) geo;

/**
 * Convert a projected crs into a proj4 coordinate reference system
 *
 * @param projected
 *            projected crs
 * @return coordinate reference system
 */
+(PJ *) convertProjected: (CRSProjectedCoordinateReferenceSystem *) projected;

/**
 * Convert a compound crs into a proj4 coordinate reference system
 *
 * @param compound
 *            compound crs
 * @return coordinate reference system
 */
+(PJ *) convertCompound: (CRSCompoundCoordinateReferenceSystem *) compound;

@end
