//
//  CRSEllipsoids.h
//  crs-ios
//
//  Created by Brian Osborn on 9/2/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Common Ellipsoids
 */
enum CRSEllipsoidsType{
    CRS_ELLIPSOIDS_INTERNATIONAL,
    CRS_ELLIPSOIDS_BESSEL,
    CRS_ELLIPSOIDS_CLARKE_1866,
    CRS_ELLIPSOIDS_CLARKE_1880,
    CRS_ELLIPSOIDS_AIRY,
    CRS_ELLIPSOIDS_WGS60,
    CRS_ELLIPSOIDS_WGS66,
    CRS_ELLIPSOIDS_WGS72,
    CRS_ELLIPSOIDS_WGS84,
    CRS_ELLIPSOIDS_KRASSOVSKY,
    CRS_ELLIPSOIDS_EVEREST,
    CRS_ELLIPSOIDS_INTERNATIONAL_1967,
    CRS_ELLIPSOIDS_GRS80,
    CRS_ELLIPSOIDS_AUSTRALIAN,
    CRS_ELLIPSOIDS_MERIT,
    CRS_ELLIPSOIDS_SGS85,
    CRS_ELLIPSOIDS_IAU76,
    CRS_ELLIPSOIDS_APL4_9,
    CRS_ELLIPSOIDS_NWL9D,
    CRS_ELLIPSOIDS_MOD_AIRY,
    CRS_ELLIPSOIDS_ANDRAE,
    CRS_ELLIPSOIDS_AUST_SA,
    CRS_ELLIPSOIDS_GRS67,
    CRS_ELLIPSOIDS_BESS_NAM,
    CRS_ELLIPSOIDS_CPM,
    CRS_ELLIPSOIDS_DELMBR,
    CRS_ELLIPSOIDS_ENGELIS,
    CRS_ELLIPSOIDS_EVRST48,
    CRS_ELLIPSOIDS_EVRST56,
    CRS_ELLIPSOIDS_EVRTS69,
    CRS_ELLIPSOIDS_EVRTSTSS,
    CRS_ELLIPSOIDS_FRSCH60,
    CRS_ELLIPSOIDS_FSRCH60M,
    CRS_ELLIPSOIDS_FSCHR68,
    CRS_ELLIPSOIDS_HELMERT,
    CRS_ELLIPSOIDS_HOUGH,
    CRS_ELLIPSOIDS_KAULA,
    CRS_ELLIPSOIDS_LERCH,
    CRS_ELLIPSOIDS_MPRTS,
    CRS_ELLIPSOIDS_PLESSIS,
    CRS_ELLIPSOIDS_SEASIA,
    CRS_ELLIPSOIDS_WALBECK,
    CRS_ELLIPSOIDS_NAD27,
    CRS_ELLIPSOIDS_NAD83,
    CRS_ELLIPSOIDS_SPHERE
};

/**
 * Ellipsoids
 */
@interface CRSEllipsoids : NSObject

/**
 * Get a predefined ellipsoid by type
 *
 * @param type
 *            ellipsoid type
 * @return ellipsoid
 */
+(CRSEllipsoids *) fromType: (enum CRSEllipsoidsType) type;

/**
 * Get a predefined ellipsoid by name or short name
 *
 * @param name
 *            name or short name
 * @return ellipsoid or nil
 */
+(CRSEllipsoids *) fromName: (NSString *) name;

/**
 * Get the type
 *
 * @return type
 */
-(enum CRSEllipsoidsType) type;

/**
 * Get the name
 *
 * @return name
 */
-(NSString *) name;

/**
 * Get the names
 *
 * @return names
 */
-(NSArray<NSString *> *) names;

/**
 * Get the short name
 *
 * @return short name
 */
-(NSString *) shortName;

/**
 * Get the equator radius
 *
 * @return equator radius
 */
-(double) equatorRadius;

/**
 * Get the reciprocal flattening
 *
 * @return reciprocal flattening
 */
-(double) reciprocalFlattening;

/**
 * Get the a
 *
 * @return a
 */
-(double) a;

/**
 * Get the b
 *
 * @return b
 */
-(double) b;

/**
 * Get the eccentricity squared
 *
 * @return eccentricity squared
 */
-(double) eccentricitySquared;

@end
