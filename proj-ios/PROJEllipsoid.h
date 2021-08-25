//
//  PROJEllipsoid.h
//  proj-ios
//
//  Created by Brian Osborn on 8/25/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Ellipsoid Types
 */
enum PROJEllipsoidType{
    PROJ_ELLIPSOID_INTERNATIONAL,
    PROJ_ELLIPSOID_BESSEL,
    PROJ_ELLIPSOID_CLARKE_1866,
    PROJ_ELLIPSOID_CLARKE_1880,
    PROJ_ELLIPSOID_AIRY,
    PROJ_ELLIPSOID_WGS60,
    PROJ_ELLIPSOID_WGS66,
    PROJ_ELLIPSOID_WGS72,
    PROJ_ELLIPSOID_WGS84,
    PROJ_ELLIPSOID_KRASSOVSKY,
    PROJ_ELLIPSOID_EVEREST,
    PROJ_ELLIPSOID_INTERNATIONAL_1967,
    PROJ_ELLIPSOID_GRS80,
    PROJ_ELLIPSOID_AUSTRALIAN,
    PROJ_ELLIPSOID_MERIT,
    PROJ_ELLIPSOID_SGS85,
    PROJ_ELLIPSOID_IAU76,
    PROJ_ELLIPSOID_APL4_9,
    PROJ_ELLIPSOID_NWL9D,
    PROJ_ELLIPSOID_MOD_AIRY,
    PROJ_ELLIPSOID_ANDRAE,
    PROJ_ELLIPSOID_AUST_SA,
    PROJ_ELLIPSOID_GRS67,
    PROJ_ELLIPSOID_BESS_NAM,
    PROJ_ELLIPSOID_CPM,
    PROJ_ELLIPSOID_DELMBR,
    PROJ_ELLIPSOID_ENGELIS,
    PROJ_ELLIPSOID_EVRST48,
    PROJ_ELLIPSOID_EVRST56,
    PROJ_ELLIPSOID_EVRTS69,
    PROJ_ELLIPSOID_EVRTSTSS,
    PROJ_ELLIPSOID_FRSCH60,
    PROJ_ELLIPSOID_FSRCH60M,
    PROJ_ELLIPSOID_FSCHR68,
    PROJ_ELLIPSOID_HELMERT,
    PROJ_ELLIPSOID_HOUGH,
    PROJ_ELLIPSOID_KAULA,
    PROJ_ELLIPSOID_LERCH,
    PROJ_ELLIPSOID_MPRTS,
    PROJ_ELLIPSOID_PLESSIS,
    PROJ_ELLIPSOID_SEASIA,
    PROJ_ELLIPSOID_WALBECK,
    PROJ_ELLIPSOID_NAD27,
    PROJ_ELLIPSOID_NAD83,
    PROJ_ELLIPSOID_SPHERE
};

/**
 * Ellipsoid
 */
@interface PROJEllipsoid : NSObject

/**
 * Get a predefined proj4 ellipsoid by type
 *
 * @param type
 *            ellipsoid type
 * @return ellipsoid
 */
+(PROJEllipsoid *) fromType: (enum PROJEllipsoidType) type;

/**
 * Get a predefined proj4 ellipsoid by name or short name
 *
 * @param name
 *            name or short name
 * @return ellipsoid or nil
 */
+(PROJEllipsoid *) fromName: (NSString *) name;

/**
 * Get the type
 *
 * @return type
 */
-(enum PROJEllipsoidType) type;

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

/**
 * Ellipsoid equator radius and eccentricity squared equality comparison
 *
 * @param ellipsoid
 *            ellipsoid
 * @return true if equal
 */
-(BOOL) isEqualToEllipsoid: (PROJEllipsoid *) ellipsoid;

/**
 * Ellipsoid equator radius and eccentricity squared within tolerance equality comparison
 *
 * @param ellipsoid
 *            ellipsoid
 * @param e2Tolerance
 *            eccentricity squared tolerance
 * @return true if equal
 */
-(BOOL) isEqualToEllipsoid: (PROJEllipsoid *) ellipsoid withTolerance: (double) e2Tolerance;

@end
