//
//  CRSDateTime.h
//  crs-ios
//
//  Created by Brian Osborn on 7/13/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Date and time
 */
@interface CRSDateTime : NSObject

/**
 *  Year
 */
@property (nonatomic) int year;

/**
 *  Month
 */
@property (nonatomic, strong) NSNumber *month;

/**
 *  Day
 */
@property (nonatomic, strong) NSNumber *day;

/**
 *  Hour
 */
@property (nonatomic, strong) NSNumber *hour;

/**
 *  Minute
 */
@property (nonatomic, strong) NSNumber *minute;

/**
 *  Second
 */
@property (nonatomic, strong) NSNumber *second;

/**
 *  Seconds fraction
 */
@property (nonatomic, strong) NSDecimalNumber *fraction;

/**
 *  Seconds fraction Text
 */
@property (nonatomic, strong) NSString *fractionText;

/**
 *  Local time zone hour
 */
@property (nonatomic, strong) NSNumber *timeZoneHour;

/**
 *  Local time zone minute
 */
@property (nonatomic, strong) NSNumber *timeZoneMinute;

/**
 * Parse the text into a Date Time
 *
 * @param text
 *            date time text
 * @return date time
 */
+(CRSDateTime *) parse: (NSString *) text;

/**
 * Attempt to parse the text into a Date Time
 *
 * @param text
 *            potential date time text
 * @return date time or null
 */
+(CRSDateTime *) tryParse: (NSString *) text;

/**
 *  Create
 *
 *  @return new instance
 */
+(CRSDateTime *) create;

/**
 *  Initialize
 *
 *  @return new instance
 */
-(instancetype) init;

/**
 *  Initialize
 *
 * @param year
 *            year
 *
 *  @return new instance
 */
-(instancetype) initWithYear: (int) year;

/**
 * Is an ordinal day
 *
 * @return true if ordinal day
 */
-(BOOL) isOrdinal;

/**
 * If date has a time precision
 *
 * @return true if has time
 */
-(BOOL) hasTime;

/**
 * Check if has a month
 *
 * @return true if has month
 */
-(BOOL) hasMonth;

/**
 * Check if has a day
 *
 * @return true if has day
 */
-(BOOL) hasDay;

/**
 * Check if has a hour
 *
 * @return true if has hour
 */
-(BOOL) hasHour;

/**
 * Check if has a minute
 *
 * @return true if has minute
 */
-(BOOL) hasMinute;

/**
 * Check if has a second
 *
 * @return true if has second
 */
-(BOOL) hasSecond;

/**
 * Check if has a fraction
 *
 * @return true if has fraction
 */
-(BOOL) hasFraction;

/**
 * Has a time zone hour
 *
 * @return true if has time zone hour
 */
-(BOOL) hasTimeZoneHour;

/**
 * Has a time zone minute
 *
 * @return true if has time zone minute
 */
-(BOOL) hasTimeZoneMinute;

/**
 * Is the time zone UTC
 *
 * @return true if UTC
 */
-(BOOL) isTimeZoneUTC;

/**
 * Set the time zone as UTC
 */
-(void) setTimeZoneUTC;

@end
