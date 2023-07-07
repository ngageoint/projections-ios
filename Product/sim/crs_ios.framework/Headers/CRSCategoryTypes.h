//
//  CRSCategoryTypes.h
//  crs-ios
//
//  Created by Brian Osborn on 7/12/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Well-known text representation of coordinate reference systems category type
 */
enum CRSCategoryType{
    CRS_CATEGORY_CRS,
    CRS_CATEGORY_OPERATION,
    CRS_CATEGORY_METADATA
};

/**
 * Category Type names
 */
extern NSString * const CRS_CATEGORY_CRS_NAME;
extern NSString * const CRS_CATEGORY_OPERATION_NAME;
extern NSString * const CRS_CATEGORY_METADATA_NAME;

/**
 * Category Type
 */
@interface CRSCategoryTypes : NSObject

/**
 * Get the type name
 *
 * @param type
 *            type
 * @return type name
 */
+(NSString *) name: (enum CRSCategoryType) type;

/**
 * Get the type from the name
 *
 * @param name
 *            type name
 * @return type
 */
+(enum CRSCategoryType) type: (NSString *) name;

@end
