//
//  CRSOperationMethods.h
//  crs-ios
//
//  Created by Brian Osborn on 7/16/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSOperationParameters.h"

/**
 * Common Operation Methods
 */
enum CRSOperationMethodType{
    CRS_METHOD_ALBERS_EQUAL_AREA,
    CRS_METHOD_AMERICAN_POLYCONIC,
    CRS_METHOD_CASSINI_SOLDNER,
    CRS_METHOD_COORDINATE_FRAME_ROTATION,
    CRS_METHOD_EQUIDISTANT_CYLINDRICAL,
    CRS_METHOD_GEOCENTRIC_TRANSLATIONS,
    CRS_METHOD_HOTINE_OBLIQUE_MERCATOR_A,
    CRS_METHOD_HOTINE_OBLIQUE_MERCATOR_B,
    CRS_METHOD_KROVAK,
    CRS_METHOD_LAMBERT_AZIMUTHAL_EQUAL_AREA,
    CRS_METHOD_LAMBERT_CONIC_CONFORMAL_1SP,
    CRS_METHOD_LAMBERT_CONIC_CONFORMAL_2SP,
    CRS_METHOD_LAMBERT_CYLINDRICAL_EQUAL_AREA,
    CRS_METHOD_LONGITUDE_ROTATION,
    CRS_METHOD_MERCATOR_A,
    CRS_METHOD_MERCATOR_B,
    CRS_METHOD_MOLODENSKY_BADEKAS,
    CRS_METHOD_NADCON,
    CRS_METHOD_NADCON5,
    CRS_METHOD_NEW_ZEALAND_MAP_GRID,
    CRS_METHOD_NTV2,
    CRS_METHOD_OBLIQUE_STEREOGRAPHIC,
    CRS_METHOD_POLAR_STEREOGRAPHIC_A,
    CRS_METHOD_POLAR_STEREOGRAPHIC_B,
    CRS_METHOD_POLAR_STEREOGRAPHIC_C,
    CRS_METHOD_POPULAR_VISUALISATION_PSEUDO_MERCATOR,
    CRS_METHOD_POSITION_VECTOR_TRANSFORMATION,
    CRS_METHOD_TRANSVERSE_MERCATOR,
    CRS_METHOD_TRANSVERSE_MERCATOR_SOUTH_ORIENTATED,
    CRS_METHOD_VERTICAL_OFFSET
};

/**
 * Operation Methods
 */
@interface CRSOperationMethods : NSObject

/**
 * Get the type
 *
 * @return type
 */
-(enum CRSOperationMethodType) type;

/**
 * Get the name
 *
 * @return name
 */
-(NSString *) name;

/**
 * Get the operation type
 *
 * @return operation type
 */
-(enum CRSOperationType) operationType;

/**
 * Get the aliases
 *
 * @return aliases
 */
-(NSArray<NSString *> *) aliases;

/**
 * Get the code
 *
 * @return code
 */
-(int) code;

/**
 * Get the parameter codes
 *
 * @return parameter codes
 */
-(NSArray<NSNumber *> *) parameterCodes;

/**
 * Number of parameters
 *
 * @return parameter count
 */
-(int) numParameters;

/**
 * Get the parameter code at the index
 *
 * @param index
 *            parameter index
 * @return parameter code
 */
-(int) parameterCodeAtIndex: (int) index;

/**
 * Get the parameter at the index
 *
 * @param index
 *            parameter index
 * @return parameter
 */
-(CRSOperationParameters *) parameterAtIndex: (int) index;

/**
 * Get the parameters
 *
 * @return parameters
 */
-(NSArray<CRSOperationParameters *> *) parameters;

/**
 * Get the method from the method type
 *
 * @param type
 *            operation method type
 * @return parameter
 */
+(CRSOperationMethods *) method: (enum CRSOperationMethodType) type;

/**
 * Get the method from the alias
 *
 * @param name
 *            name or alias
 * @return method
 */
+(CRSOperationMethods *) methodFromName: (NSString *) name;

/**
 * Get the methods from the alias
 *
 * @param name
 *            name or alias
 * @return methods
 */
+(NSArray<CRSOperationMethods *> *) methodsFromName: (NSString *) name;

/**
 * Get the method from the code
 *
 * @param code
 *            method code
 * @return method
 */
+(CRSOperationMethods *) methodFromCode: (int) code;

@end
