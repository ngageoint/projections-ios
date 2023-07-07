//
//  CRSAxisDirectionTypes.h
//  crs-ios
//
//  Created by Brian Osborn on 7/14/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Axis Direction Type
 */
enum CRSAxisDirectionType{
    CRS_AXIS_AFT,
    CRS_AXIS_AWAY_FROM,
    CRS_AXIS_CLOCKWISE,
    CRS_AXIS_COLUMN_NEGATIVE,
    CRS_AXIS_COLUMN_POSITIVE,
    CRS_AXIS_COUNTER_CLOCKWISE,
    CRS_AXIS_DISPLAY_DOWN,
    CRS_AXIS_DISPLAY_LEFT,
    CRS_AXIS_DISPLAY_RIGHT,
    CRS_AXIS_DISPLAY_UP,
    CRS_AXIS_DOWN,
    CRS_AXIS_EAST,
    CRS_AXIS_EAST_NORTH_EAST,
    CRS_AXIS_EAST_SOUTH_EAST,
    CRS_AXIS_FORWARD,
    CRS_AXIS_FUTURE,
    CRS_AXIS_GEOCENTRIC_X,
    CRS_AXIS_GEOCENTRIC_Y,
    CRS_AXIS_GEOCENTRIC_Z,
    CRS_AXIS_NORTH,
    CRS_AXIS_NORTH_EAST,
    CRS_AXIS_NORTH_NORTH_EAST,
    CRS_AXIS_NORTH_NORTH_WEST,
    CRS_AXIS_NORTH_WEST,
    CRS_AXIS_PAST,
    CRS_AXIS_PORT,
    CRS_AXIS_ROW_NEGATIVE,
    CRS_AXIS_ROW_POSITIVE,
    CRS_AXIS_SOUTH,
    CRS_AXIS_SOUTH_EAST,
    CRS_AXIS_SOUTH_SOUTH_EAST,
    CRS_AXIS_SOUTH_SOUTH_WEST,
    CRS_AXIS_SOUTH_WEST,
    CRS_AXIS_STARBOARD,
    CRS_AXIS_TOWARDS,
    CRS_AXIS_UNSPECIFIED,
    CRS_AXIS_UP,
    CRS_AXIS_WEST,
    CRS_AXIS_WEST_NORTH_WEST,
    CRS_AXIS_WEST_SOUTH_WEST
};

/**
 * Axis Direction Type names
 */
extern NSString * const CRS_AXIS_AFT_NAME;
extern NSString * const CRS_AXIS_AWAY_FROM_NAME;
extern NSString * const CRS_AXIS_CLOCKWISE_NAME;
extern NSString * const CRS_AXIS_COLUMN_NEGATIVE_NAME;
extern NSString * const CRS_AXIS_COLUMN_POSITIVE_NAME;
extern NSString * const CRS_AXIS_COUNTER_CLOCKWISE_NAME;
extern NSString * const CRS_AXIS_DISPLAY_DOWN_NAME;
extern NSString * const CRS_AXIS_DISPLAY_LEFT_NAME;
extern NSString * const CRS_AXIS_DISPLAY_RIGHT_NAME;
extern NSString * const CRS_AXIS_DISPLAY_UP_NAME;
extern NSString * const CRS_AXIS_DOWN_NAME;
extern NSString * const CRS_AXIS_EAST_NAME;
extern NSString * const CRS_AXIS_EAST_NORTH_EAST_NAME;
extern NSString * const CRS_AXIS_EAST_SOUTH_EAST_NAME;
extern NSString * const CRS_AXIS_FORWARD_NAME;
extern NSString * const CRS_AXIS_FUTURE_NAME;
extern NSString * const CRS_AXIS_GEOCENTRIC_X_NAME;
extern NSString * const CRS_AXIS_GEOCENTRIC_Y_NAME;
extern NSString * const CRS_AXIS_GEOCENTRIC_Z_NAME;
extern NSString * const CRS_AXIS_NORTH_NAME;
extern NSString * const CRS_AXIS_NORTH_EAST_NAME;
extern NSString * const CRS_AXIS_NORTH_NORTH_EAST_NAME;
extern NSString * const CRS_AXIS_NORTH_NORTH_WEST_NAME;
extern NSString * const CRS_AXIS_NORTH_WEST_NAME;
extern NSString * const CRS_AXIS_PAST_NAME;
extern NSString * const CRS_AXIS_PORT_NAME;
extern NSString * const CRS_AXIS_ROW_NEGATIVE_NAME;
extern NSString * const CRS_AXIS_ROW_POSITIVE_NAME;
extern NSString * const CRS_AXIS_SOUTH_NAME;
extern NSString * const CRS_AXIS_SOUTH_EAST_NAME;
extern NSString * const CRS_AXIS_SOUTH_SOUTH_EAST_NAME;
extern NSString * const CRS_AXIS_SOUTH_SOUTH_WEST_NAME;
extern NSString * const CRS_AXIS_SOUTH_WEST_NAME;
extern NSString * const CRS_AXIS_STARBOARD_NAME;
extern NSString * const CRS_AXIS_TOWARDS_NAME;
extern NSString * const CRS_AXIS_UNSPECIFIED_NAME;
extern NSString * const CRS_AXIS_UP_NAME;
extern NSString * const CRS_AXIS_WEST_NAME;
extern NSString * const CRS_AXIS_WEST_NORTH_WEST_NAME;
extern NSString * const CRS_AXIS_WEST_SOUTH_WEST_NAME;

/**
 * Axis Direction Type
 */
@interface CRSAxisDirectionTypes : NSObject

/**
 * Get the type name
 *
 * @param type
 *            type
 * @return type name
 */
+(NSString *) name: (enum CRSAxisDirectionType) type;

/**
 * Get the type from the name
 *
 * @param name
 *            type name
 * @return type
 */
+(enum CRSAxisDirectionType) type: (NSString *) name;

@end
