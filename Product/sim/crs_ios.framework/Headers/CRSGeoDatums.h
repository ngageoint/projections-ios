//
//  CRSGeoDatums.h
//  crs-ios
//
//  Created by Brian Osborn on 9/2/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSEllipsoids.h"

/**
 * Common Geo Datums
 */
enum CRSGeoDatumType{
    CRS_DATUM_WGS84,
    CRS_DATUM_GGRS87,
    CRS_DATUM_NAD83,
    CRS_DATUM_ETRS89,
    CRS_DATUM_NAD27,
    CRS_DATUM_POTSDAM,
    CRS_DATUM_CARTHAGE,
    CRS_DATUM_HERMANNSKOGEL,
    CRS_DATUM_IRE65,
    CRS_DATUM_NZGD49,
    CRS_DATUM_OSGB36
};

/**
 * Geo Datums
 */
@interface CRSGeoDatums : NSObject

/**
 * Get a predefined geo datum by type
 *
 * @param type
 *            geo datum type
 * @return geo datum
 */
+(CRSGeoDatums *) fromType: (enum CRSGeoDatumType) type;

/**
 * Get a predefined geo datum by name
 *
 * @param name
 *            name
 * @return geo datum or nil
 */
+(CRSGeoDatums *) fromName: (NSString *) name;

/**
 * Get the type
 *
 * @return type
 */
-(enum CRSGeoDatumType) type;

/**
 * Get the code
 *
 * @return code
 */
-(NSString *) code;

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
 * Get the transform
 *
 * @return transform
 */
-(NSArray<NSDecimalNumber *> *) transform;

/**
 * Get the ellipsoid
 *
 * @return ellipsoid
 */
-(CRSEllipsoids *) ellipsoid;

@end
