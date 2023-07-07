//
//  CRSProjConstants.h
//  crs-ios
//
//  Created by Brian Osborn on 9/9/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * PROJ constants
 */
@interface CRSProjConstants : NSObject

extern NSString * const CRS_PROJ_PARAM_PROJ;
extern NSString * const CRS_PROJ_PARAM_ZONE;
extern NSString * const CRS_PROJ_PARAM_SOUTH;
extern NSString * const CRS_PROJ_PARAM_LAT_1;
extern NSString * const CRS_PROJ_PARAM_LAT_2;
extern NSString * const CRS_PROJ_PARAM_LAT_0;
extern NSString * const CRS_PROJ_PARAM_LAT_TS;
extern NSString * const CRS_PROJ_PARAM_LON_0;
extern NSString * const CRS_PROJ_PARAM_LONC;
extern NSString * const CRS_PROJ_PARAM_ALPHA;
extern NSString * const CRS_PROJ_PARAM_K_0;
extern NSString * const CRS_PROJ_PARAM_X_0;
extern NSString * const CRS_PROJ_PARAM_Y_0;
extern NSString * const CRS_PROJ_PARAM_AXIS;
extern NSString * const CRS_PROJ_PARAM_DATUM;
extern NSString * const CRS_PROJ_PARAM_NO_UOFF;
extern NSString * const CRS_PROJ_PARAM_GAMMA;
extern NSString * const CRS_PROJ_PARAM_A;
extern NSString * const CRS_PROJ_PARAM_B;
extern NSString * const CRS_PROJ_PARAM_ELLPS;
extern NSString * const CRS_PROJ_PARAM_TOWGS84;
extern NSString * const CRS_PROJ_PARAM_PM;
extern NSString * const CRS_PROJ_PARAM_UNITS;
extern NSString * const CRS_PROJ_PARAM_TO_METER;
extern NSString * const CRS_PROJ_PARAM_NADGRIDS;
extern NSString * const CRS_PROJ_PARAM_WKTEXT;
extern NSString * const CRS_PROJ_PARAM_NO_DEFS;

extern NSString * const CRS_PROJ_NAME_AEA;
extern NSString * const CRS_PROJ_NAME_CASS;
extern NSString * const CRS_PROJ_NAME_CEA;
extern NSString * const CRS_PROJ_NAME_EQC;
extern NSString * const CRS_PROJ_NAME_KROVAK;
extern NSString * const CRS_PROJ_NAME_LAEA;
extern NSString * const CRS_PROJ_NAME_LCC;
extern NSString * const CRS_PROJ_NAME_LONGLAT;
extern NSString * const CRS_PROJ_NAME_MERC;
extern NSString * const CRS_PROJ_NAME_NZMG;
extern NSString * const CRS_PROJ_NAME_OMERC;
extern NSString * const CRS_PROJ_NAME_POLY;
extern NSString * const CRS_PROJ_NAME_SOMERC;
extern NSString * const CRS_PROJ_NAME_STERE;
extern NSString * const CRS_PROJ_NAME_STEREA;
extern NSString * const CRS_PROJ_NAME_TMERC;
extern NSString * const CRS_PROJ_NAME_UTM;

extern NSString * const CRS_PROJ_AXIS_EAST;
extern NSString * const CRS_PROJ_AXIS_WEST;
extern NSString * const CRS_PROJ_AXIS_NORTH;
extern NSString * const CRS_PROJ_AXIS_SOUTH;
extern NSString * const CRS_PROJ_AXIS_UP;
extern NSString * const CRS_PROJ_AXIS_DOWN;
extern NSString * const CRS_PROJ_AXIS_WEST_SOUTH_UP;

extern NSString * const CRS_PROJ_UNITS_METRE;
extern NSString * const CRS_PROJ_UNITS_US_SURVEY_FOOT;
extern NSString * const CRS_PROJ_UNITS_FOOT;
extern NSString * const CRS_PROJ_UNITS_DEGREE;

extern NSString * const CRS_PROJ_PSEUDO_MERCATOR;
extern NSString * const CRS_PROJ_SWISS_OBLIQUE_MERCATOR;
extern NSString * const CRS_PROJ_SWISS_OBLIQUE_MERCATOR_COMPAT;
extern NSString * const CRS_PROJ_UTM_ZONE;

@end
