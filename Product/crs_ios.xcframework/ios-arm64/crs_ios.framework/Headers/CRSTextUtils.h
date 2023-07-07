//
//  CRSTextUtils.h
//  crs-ios
//
//  Created by Brian Osborn on 7/22/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSCoordinateSystemTypes.h"
#import "CRSKeyword.h"
#import "CRSUnitTypes.h"
#import "CRSTypes.h"

/**
 * CRS Well-Known Text Utilities
 */
@interface CRSTextUtils : NSObject

/**
 * Is the text a left delimiter
 *
 * @param text
 *            wkt text token
 * @return true if left delimiter
 */
+(BOOL) isLeftDelimiter: (NSString *) text;

/**
 * Is the text a right delimiter
 *
 * @param text
 *            wkt text token
 * @return true if right delimiter
 */
+(BOOL) isRightDelimiter: (NSString *) text;

/**
 * Is the Coordinate System Type a spatial type
 *
 * @param type
 *            coordinate system type
 * @return true if a spatial type
 */
+(BOOL) isSpatial: (enum CRSCoordinateSystemType) type;

/**
 * Is the Coordinate System Type a temporal count or measure type
 *
 * @param type
 *            coordinate system type
 * @return true if a spatial type
 */
+(BOOL) isTemporalCountMeasure: (enum CRSCoordinateSystemType) type;

/**
 * Is the Coordinate System Type an ordinal or temporal date time type
 *
 * @param type
 *            coordinate system type
 * @return true if a spatial type
 */
+(BOOL) isOrdinalDateTime: (enum CRSCoordinateSystemType) type;

/**
 * Get the unit type from the keyword
 *
 * @param keyword
 *            coordinate reference system keyword
 * @return unit type
 */
+(enum CRSUnitType) unitTypeOfKeyword: (CRSKeyword *) keyword;

/**
 * Get the unit type from the keyword type
 *
 * @param keyword
 *            coordinate reference system keyword type
 * @return unit type
 */
+(enum CRSUnitType) unitType: (enum CRSKeywordType) keyword;

/**
 * Get the Coordinate Reference System Type
 *
 * @param keyword
 *            coordinate reference system keyword
 * @return coordinate reference system type
 */
+(enum CRSType) coordinateReferenceSystemType: (enum CRSKeywordType) keyword;

/**
 * Get an int from a string
 *
 * @param string
 *            string int value
 * @return integer
 */
+(int) intFromString: (NSString *) string;

/**
 * Get a double from a string
 *
 * @param string
 *            string double value
 * @return double
 */
+(double) doubleFromString: (NSString *) string;

/**
 * Get a decimal number from a string
 *
 * @param string
 *            string double value
 * @return decimal number
 */
+(NSDecimalNumber *) decimalNumberFromString: (NSString *) string;

/**
 * Get text from a double
 *
 * @param value
 *            double value
 * @return text value
 */
+(NSString *) textFromDouble: (double) value;

/**
 * Get text from a decimal number
 *
 * @param decimalNumber
 *            decimal number value
 * @return text value
 */
+(NSString *) textFromDecimalNumber: (NSDecimalNumber *) decimalNumber;

/**
 * Convert the WKT to a pretty WKT string, 4 space indents
 *
 * @param wkt
 *            well-known text
 * @return pretty wkt
 */
+(NSString *) pretty: (NSString *) wkt;

/**
 * Convert the WKT to a pretty WKT string, tab indents
 *
 * @param wkt
 *            well-known text
 * @return pretty wkt
 */
+(NSString *) prettyTabIndent: (NSString *) wkt;

/**
 * Convert the WKT to a pretty WKT string, no indents
 *
 * @param wkt
 *            well-known text
 * @return pretty wkt
 */
+(NSString *) prettyNoIndent: (NSString *) wkt;

/**
 * Convert the WKT to a pretty WKT string
 *
 * @param wkt
 *            well-known text
 * @param indent
 *            indent string
 * @return pretty wkt
 */
+(NSString *) pretty: (NSString *) wkt withIndent: (NSString *) indent;

/**
 * Convert the WKT to a pretty WKT string
 *
 * @param wkt
 *            well-known text
 * @param newline
 *            newline string
 * @param indent
 *            indent string
 * @return pretty wkt
 */
+(NSString *) pretty: (NSString *) wkt withNewline: (NSString *) newline andIndent: (NSString *) indent;

@end
