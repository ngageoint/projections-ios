//
//  CRSOperationParameters.h
//  crs-ios
//
//  Created by Brian Osborn on 7/16/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "CRSOperationTypes.h"
#import "CRSUnitTypes.h"

/**
 * Common Operation Parameters
 */
enum CRSOperationParameterType{
    CRS_PARAMETER_ANGLE_FROM_RECTIFIED_TO_SKEW_GRID,
    CRS_PARAMETER_AZIMUTH_OF_INITIAL_LINE,
    CRS_PARAMETER_CO_LATITUDE_OF_CONE_AXIS,
    CRS_PARAMETER_EASTING_AT_FALSE_ORIGIN,
    CRS_PARAMETER_EASTING_AT_PROJECTION_CENTRE,
    CRS_PARAMETER_ELLIPSOIDAL_HEIGHT_DIFFERENCE_FILE,
    CRS_PARAMETER_FALSE_EASTING,
    CRS_PARAMETER_FALSE_NORTHING,
    CRS_PARAMETER_LATITUDE_AND_LONGITUDE_DIFFERENCE_FILE,
    CRS_PARAMETER_LATITUDE_DIFFERENCE_FILE,
    CRS_PARAMETER_LATITUDE_OF_1ST_STANDARD_PARALLEL,
    CRS_PARAMETER_LATITUDE_OF_2ND_STANDARD_PARALLEL,
    CRS_PARAMETER_LATITUDE_OF_FALSE_ORIGIN,
    CRS_PARAMETER_LATITUDE_OF_NATURAL_ORIGIN,
    CRS_PARAMETER_LATITUDE_OF_PROJECTION_CENTRE,
    CRS_PARAMETER_LATITUDE_OF_PSEUDO_STANDARD_PARALLEL,
    CRS_PARAMETER_LONGITUDE_DIFFERENCE_FILE,
    CRS_PARAMETER_LONGITUDE_OF_FALSE_ORIGIN,
    CRS_PARAMETER_LONGITUDE_OF_NATURAL_ORIGIN,
    CRS_PARAMETER_LONGITUDE_OF_ORIGIN,
    CRS_PARAMETER_LONGITUDE_OF_PROJECTION_CENTRE,
    CRS_PARAMETER_NORTHING_AT_FALSE_ORIGIN,
    CRS_PARAMETER_NORTHING_AT_PROJECTION_CENTRE,
    CRS_PARAMETER_ORDINATE_1_OF_EVALUATION_POINT,
    CRS_PARAMETER_ORDINATE_2_OF_EVALUATION_POINT,
    CRS_PARAMETER_ORDINATE_3_OF_EVALUATION_POINT,
    CRS_PARAMETER_SCALE_DIFFERENCE,
    CRS_PARAMETER_SCALE_FACTOR_AT_NATURAL_ORIGIN,
    CRS_PARAMETER_SCALE_FACTOR_ON_INITIAL_LINE,
    CRS_PARAMETER_SCALE_FACTOR_ON_PSEUDO_STANDARD_PARALLEL,
    CRS_PARAMETER_VERTICAL_OFFSET,
    CRS_PARAMETER_X_AXIS_ROTATION,
    CRS_PARAMETER_X_AXIS_TRANSLATION,
    CRS_PARAMETER_Y_AXIS_ROTATION,
    CRS_PARAMETER_Y_AXIS_TRANSLATION,
    CRS_PARAMETER_Z_AXIS_ROTATION,
    CRS_PARAMETER_Z_AXIS_TRANSLATION
};

/**
 * Common Operation Parameter Attributes
 */
@interface CRSOperationParameters : NSObject

/**
 * Get the type
 *
 * @return type
 */
-(enum CRSOperationParameterType) type;

/**
 * Get the code
 *
 * @return code
 */
-(int) code;

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
 * Get the unit type
 *
 * @return unit type
 */
-(enum CRSUnitType) unitType;

/**
 * Get the parameter from the parameter type
 *
 * @param type
 *            operation parameter type
 * @return parameter
 */
+(CRSOperationParameters *) parameter: (enum CRSOperationParameterType) type;

/**
 * Get the parameter from the alias
 *
 * @param name
 *            name or alias
 * @return parameter
 */
+(CRSOperationParameters *) parameterFromName: (NSString *) name;

/**
 * Get the parameters from the alias
 *
 * @param name
 *            name or alias
 * @return parameters
 */
+(NSArray<CRSOperationParameters *> *) parametersFromName: (NSString *) name;

/**
 * Get the parameter from the code
 *
 * @param code
 *            parameter code
 * @return parameter
 */
+(CRSOperationParameters *) parameterFromCode: (int) code;

@end
