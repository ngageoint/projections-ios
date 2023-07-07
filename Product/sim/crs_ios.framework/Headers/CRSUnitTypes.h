//
//  CRSUnitTypes.h
//  crs-ios
//
//  Created by Brian Osborn on 7/13/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Unit Type
 */
enum CRSUnitType{
    CRS_UNIT_NONE,
    CRS_UNIT_ANGLE,
    CRS_UNIT_LENGTH,
    CRS_UNIT_PARAMETRIC,
    CRS_UNIT_SCALE,
    CRS_UNIT_TIME,
    CRS_UNIT
};

/**
 * Unit Type names
 */
extern NSString * const CRS_UNIT_ANGLE_NAME;
extern NSString * const CRS_UNIT_LENGTH_NAME;
extern NSString * const CRS_UNIT_PARAMETRIC_NAME;
extern NSString * const CRS_UNIT_SCALE_NAME;
extern NSString * const CRS_UNIT_TIME_NAME;
extern NSString * const CRS_UNIT_NAME;

/**
 * Unit Type
 */
@interface CRSUnitTypes : NSObject

/**
 * Get the type name
 *
 * @param type
 *            type
 * @return type name
 */
+(NSString *) name: (enum CRSUnitType) type;

/**
 * Get the type from the name
 *
 * @param name
 *            type name
 * @return type
 */
+(enum CRSUnitType) type: (NSString *) name;

@end
