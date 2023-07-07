//
//  CRSTypes.h
//  crs-ios
//
//  Created by Brian Osborn on 7/12/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCategoryTypes.h"

/**
 * Well-known text representation of coordinate reference systems category type
 */
enum CRSType{
    CRS_TYPE_BOUND,
    CRS_TYPE_COMPOUND,
    CRS_TYPE_CONCATENATED_OPERATION,
    CRS_TYPE_COORDINATE_METADATA,
    CRS_TYPE_COORDINATE_OPERATION,
    CRS_TYPE_DERIVED,
    CRS_TYPE_ENGINEERING,
    CRS_TYPE_GEODETIC,
    CRS_TYPE_GEOGRAPHIC,
    CRS_TYPE_PARAMETRIC,
    CRS_TYPE_POINT_MOTION_OPERATION,
    CRS_TYPE_PROJECTED,
    CRS_TYPE_TEMPORAL,
    CRS_TYPE_VERTICAL
};

/**
 * CRS Type names
 */
extern NSString * const CRS_TYPE_BOUND_NAME;
extern NSString * const CRS_TYPE_COMPOUND_NAME;
extern NSString * const CRS_TYPE_CONCATENATED_OPERATION_NAME;
extern NSString * const CRS_TYPE_COORDINATE_METADATA_NAME;
extern NSString * const CRS_TYPE_COORDINATE_OPERATION_NAME;
extern NSString * const CRS_TYPE_DERIVED_NAME;
extern NSString * const CRS_TYPE_ENGINEERING_NAME;
extern NSString * const CRS_TYPE_GEODETIC_NAME;
extern NSString * const CRS_TYPE_GEOGRAPHIC_NAME;
extern NSString * const CRS_TYPE_PARAMETRIC_NAME;
extern NSString * const CRS_TYPE_POINT_MOTION_OPERATION_NAME;
extern NSString * const CRS_TYPE_PROJECTED_NAME;
extern NSString * const CRS_TYPE_TEMPORAL_NAME;
extern NSString * const CRS_TYPE_VERTICAL_NAME;

/**
 * CRS Type
 */
@interface CRSTypes : NSObject

/**
 * Get the type name
 *
 * @param type
 *            type
 * @return type name
 */
+(NSString *) name: (enum CRSType) type;

/**
 * Get the type names
 *
 * @param types
 *            types
 * @return type names
 */
+(NSArray<NSString *> *) names: (NSArray<NSNumber *> *) types;

/**
 * Get the type from the name
 *
 * @param name
 *            type name
 * @return type
 */
+(enum CRSType) type: (NSString *) name;

/**
 *  Get the category type
 *
 *  @param crsType CRS type
 *
 *  @return category type
 */
+(enum CRSCategoryType) categoryType: (enum CRSType) crsType;

@end
