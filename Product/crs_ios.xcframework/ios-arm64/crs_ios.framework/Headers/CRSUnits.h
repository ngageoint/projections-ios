//
//  CRSUnits.h
//  crs-ios
//
//  Created by Brian Osborn on 7/15/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSUnit.h"

/**
 * Common Unit Type
 */
enum CRSUnitsType{
    CRS_UNITS_MICROMETRE,
    CRS_UNITS_MILLIMETRE,
    CRS_UNITS_METRE,
    CRS_UNITS_KILOMETRE,
    CRS_UNITS_GERMAN_LEGAL_METRE,
    CRS_UNITS_US_SURVEY_FOOT,
    CRS_UNITS_FOOT,
    CRS_UNITS_MICRORADIAN,
    CRS_UNITS_MILLIRADIAN,
    CRS_UNITS_RADIAN,
    CRS_UNITS_ARC_SECOND,
    CRS_UNITS_ARC_MINUTE,
    CRS_UNITS_DEGREE,
    CRS_UNITS_GRAD,
    CRS_UNITS_UNITY,
    CRS_UNITS_BIN,
    CRS_UNITS_PARTS_PER_MILLION,
    CRS_UNITS_PASCAL,
    CRS_UNITS_HECTOPASCAL,
    CRS_UNITS_MICROSECOND,
    CRS_UNITS_MILLISECOND,
    CRS_UNITS_SECOND,
    CRS_UNITS_MINUTE,
    CRS_UNITS_HOUR,
    CRS_UNITS_DAY,
    CRS_UNITS_YEAR,
    CRS_UNITS_CALENDAR_SECOND,
    CRS_UNITS_CALENDAR_MONTH
};

// Common Unit Names
extern NSString * const CRS_UNITS_MICROMETRE_NAME;
extern NSString * const CRS_UNITS_MILLIMETRE_NAME;
extern NSString * const CRS_UNITS_METRE_NAME;
extern NSString * const CRS_UNITS_KILOMETRE_NAME;
extern NSString * const CRS_UNITS_GERMAN_LEGAL_METRE_NAME;
extern NSString * const CRS_UNITS_US_SURVEY_FOOT_NAME;
extern NSString * const CRS_UNITS_FOOT_NAME;
extern NSString * const CRS_UNITS_MICRORADIAN_NAME;
extern NSString * const CRS_UNITS_MILLIRADIAN_NAME;
extern NSString * const CRS_UNITS_RADIAN_NAME;
extern NSString * const CRS_UNITS_ARC_SECOND_NAME;
extern NSString * const CRS_UNITS_ARC_MINUTE_NAME;
extern NSString * const CRS_UNITS_DEGREE_NAME;
extern NSString * const CRS_UNITS_GRAD_NAME;
extern NSString * const CRS_UNITS_UNITY_NAME;
extern NSString * const CRS_UNITS_BIN_NAME;
extern NSString * const CRS_UNITS_PARTS_PER_MILLION_NAME;
extern NSString * const CRS_UNITS_PASCAL_NAME;
extern NSString * const CRS_UNITS_HECTOPASCAL_NAME;
extern NSString * const CRS_UNITS_MICROSECOND_NAME;
extern NSString * const CRS_UNITS_MILLISECOND_NAME;
extern NSString * const CRS_UNITS_SECOND_NAME;
extern NSString * const CRS_UNITS_MINUTE_NAME;
extern NSString * const CRS_UNITS_HOUR_NAME;
extern NSString * const CRS_UNITS_DAY_NAME;
extern NSString * const CRS_UNITS_YEAR_NAME;
extern NSString * const CRS_UNITS_CALENDAR_SECOND_NAME;
extern NSString * const CRS_UNITS_CALENDAR_MONTH_NAME;

/**
 * Common Units
 */
@interface CRSUnits : NSObject

/**
 * Get a unit from the unit name
 *
 * @param name
 *            unit name
 * @return unit
 */
+(CRSUnit *) unitFromName: (NSString *) name;

/**
 * Get a unit from the units type
 *
 * @param type
 *            units type
 * @return unit
 */
+(CRSUnit *) unitFromType: (enum CRSUnitsType) type;

/**
 * Get a units type from the unit name
 *
 * @param name
 *            unit name
 * @return units type
 */
+(enum CRSUnitsType) typeFromName: (NSString *) name;

/**
 * Get a units type from the unit
 *
 * @param unit
 *            unit
 * @return units type
 */
+(enum CRSUnitsType) typeFromUnit: (CRSUnit *) unit;

/**
 * Get a micrometre unit
 *
 * @return micrometre unit
 */
+(CRSUnit *) micrometre;

/**
 * Get a millimetre unit
 *
 * @return millimetre unit
 */
+(CRSUnit *) millimetre;

/**
 * Get a metre unit
 *
 * @return metre unit
 */
+(CRSUnit *) metre;

/**
 * Get a kilometre unit
 *
 * @return kilometre unit
 */
+(CRSUnit *) kilometre;

/**
 * Get a German legal metre unit
 *
 * @return German legal metre unit
 */
+(CRSUnit *) GermanLegalMetre;

/**
 * Get a US survey foot unit
 *
 * @return US survey foot unit
 */
+(CRSUnit *) USSurveyFoot;

/**
 * Get a foot unit
 *
 * @return foot unit
 */
+(CRSUnit *) foot;

/**
 * Get a microradian unit
 *
 * @return microradian unit
 */
+(CRSUnit *) microradian;

/**
 * Get a milliradian unit
 *
 * @return milliradian unit
 */
+(CRSUnit *) milliradian;

/**
 * Get a radian unit
 *
 * @return radian unit
 */
+(CRSUnit *) radian;

/**
 * Get an arc-second unit
 *
 * @return arc-second unit
 */
+(CRSUnit *) arcSecond;

/**
 * Get an arc-minute unit
 *
 * @return arc-minute unit
 */
+(CRSUnit *) arcMinute;

/**
 * Get a degree unit
 *
 * @return degree unit
 */
+(CRSUnit *) degree;

/**
 * Get a grad unit
 *
 * @return grad unit
 */
+(CRSUnit *) grad;

/**
 * Get a unity unit
 *
 * @return unity unit
 */
+(CRSUnit *) unity;

/**
 * Get a bin unit
 *
 * @return bin unit
 */
+(CRSUnit *) bin;

/**
 * Get a parts per million unit
 *
 * @return parts per million unit
 */
+(CRSUnit *) partsPerMillion;

/**
 * Get a pascal unit
 *
 * @return pascal unit
 */
+(CRSUnit *) pascalUnit;

/**
 * Get a hectopascal unit
 *
 * @return hectopascal unit
 */
+(CRSUnit *) hectopascal;

/**
 * Get a microsecond unit
 *
 * @return microsecond unit
 */
+(CRSUnit *) microsecond;

/**
 * Get a millisecond unit
 *
 * @return millisecond unit
 */
+(CRSUnit *) millisecond;

/**
 * Get a second unit
 *
 * @return second unit
 */
+(CRSUnit *) second;

/**
 * Get a minute unit
 *
 * @return minute unit
 */
+(CRSUnit *) minute;

/**
 * Get a hour unit
 *
 * @return hour unit
 */
+(CRSUnit *) hour;

/**
 * Get a day unit
 *
 * @return day unit
 */
+(CRSUnit *) day;

/**
 * Get a year unit
 *
 * @return year unit
 */
+(CRSUnit *) year;

/**
 * Get a calendar second unit
 *
 * @return calendar second unit
 */
+(CRSUnit *) calendarSecond;

/**
 * Get a calendar month unit
 *
 * @return calendar month unit
 */
+(CRSUnit *) calendarMonth;

/**
 * Get the unit type from the  name
 *
 * @param name
 *            unit name
 * @return unit type
 */
+(enum CRSUnitType) unitTypeFromName: (NSString *) name;

/**
 * Get the default unit for the unit type
 *
 * @param type
 *            unit type
 * @return default unit or null if no default
 */
+(CRSUnit *) defaultUnit: (enum CRSUnitType) type;

/**
 * Determine if values can be converted between the two units
 *
 * @param unit1
 *            first unit
 * @param unit2
 *            second unit
 * @return true if can convert
 */
+(BOOL) canConvertBetweenUnit: (CRSUnit *) unit1 andUnit: (CRSUnit *) unit2;

/**
 * Convert the value from a unit to a same typed unit, both with conversion
 * factors
 *
 * @param value
 *            value to convert
 * @param from
 *            unit to convert from
 * @param to
 *            unit to convert to
 * @return converted value
 */
+(double) convertValue: (double) value fromUnit: (CRSUnit *) from toUnit: (CRSUnit *) to;

@end
