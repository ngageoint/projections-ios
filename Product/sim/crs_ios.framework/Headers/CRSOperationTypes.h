//
//  CRSOperationTypes.h
//  crs-ios
//
//  Created by Brian Osborn on 7/16/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Coordinate Operation type
 */
enum CRSOperationType{
    CRS_OPERATION_COORDINATE,
    CRS_OPERATION_POINT_MOTION,
    CRS_OPERATION_MAP_PROJECTION,
    CRS_OPERATION_DERIVING_CONVERSION,
    CRS_OPERATION_ABRIDGED_COORDINATE_TRANSFORMATION
};

/**
 * Coordinate Operation Type names
 */
extern NSString * const CRS_OPERATION_COORDINATE_NAME;
extern NSString * const CRS_OPERATION_POINT_MOTION_NAME;
extern NSString * const CRS_OPERATION_MAP_PROJECTION_NAME;
extern NSString * const CRS_OPERATION_DERIVING_CONVERSION_NAME;
extern NSString * const CRS_OPERATION_ABRIDGED_COORDINATE_TRANSFORMATION_NAME;

/**
 * Coordinate Operation Type
 */
@interface CRSOperationTypes : NSObject

/**
 * Get the type name
 *
 * @param type
 *            type
 * @return type name
 */
+(NSString *) name: (enum CRSOperationType) type;

/**
 * Get the type from the name
 *
 * @param name
 *            type name
 * @return type
 */
+(enum CRSOperationType) type: (NSString *) name;

@end
