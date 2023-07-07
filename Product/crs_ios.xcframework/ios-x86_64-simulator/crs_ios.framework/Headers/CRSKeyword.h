//
//  CRSKeyword.h
//  crs-ios
//
//  Created by Brian Osborn on 7/22/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Coordinate Reference System Keyword
 */
enum CRSKeywordType{
    CRS_KEYWORD_ABRIDGEDTRANSFORMATION,
    CRS_KEYWORD_ANCHOR,
    CRS_KEYWORD_ANGLEUNIT,
    CRS_KEYWORD_AREA,
    CRS_KEYWORD_AXIS,
    CRS_KEYWORD_BASEENGCRS,
    CRS_KEYWORD_BASEGEODCRS,
    CRS_KEYWORD_BASEGEOGCRS,
    CRS_KEYWORD_BASEPARAMCRS,
    CRS_KEYWORD_BASEPROJCRS,
    CRS_KEYWORD_BASETIMECRS,
    CRS_KEYWORD_BASEVERTCRS,
    CRS_KEYWORD_BBOX,
    CRS_KEYWORD_BEARING,
    CRS_KEYWORD_BOUNDCRS,
    CRS_KEYWORD_CALENDAR,
    CRS_KEYWORD_CITATION,
    CRS_KEYWORD_CONVERSION,
    CRS_KEYWORD_COMPOUNDCRS,
    CRS_KEYWORD_CONCATENATEDOPERATION,
    CRS_KEYWORD_COORDINATEMETADATA,
    CRS_KEYWORD_COORDINATEOPERATION,
    CRS_KEYWORD_CS,
    CRS_KEYWORD_DATUM,
    CRS_KEYWORD_DERIVEDPROJCRS,
    CRS_KEYWORD_DERIVINGCONVERSION,
    CRS_KEYWORD_DYNAMIC,
    CRS_KEYWORD_EDATUM,
    CRS_KEYWORD_ELLIPSOID,
    CRS_KEYWORD_ENGCRS,
    CRS_KEYWORD_ENSEMBLE,
    CRS_KEYWORD_ENSEMBLEACCURACY,
    CRS_KEYWORD_EPOCH,
    CRS_KEYWORD_EXTENSION,
    CRS_KEYWORD_FRAMEEPOCH,
    CRS_KEYWORD_GEOCCS,
    CRS_KEYWORD_GEODCRS,
    CRS_KEYWORD_GEOGCS,
    CRS_KEYWORD_GEOGCRS,
    CRS_KEYWORD_GEOIDMODEL,
    CRS_KEYWORD_ID,
    CRS_KEYWORD_INTERPOLATIONCRS,
    CRS_KEYWORD_LENGTHUNIT,
    CRS_KEYWORD_LOCAL_CS,
    CRS_KEYWORD_MEMBER,
    CRS_KEYWORD_MERIDIAN,
    CRS_KEYWORD_METHOD,
    CRS_KEYWORD_MODEL,
    CRS_KEYWORD_OPERATIONACCURACY,
    CRS_KEYWORD_ORDER,
    CRS_KEYWORD_PARAMETER,
    CRS_KEYWORD_PARAMETERFILE,
    CRS_KEYWORD_PARAMETRICCRS,
    CRS_KEYWORD_PARAMETRICUNIT,
    CRS_KEYWORD_PDATUM,
    CRS_KEYWORD_POINTMOTIONOPERATION,
    CRS_KEYWORD_PRIMEM,
    CRS_KEYWORD_PROJCRS,
    CRS_KEYWORD_PROJCS,
    CRS_KEYWORD_REMARK,
    CRS_KEYWORD_SCALEUNIT,
    CRS_KEYWORD_SCOPE,
    CRS_KEYWORD_SOURCECRS,
    CRS_KEYWORD_STEP,
    CRS_KEYWORD_TARGETCRS,
    CRS_KEYWORD_TDATUM,
    CRS_KEYWORD_TIMECRS,
    CRS_KEYWORD_TIMEEXTENT,
    CRS_KEYWORD_TIMEORIGIN,
    CRS_KEYWORD_TIMEUNIT,
    CRS_KEYWORD_TOWGS84,
    CRS_KEYWORD_TRIAXIAL,
    CRS_KEYWORD_USAGE,
    CRS_KEYWORD_URI,
    CRS_KEYWORD_VDATUM,
    CRS_KEYWORD_VERSION,
    CRS_KEYWORD_VERT_CS,
    CRS_KEYWORD_VERTCRS,
    CRS_KEYWORD_VERTICALEXTENT
};

/**
 * Keyword
 */
@interface CRSKeyword : NSObject

/**
 * Get the type
 *
 * @return type
 */
-(enum CRSKeywordType) type;

/**
 * Get the name
 *
 * @return name
 */
-(NSString *) name;

/**
 * Get the keywords
 *
 * @return keywords
 */
-(NSArray<NSString *> *) keywords;

/**
 * Get the keyword type object from the keyword
 *
 * @param keyword
 *            CRS keyword
 * @return type object
 */
+(CRSKeyword *) keyword: (NSString *) keyword;

/**
 * Get the keyword type from the keyword
 *
 * @param keyword
 *            CRS keyword
 * @return type
 */
+(enum CRSKeywordType) type: (NSString *) keyword;

/**
 * Get the required keyword type object from the keyword
 *
 * @param keyword
 *            CRS keyword
 * @return type object
 */
+(CRSKeyword *) requiredKeyword: (NSString *) keyword;

/**
 * Get the required keyword type from the keyword
 *
 * @param keyword
 *            CRS keyword
 * @return type
 */
+(enum CRSKeywordType) requiredType: (NSString *) keyword;

/**
 * Get the keyword types object from the keyword
 *
 * @param keyword
 *            CRS keyword
 * @return type objects
 */
+(NSArray<CRSKeyword *> *) keywords: (NSString *) keyword;

/**
 * Get the keyword types from the keyword
 *
 * @param keyword
 *            CRS keyword
 * @return types
 */
+(NSArray<NSNumber *> *) types: (NSString *) keyword;

/**
 * Get the required keyword types object from the keyword
 *
 * @param keyword
 *            CRS keyword
 * @return type objects
 */
+(NSArray<CRSKeyword *> *) requiredKeywords: (NSString *) keyword;

/**
 * Get the required keyword types from the keyword
 *
 * @param keyword
 *            CRS keyword
 * @return types
 */
+(NSArray<NSNumber *> *) requiredTypes: (NSString *) keyword;

/**
 * Get the  keyword type object from the keyword type
 *
 * @param type
 *            keyword type
 * @return type object
 */
+(CRSKeyword *) keywordOfType: (enum CRSKeywordType) type;

/**
 * Get the keyword type name from the keyword
 *
 * @param type
 *            keyword type
 * @return type name
 */
+(NSString *) nameOfType: (enum CRSKeywordType) type;

@end
