//
//  SFPProjectionConstants.m
//  sf-proj-ios
//
//  Created by Brian Osborn on 5/15/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "SFPProjectionConstants.h"

NSString * const PROJ_PROPERTIES = @"projections";
NSString * const PROJ_AUTHORITY_EPSG = @"EPSG";
NSString * const PROJ_AUTHORITY_NONE = @"NONE";
NSString * const PROJ_AUTHORITY_OGC = @"OGC";
int const PROJ_UNDEFINED_CARTESIAN = -1;
int const PROJ_UNDEFINED_GEOGRAPHIC = 0;
int const PROJ_EPSG_WORLD_GEODETIC_SYSTEM = 4326;
int const PROJ_EPSG_WEB_MERCATOR = 3857;
int const PROJ_EPSG_WORLD_GEODETIC_SYSTEM_GEOGRAPHICAL_3D = 4979;
NSString * const PROJ_OGC_CRS84 = @"CRS84";
double const PROJ_WEB_MERCATOR_MAX_LAT_RANGE = 85.0511287798066;
double const PROJ_WEB_MERCATOR_MIN_LAT_RANGE = -85.05112877980659;
double const PROJ_WEB_MERCATOR_HALF_WORLD_WIDTH = 20037508.342789244;
double const PROJ_MERCATOR_RADIUS = 85445659.44705395;
double const PROJ_WGS84_HALF_WORLD_LON_WIDTH = 180.0;
double const PROJ_WGS84_HALF_WORLD_LAT_HEIGHT = 90.0;

@implementation SFPProjectionConstants

@end
