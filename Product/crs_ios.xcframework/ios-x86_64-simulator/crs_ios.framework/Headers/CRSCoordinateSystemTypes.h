//
//  CRSCoordinateSystemTypes.h
//  crs-ios
//
//  Created by Brian Osborn on 7/15/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Coordinate System Type
 */
enum CRSCoordinateSystemType{
    CRS_CS_AFFINE,
    CRS_CS_CARTESIAN,
    CRS_CS_CYLINDRICAL,
    CRS_CS_ELLIPSOIDAL,
    CRS_CS_LINEAR,
    CRS_CS_ORDINAL,
    CRS_CS_PARAMETRIC,
    CRS_CS_POLAR,
    CRS_CS_SPHERICAL,
    CRS_CS_TEMPORAL_COUNT,
    CRS_CS_TEMPORAL_DATE_TIME,
    CRS_CS_TEMPORAL_MEASURE,
    CRS_CS_VERTICAL
};

/**
 * Coordinate System Type names
 */
extern NSString * const CRS_CS_AFFINE_NAME;
extern NSString * const CRS_CS_CARTESIAN_NAME;
extern NSString * const CRS_CS_CYLINDRICAL_NAME;
extern NSString * const CRS_CS_ELLIPSOIDAL_NAME;
extern NSString * const CRS_CS_LINEAR_NAME;
extern NSString * const CRS_CS_ORDINAL_NAME;
extern NSString * const CRS_CS_PARAMETRIC_NAME;
extern NSString * const CRS_CS_POLAR_NAME;
extern NSString * const CRS_CS_SPHERICAL_NAME;
extern NSString * const CRS_CS_TEMPORAL_COUNT_NAME;
extern NSString * const CRS_CS_TEMPORAL_DATE_TIME_NAME;
extern NSString * const CRS_CS_TEMPORAL_MEASURE_NAME;
extern NSString * const CRS_CS_VERTICAL_NAME;

/**
 * Coordinate System Type
 */
@interface CRSCoordinateSystemTypes : NSObject

/**
 * Get the type name
 *
 * @param type
 *            type
 * @return type name
 */
+(NSString *) name: (enum CRSCoordinateSystemType) type;

/**
 * Get the type from the name
 *
 * @param name
 *            type name
 * @return type
 */
+(enum CRSCoordinateSystemType) type: (NSString *) name;

@end
