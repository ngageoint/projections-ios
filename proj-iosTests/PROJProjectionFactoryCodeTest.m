//
//  PROJProjectionFactoryCodeTest.m
//  proj-iosTests
//
//  Created by Brian Osborn on 8/19/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJProjectionFactoryCodeTest.h"
#import "PROJTestUtils.h"
#import "PROJProjectionConstants.h"
#import "PROJProjectionFactory.h"
#import "PROJProjectionRetriever.h"
#import "CRSGeoDatums.h"

@implementation PROJProjectionFactoryCodeTest

- (void)setUp {
    [super setUp];
    [PROJProjectionFactory clear];
    [PROJProjectionRetriever clear];
}

/**
 * Test EPSG 2056
 */
-(void) test2056{
    
    NSString *code = @"2056";
    double delta = 0.0001;
    double minX = 5.96;
    double minY = 45.82;
    double maxX = 10.49;
    double maxY = 47.81;
    
    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"CH1903+ / LV95\",BASEGEOGCRS[\"CH1903+\",DATUM[\"CH1903+\","];
    [definition appendString:@"ELLIPSOID[\"Bessel 1841\",6377397.155,299.1528128,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7004]],"];
    [definition appendString:@"ID[\"EPSG\",6150]],ID[\"EPSG\",4150]],"];
    [definition appendString:@"CONVERSION[\"Swiss Oblique Mercator 1995\",METHOD[\"Hotine Oblique Mercator (variant B)\",ID[\"EPSG\",9815]],"];
    [definition appendString:@"PARAMETER[\"Latitude of projection centre\",46.952405556,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of projection centre\",7.439583333,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Azimuth of initial line\",90,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Angle from Rectified to Skew Grid\",90,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor on initial line\",1,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"Easting at projection centre\",2600000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"Northing at projection centre\",1200000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"X-axis translation\",674.374,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Y-axis translation\",15.056,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Z-axis translation\",405.346,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"ID[\"EPSG\",19950]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4400]],AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",2056]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"CH1903+ / LV95\","];
    [definition appendString:@"GEOGCS[\"CH1903+\","];
    [definition appendString:@"DATUM[\"CH1903+\","];
    [definition appendString:@"SPHEROID[\"Bessel 1841\",6377397.155,299.1528128,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7004\"]],"];
    [definition appendString:@"TOWGS84[674.374,15.056,405.346,0,0,0,0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6150\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4150\"]],"];
    [definition appendString:@"PROJECTION[\"Hotine_Oblique_Mercator_Azimuth_Center\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",46.95240555555556],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",7.439583333333333],"];
    [definition appendString:@"PARAMETER[\"azimuth\",90],"];
    [definition appendString:@"PARAMETER[\"rectified_grid_angle\",90],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",2600000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",1200000],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Y\",EAST],"];
    [definition appendString:@"AXIS[\"X\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"2056\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
}

/**
 * Test EPSG 2057
 */
-(void) test2057{

    NSString *code = @"2057";
    double delta = 0.001;

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"Rassadiran / Nakhl e Taqi\",BASEGEOGCRS[\"Rassadiran\","];
    [definition appendString:@"DATUM[\"Rassadiran\",ELLIPSOID[\"International 1924\",6378388,297,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7022]],ID[\"EPSG\",6153]],ID[\"EPSG\",4153]],"];
    [definition appendString:@"CONVERSION[\"Nakhl e Taqi Oblique Mercator\",METHOD[\"Hotine Oblique Mercator (variant B)\",ID[\"EPSG\",9815]],"];
    [definition appendString:@"PARAMETER[\"Latitude of projection centre\",27.518828806,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of projection centre\",52.603539167,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Azimuth of initial line\",0.571661194,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Angle from Rectified to Skew Grid\",0.571661194,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor on initial line\",0.999895934,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"Easting at projection centre\",658377.437,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"Northing at projection centre\",3044969.194,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"X-axis translation\",-133.63,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Y-axis translation\",-157.5,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Z-axis translation\",-158.62,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"ID[\"EPSG\",19951]],CS[Cartesian,2,ID[\"EPSG\",4400]],"];
    [definition appendString:@"AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",2057]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"Rassadiran / Nakhl e Taqi\",GEOGCS[\"Rassadiran\","];
    [definition appendString:@"DATUM[\"Rassadiran\",SPHEROID[\"International 1924\",6378388,297,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7022\"]],TOWGS84[-133.63,-157.5,-158.62,0,0,0,0],AUTHORITY[\"EPSG\",\"6153\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],UNIT[\"degree\",0.01745329251994328,AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4153\"]],UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"PROJECTION[\"Oblique_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",27.51882880555555],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",52.60353916666667],"];
    [definition appendString:@"PARAMETER[\"azimuth\",0.5716611944444444],"];
    [definition appendString:@"PARAMETER[\"rectified_grid_angle\",0.5716611944444444],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.999895934],"];
    [definition appendString:@"PARAMETER[\"false_easting\",658377.437],"];
    [definition appendString:@"PARAMETER[\"false_northing\",3044969.194],AUTHORITY[\"EPSG\",\"2057\"],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(5.0, -53.0);
    CLLocationCoordinate2D expectedCoordinate = CLLocationCoordinate2DMake(1.8282612229838397E7, -1.1608322257560592E7);

    PROJProjection *projection = [PROJProjectionFactory projectionByDefinition:definition];
    PROJProjectionTransform *transform = [PROJProjectionTransform transformFromEpsg:4326 andToProjection:projection];
    CLLocationCoordinate2D projectedCoordinate = [transform transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.longitude andValue2:projectedCoordinate.longitude];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.latitude andValue2:projectedCoordinate.latitude andDelta:.00000001];

    PROJProjection *projection2 = [PROJProjectionFactory cachelessProjectionWithName:code];
    PROJProjectionTransform *transform2 = [PROJProjectionTransform transformFromEpsg:4326 andToProjection:projection2];
    CLLocationCoordinate2D projectedCoordinate2 = [transform2 transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.longitude andValue2:projectedCoordinate2.longitude];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.latitude andValue2:projectedCoordinate2.latitude andDelta:.00000001];

    [PROJProjectionFactory clearTransform:transform];
    [PROJProjectionFactory clearTransform:transform2];

}

/**
 * Test EPSG 2066
 */
-(void) test2066{
    
    NSString *code = @"2066";
    double delta = 0.0001;
    double minX = -60.9;
    double minY = 11.08;
    double maxX = -60.44;
    double maxY = 11.41;
    
    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"Mount Dillon / Tobago Grid\",BASEGEOGCRS[\"Mount Dillon\","];
    [definition appendString:@"DATUM[\"Mount Dillon\","];
    [definition appendString:@"ELLIPSOID[\"Clarke 1858\",20926348,294.2606764,LENGTHUNIT[\"Clarke's foot\",0.3047972654,ID[\"EPSG\",9005]],ID[\"EPSG\",7007]],"];
    [definition appendString:@"ID[\"EPSG\",6157]],ID[\"EPSG\",4157]],"];
    [definition appendString:@"CONVERSION[\"Tobago Grid\",METHOD[\"Cassini-Soldner\",ID[\"EPSG\",9806]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",11.252178611,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",-60.686008889,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",187500,LENGTHUNIT[\"Clarke's link\",0.201166195164,ID[\"EPSG\",9039]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",180000,LENGTHUNIT[\"Clarke's link\",0.201166195164,ID[\"EPSG\",9039]]],"];
    [definition appendString:@"ID[\"EPSG\",19924]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4407]],AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"Clarke's link\",0.201166195164,ID[\"EPSG\",9039]],ID[\"EPSG\",2066]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"Mount Dillon / Tobago Grid\","];
    [definition appendString:@"GEOGCS[\"Mount Dillon\","];
    [definition appendString:@"DATUM[\"Mount_Dillon\","];
    [definition appendString:@"SPHEROID[\"Clarke 1858\",6378293.645208759,294.2606763692569,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7007\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6157\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4157\"]],"];
    [definition appendString:@"PROJECTION[\"Cassini_Soldner\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",11.25217861111111],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",-60.68600888888889],"];
    [definition appendString:@"PARAMETER[\"false_easting\",187500],"];
    [definition appendString:@"PARAMETER[\"false_northing\",180000],"];
    [definition appendString:@"UNIT[\"Clarke's link\",0.201166195164,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9039\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],"];
    [definition appendString:@"AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"2066\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
}

/**
 * Test EPSG 2155
 */
-(void) test2155{
    
    NSString *code = @"2155";
    double delta = 0.001;
    double minX = -170.88;
    double minY = -14.43;
    double maxX = -169.38;
    double maxY = -14.11;
    
    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"American Samoa 1962 / American Samoa Lambert\",BASEGEOGCRS[\"American Samoa 1962\","];
    [definition appendString:@"DATUM[\"American Samoa 1962\","];
    [definition appendString:@"ELLIPSOID[\"Clarke 1866\",6378206.4,294.9786982,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7008]],"];
    [definition appendString:@"ID[\"EPSG\",6169]],ID[\"EPSG\",4169]],"];
    [definition appendString:@"CONVERSION[\"American Samoa Lambert\",METHOD[\"Lambert Conic Conformal (1SP)\",ID[\"EPSG\",9801]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",-14.266666667,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",170,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",1,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",500000,LENGTHUNIT[\"US survey foot\",0.304800609601219,ID[\"EPSG\",9003]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"US survey foot\",0.304800609601219,ID[\"EPSG\",9003]]],"];
    [definition appendString:@"PARAMETER[\"X-axis translation\",-115,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Y-axis translation\",118,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Z-axis translation\",426,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"ID[\"EPSG\",15300]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4497]],AXIS[\"Easting (X)\",east],AXIS[\"Northing (Y)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"US survey foot\",0.304800609601219,ID[\"EPSG\",9003]],ID[\"EPSG\",2155]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"American Samoa 1962 / American Samoa Lambert (deprecated)\","];
    [definition appendString:@"GEOGCS[\"American Samoa 1962\","];
    [definition appendString:@"DATUM[\"American_Samoa_1962\","];
    [definition appendString:@"SPHEROID[\"Clarke 1866\",6378206.4,294.9786982139006,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7008\"]],"];
    [definition appendString:@"TOWGS84[-115,118,426,0,0,0,0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6169\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4169\"]],"];
    [definition appendString:@"PROJECTION[\"Lambert_Conformal_Conic_1SP\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",-14.26666666666667],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",170],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",500000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"US survey foot\",0.3048006096012192,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9003\"]],"];
    [definition appendString:@"AXIS[\"X\",EAST],"];
    [definition appendString:@"AXIS[\"Y\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"2155\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
}

/**
 * Test EPSG 2163
 */
-(void) test2163{
    
    NSString *code = @"2163";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"US National Atlas Equal Area\",BASEGEOGCRS[\"Unspecified datum based upon the Clarke 1866 Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not specified (based on Clarke 1866 Authalic Sphere)\","];
    [definition appendString:@"ELLIPSOID[\"Clarke 1866 Authalic Sphere\",6370997,0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7052]],"];
    [definition appendString:@"ID[\"EPSG\",6052]],ID[\"EPSG\",4052]],"];
    [definition appendString:@"CONVERSION[\"US National Atlas Equal Area\",METHOD[\"Lambert Azimuthal Equal Area (Spherical)\",ID[\"EPSG\",1027]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",45,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",-100,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",3899]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4499]],AXIS[\"Easting (X)\",east],AXIS[\"Northing (Y)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",2163]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"US National Atlas Equal Area\","];
    [definition appendString:@"GEOGCS[\"Unspecified datum based upon the Clarke 1866 Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not_specified_based_on_Clarke_1866_Authalic_Sphere\","];
    [definition appendString:@"SPHEROID[\"Clarke 1866 Authalic Sphere\",6370997,0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7052\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6052\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4052\"]],"];
    [definition appendString:@"PROJECTION[\"Lambert_Azimuthal_Equal_Area\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",45],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",-100],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"X\",EAST],"];
    [definition appendString:@"AXIS[\"Y\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"2163\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 3035
 */
-(void) test3035{

    NSString *code = @"3035";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"ETRS89-extended / LAEA Europe\",BASEGEOGCRS[\"ETRS89\","];
    [definition appendString:@"ENSEMBLE[\"European Terrestrial Reference System 1989 ensemble\","];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 1989\",ID[\"EPSG\",1178]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 1990\",ID[\"EPSG\",1179]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 1991\",ID[\"EPSG\",1180]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 1992\",ID[\"EPSG\",1181]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 1993\",ID[\"EPSG\",1182]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 1994\",ID[\"EPSG\",1183]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 1996\",ID[\"EPSG\",1184]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 1997\",ID[\"EPSG\",1185]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 2000\",ID[\"EPSG\",1186]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 2005\",ID[\"EPSG\",1204]],"];
    [definition appendString:@"MEMBER[\"European Terrestrial Reference Frame 2014\",ID[\"EPSG\",1206]],"];
    [definition appendString:@"ELLIPSOID[\"GRS 1980\",6378137,298.257222101,ID[\"EPSG\",7019]],"];
    [definition appendString:@"ENSEMBLEACCURACY[0.1],ID[\"EPSG\",6258]],ID[\"EPSG\",4258]],"];
    [definition appendString:@"CONVERSION[\"Europe Equal Area 2001\",METHOD[\"Lambert Azimuthal Equal Area\",ID[\"EPSG\",9820]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",52,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",10,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",4321000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",3210000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",19986]],CS[Cartesian,2,ID[\"EPSG\",4532]],"];
    [definition appendString:@"AXIS[\"Northing (Y)\",north],AXIS[\"Easting (X)\",east],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3035]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"ETRS89 / ETRS-LAEA\",GEOGCS[\"ETRS89\","];
    [definition appendString:@"DATUM[\"European_Terrestrial_Reference_System_1989\","];
    [definition appendString:@"SPHEROID[\"GRS 1980\",6378137,298.257222101,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7019\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6258\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.01745329251994328,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4258\"]],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"PROJECTION[\"Lambert_Azimuthal_Equal_Area\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",52],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",10],"];
    [definition appendString:@"PARAMETER[\"false_easting\",4321000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",3210000],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3035\"],"];
    [definition appendString:@"AXIS[\"X\",EAST],AXIS[\"Y\",NORTH]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"ETRS89 / LAEA Europe\",GEOGCRS[\"ETRS89\","];
    [definition appendString:@"DATUM[\"European_Terrestrial_Reference_System_1989\","];
    [definition appendString:@"SPHEROID[\"GRS 1980\",6378137,298.257222101,"];
    [definition appendString:@"ID[\"EPSG\",\"7019\"]],"];
    [definition appendString:@"ABRIDGEDTRANSFORMATION[0,0,0,0,0,0,0],"];
    [definition appendString:@"ID[\"EPSG\",\"6258\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,ID[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"ID[\"EPSG\",\"9122\"]],ID[\"EPSG\",\"4258\"]],"];
    [definition appendString:@"PROJECTION[\"Lambert_Azimuthal_Equal_Area\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",52],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",10],"];
    [definition appendString:@"PARAMETER[\"false_easting\",4321000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",3210000],"];
    [definition appendString:@"UNIT[\"metre\",1,ID[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"ID[\"EPSG\",\"3035\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

}

/**
 * Test EPSG 3083
 */
-(void) test3083{
    
    NSString *code = @"3083";
    
    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"NAD83 / Texas Centric Albers Equal Area\",BASEGEOGCRS[\"NAD83\","];
    [definition appendString:@"DATUM[\"North American Datum 1983\","];
    [definition appendString:@"ELLIPSOID[\"GRS 1980\",6378137,298.2572221,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7019]],"];
    [definition appendString:@"ID[\"EPSG\",6269]],ID[\"EPSG\",4269]],"];
    [definition appendString:@"CONVERSION[\"Texas Centric Albers Equal Area\",METHOD[\"Albers Equal Area\",ID[\"EPSG\",9822]],"];
    [definition appendString:@"PARAMETER[\"Latitude of false origin\",18,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of false origin\",-100,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Latitude of 1st standard parallel\",27.5,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Latitude of 2nd standard parallel\",35,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Easting at false origin\",1500000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"Northing at false origin\",6000000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",14254]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4499]],AXIS[\"Easting (X)\",east],AXIS[\"Northing (Y)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3083]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"NAD83 / Texas Centric Albers Equal Area\","];
    [definition appendString:@"GEOGCS[\"NAD83\","];
    [definition appendString:@"DATUM[\"North_American_Datum_1983\","];
    [definition appendString:@"SPHEROID[\"GRS 1980\",6378137,298.257222101,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7019\"]],"];
    [definition appendString:@"TOWGS84[0,0,0,0,0,0,0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6269\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4269\"]],"];
    [definition appendString:@"PROJECTION[\"Albers_Conic_Equal_Area\"],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_1\",27.5],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_2\",35],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",18],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",-100],"];
    [definition appendString:@"PARAMETER[\"false_easting\",1500000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",6000000],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"X\",EAST],"];
    [definition appendString:@"AXIS[\"Y\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3083\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 3375
 */
-(void) test3375{

    NSString *code = @"3375";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"GDM2000 / Peninsula RSO\",BASEGEOGCRS[\"GDM2000\","];
    [definition appendString:@"DATUM[\"Geodetic Datum of Malaysia 2000\","];
    [definition appendString:@"ELLIPSOID[\"GRS 1980\",6378137,298.2572221,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7019]],ID[\"EPSG\",6742]],ID[\"EPSG\",4742]],"];
    [definition appendString:@"CONVERSION[\"Peninsular RSO\",METHOD[\"Hotine Oblique Mercator (variant A)\",ID[\"EPSG\",9812]],"];
    [definition appendString:@"PARAMETER[\"Latitude of projection centre\",4,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of projection centre\",102.25,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Azimuth of initial line\",323.0257964666666,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Angle from Rectified to Skew Grid\",323.1301023611111,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor on initial line\",0.99984,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",804671,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",19895]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4400]],AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",3375]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"GDM2000 / Peninsula RSO\",GEOGCS[\"GDM2000\","];
    [definition appendString:@"DATUM[\"Geodetic_Datum_of_Malaysia_2000\","];
    [definition appendString:@"SPHEROID[\"GRS 1980\",6378137,298.257222101,AUTHORITY[\"EPSG\",\"7019\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6742\"]],PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.01745329251994328,AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4742\"]],UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"PROJECTION[\"Hotine_Oblique_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",4],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",102.25],"];
    [definition appendString:@"PARAMETER[\"azimuth\",323.0257964666666],"];
    [definition appendString:@"PARAMETER[\"rectified_grid_angle\",323.1301023611111],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.99984],"];
    [definition appendString:@"PARAMETER[\"false_easting\",804671],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3375\"],AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(3.06268465621428, 101.70979078430528);
    CLLocationCoordinate2D expectedCoordinate = CLLocationCoordinate2DMake(338944.957259175, 412597.5327153324);

    PROJProjection *projection = [PROJProjectionFactory projectionByDefinition:definition];
    PROJProjectionTransform *transform = [PROJProjectionTransform transformFromEpsg:4326 andToProjection:projection];
    CLLocationCoordinate2D projectedCoordinate = [transform transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.longitude andValue2:projectedCoordinate.longitude];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.latitude andValue2:projectedCoordinate.latitude andDelta:.000000001];

    PROJProjection *projection2 = [PROJProjectionFactory cachelessProjectionWithName:code];
    PROJProjectionTransform *transform2 = [PROJProjectionTransform transformFromEpsg:4326 andToProjection:projection2];
    CLLocationCoordinate2D projectedCoordinate2 = [transform2 transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.longitude andValue2:projectedCoordinate2.longitude];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.latitude andValue2:projectedCoordinate2.latitude andDelta:.000000001];

    [PROJProjectionFactory clearTransform:transform];
    [PROJProjectionFactory clearTransform:transform2];

}

/**
 * Test EPSG 3376
 */
-(void) test3376{

    NSString *code = @"3376";
    double delta = 0.0001;

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"GDM2000 / East Malaysia BRSO\",BASEGEOGCRS[\"GDM2000\","];
    [definition appendString:@"DATUM[\"Geodetic Datum of Malaysia 2000\","];
    [definition appendString:@"ELLIPSOID[\"GRS 1980\",6378137,298.2572221,LENGTHUNIT[\"metre\",1,"];
    [definition appendString:@"ID[\"EPSG\",9001]],ID[\"EPSG\",7019]],ID[\"EPSG\",6742]],ID[\"EPSG\",4742]],"];
    [definition appendString:@"CONVERSION[\"Borneo RSO\",METHOD[\"Hotine Oblique Mercator (variant A)\",ID[\"EPSG\",9812]],"];
    [definition appendString:@"PARAMETER[\"Latitude of projection centre\",4,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of projection centre\",115,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Azimuth of initial line\",53.31580995,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Angle from Rectified to Skew Grid\",53.130102361,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor on initial line\",0.99984,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",19894]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4400]],AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3376]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"GDM2000 / East Malaysia BRSO\",GEOGCS[\"GDM2000\","];
    [definition appendString:@"DATUM[\"Geodetic_Datum_of_Malaysia_2000\","];
    [definition appendString:@"SPHEROID[\"GRS 1980\",6378137,298.257222101,AUTHORITY[\"EPSG\",\"7019\"]],AUTHORITY[\"EPSG\",\"6742\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.01745329251994328,AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4742\"]],UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"PROJECTION[\"Hotine_Oblique_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",4],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",115],"];
    [definition appendString:@"PARAMETER[\"azimuth\",53.31580995],"];
    [definition appendString:@"PARAMETER[\"rectified_grid_angle\",53.13010236111111],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.99984],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3376\"],AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(3.0626847, 114.7097908);
    CLLocationCoordinate2D expectedCoordinate = CLLocationCoordinate2DMake(339160.75510987174, 558597.8802098362);

    PROJProjection *projection = [PROJProjectionFactory projectionByDefinition:definition];
    PROJProjectionTransform *transform = [PROJProjectionTransform transformFromEpsg:4326 andToProjection:projection];
    CLLocationCoordinate2D projectedCoordinate = [transform transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.longitude andValue2:projectedCoordinate.longitude andDelta:.000000001];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.latitude andValue2:projectedCoordinate.latitude andDelta:.000000001];

    PROJProjection *projection2 = [PROJProjectionFactory cachelessProjectionWithName:code];
    PROJProjectionTransform *transform2 = [PROJProjectionTransform transformFromEpsg:4326 andToProjection:projection2];
    CLLocationCoordinate2D projectedCoordinate2 = [transform2 transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.longitude andValue2:projectedCoordinate2.longitude andDelta:.000000001];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.latitude andValue2:projectedCoordinate2.latitude andDelta:.000000001];

    [PROJProjectionFactory clearTransform:transform];
    [PROJProjectionFactory clearTransform:transform2];

}

/**
 * Test EPSG 3395
 */
-(void) test3395{

    NSString *code = @"3395";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / World Mercator\",BASEGEOGCRS[\"WGS 84\","];
    [definition appendString:@"ENSEMBLE[\"World Geodetic System 1984 ensemble\","];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (Transit)\",ID[\"EPSG\",1166]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G730)\",ID[\"EPSG\",1152]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G873)\",ID[\"EPSG\",1153]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1150)\",ID[\"EPSG\",1154]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1674)\",ID[\"EPSG\",1155]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1762)\",ID[\"EPSG\",1156]],"];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,ID[\"EPSG\",7030]],"];
    [definition appendString:@"ENSEMBLEACCURACY[2],ID[\"EPSG\",6326]],ID[\"EPSG\",4326]],"];
    [definition appendString:@"CONVERSION[\"World Mercator\",METHOD[\"Mercator (variant A)\",ID[\"EPSG\",9804]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",1,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",19883]],CS[Cartesian,2,ID[\"EPSG\",4400]],"];
    [definition appendString:@"AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3395]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / World Mercator\",GEOGCS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.01745329251994328,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"PROJECTION[\"Mercator_1SP\"],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",0],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3395\"],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / World Mercator\",GEOGCS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.01745329251994328,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"PROJECTION[\"Mercator\"],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",0],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3395\"],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / World Mercator\","];
    [definition appendString:@"BASEGEODCRS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"World Geodetic System 1984\","];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563]]],"];
    [definition appendString:@"CONVERSION[\"Mercator\","];
    [definition appendString:@"METHOD[\"Mercator (variant A)\",ID[\"EPSG\",\"9804\"]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",0,"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",1,"];
    [definition appendString:@"SCALEUNIT[\"unity\",1.0]],"];
    [definition appendString:@"PARAMETER[\"False easting\",0,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"ID[\"EPSG\",\"19833\"]],CS[Cartesian,2],"];
    [definition appendString:@"AXIS[\"Easting (E)\",east,ORDER[1]],"];
    [definition appendString:@"AXIS[\"Northing (N)\",north,ORDER[2]],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0],ID[\"EPSG\",\"3395\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

}

/**
 * Test EPSG 3410
 */
-(void) test3410{
    
    NSString *code = @"3410";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"NSIDC EASE-Grid Global\",BASEGEOGCRS[\"Unspecified datum based upon the International 1924 Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not specified (based on International 1924 Authalic Sphere)\","];
    [definition appendString:@"ELLIPSOID[\"International 1924 Authalic Sphere\",6371228,0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7057]],"];
    [definition appendString:@"ID[\"EPSG\",6053]],ID[\"EPSG\",4053]],"];
    [definition appendString:@"CONVERSION[\"US NSIDC Equal Area global projection\",METHOD[\"Lambert Cylindrical Equal Area (Spherical)\",ID[\"EPSG\",9834]],"];
    [definition appendString:@"PARAMETER[\"Latitude of 1st standard parallel\",30,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",19869]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4499]],AXIS[\"Easting (X)\",east],AXIS[\"Northing (Y)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3410]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"NSIDC EASE-Grid Global\","];
    [definition appendString:@"GEOGCS[\"Unspecified datum based upon the International 1924 Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not_specified_based_on_International_1924_Authalic_Sphere\","];
    [definition appendString:@"SPHEROID[\"International 1924 Authalic Sphere\",6371228,0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7057\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6053\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4053\"]],"];
    [definition appendString:@"PROJECTION[\"Cylindrical_Equal_Area\"],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_1\",30],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",0],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"X\",EAST],"];
    [definition appendString:@"AXIS[\"Y\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3410\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 3786
 */
-(void) test3786{
    
    NSString *code = @"3786";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"World Equidistant Cylindrical (Sphere)\",BASEGEOGCRS[\"Unspecified datum based upon the GRS 1980 Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not specified (based on GRS 1980 Authalic Sphere)\","];
    [definition appendString:@"ELLIPSOID[\"GRS 1980 Authalic Sphere\",6371007,0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7048]],"];
    [definition appendString:@"ID[\"EPSG\",6047]],ID[\"EPSG\",4047]],"];
    [definition appendString:@"CONVERSION[\"World Equidistant Cylindrical (Sphere)\",METHOD[\"Equidistant Cylindrical (Spherical)\",ID[\"EPSG\",9823]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",19968]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4499]],AXIS[\"Easting (X)\",east],AXIS[\"Northing (Y)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3786]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"World Equidistant Cylindrical (Sphere) (deprecated)\","];
    [definition appendString:@"GEOGCS[\"Unspecified datum based upon the GRS 1980 Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not_specified_based_on_GRS_1980_Authalic_Sphere\","];
    [definition appendString:@"SPHEROID[\"GRS 1980 Authalic Sphere\",6371007,0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7048\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6047\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4047\"]],"];
    [definition appendString:@"PROJECTION[\"Equirectangular\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",0],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",0],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"X\",EAST],"];
    [definition appendString:@"AXIS[\"Y\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3786\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 3857
 */
-(void) test3857{

    NSString *code = @"3857";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / Pseudo-Mercator\",BASEGEOGCRS[\"WGS 84\","];
    [definition appendString:@"ENSEMBLE[\"World Geodetic System 1984 ensemble\","];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (Transit)\",ID[\"EPSG\",1166]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G730)\",ID[\"EPSG\",1152]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G873)\",ID[\"EPSG\",1153]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1150)\",ID[\"EPSG\",1154]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1674)\",ID[\"EPSG\",1155]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1762)\",ID[\"EPSG\",1156]],"];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,ID[\"EPSG\",7030]],"];
    [definition appendString:@"ENSEMBLEACCURACY[2],ID[\"EPSG\",6326]],ID[\"EPSG\",4326]],"];
    [definition appendString:@"CONVERSION[\"Popular Visualisation Pseudo-Mercator\","];
    [definition appendString:@"METHOD[\"Popular Visualisation Pseudo Mercator\",ID[\"EPSG\",1024]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",3856]],CS[Cartesian,2,ID[\"EPSG\",4499]],"];
    [definition appendString:@"AXIS[\"Easting (X)\",east],AXIS[\"Northing (Y)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3857]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / Pseudo-Mercator\",GEOGCS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"PROJECTION[\"Mercator_1SP\"],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",0],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"X\",EAST],AXIS[\"Y\",NORTH],"];
    [definition appendString:@"EXTENSION[\"PROJ4\",\"+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs\"],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3857\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / Pseudo-Mercator\","];
    [definition appendString:@"GEOGCRS[\"WGS 84\",DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"ID[\"EPSG\",\"7030\"]],ID[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,ID[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"ID[\"EPSG\",\"9122\"]],ID[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"PROJECTION[\"Mercator_1SP\"],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",0],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0]"];
    [definition appendString:@",UNIT[\"metre\",1,ID[\"EPSG\",\"9001\"]]"];
    [definition appendString:@",AXIS[\"X\",EAST],AXIS[\"Y\",NORTH]"];
    [definition appendString:@",ID[\"EPSG\",\"3857\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

}

/**
 * Test EPSG 3978
 */
-(void) test3978{

    NSString *code = @"3978";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"NAD83 / Canada Atlas Lambert\",BASEGEOGCRS[\"NAD83\","];
    [definition appendString:@"DATUM[\"North American Datum 1983\","];
    [definition appendString:@"ELLIPSOID[\"GRS 1980\",6378137,298.257222101,ID[\"EPSG\",7019]],"];
    [definition appendString:@"ID[\"EPSG\",6269]],ID[\"EPSG\",4269]],"];
    [definition appendString:@"CONVERSION[\"Canada Atlas Lambert\",METHOD[\"Lambert Conic Conformal (2SP)\",ID[\"EPSG\",9802]],"];
    [definition appendString:@"PARAMETER[\"Latitude of false origin\",49,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of false origin\",-95,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Latitude of 1st standard parallel\",49,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Latitude of 2nd standard parallel\",77,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Easting at false origin\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"Northing at false origin\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",3977]],CS[Cartesian,2,ID[\"EPSG\",4400]],"];
    [definition appendString:@"AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3978]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"NAD83 / Canada Atlas Lambert\",GEOGCS[\"NAD83\","];
    [definition appendString:@"DATUM[\"North_American_Datum_1983\","];
    [definition appendString:@"SPHEROID[\"GRS 1980\",6378137,298.257222101,AUTHORITY[\"EPSG\",\"7019\"]],"];
    [definition appendString:@"TOWGS84[0,0,0,0,0,0,0],AUTHORITY[\"EPSG\",\"6269\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4269\"]],"];
    [definition appendString:@"PROJECTION[\"Lambert_Conformal_Conic_2SP\"],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_1\",49],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_2\",77],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",49],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",-95],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3978\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"NAD83 / Canada Atlas Lambert\",GEOGCRS[\"NAD83\","];
    [definition appendString:@"DATUM[\"North_American_Datum_1983\","];
    [definition appendString:@"SPHEROID[\"GRS 1980\",6378137,298.257222101,"];
    [definition appendString:@"ID[\"EPSG\",\"7019\"]],"];
    [definition appendString:@"ABRIDGEDTRANSFORMATION[0,0,0,0,0,0,0],"];
    [definition appendString:@"ID[\"EPSG\",\"6269\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,ID[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"ID[\"EPSG\",\"4269\"]],"];
    [definition appendString:@"PROJECTION[\"Lambert_Conformal_Conic_2SP\"],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_1\",49],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_2\",77],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",49],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",-95],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,ID[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"ID[\"EPSG\",\"3978\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

}

/**
 * Test EPSG 3997
 */
-(void) test3997{

    NSString *code = @"3997";
    double delta = 0.0001;
    double minX = 54.84;
    double minY = 24.85;
    double maxX = 55.55;
    double maxY = 25.34;

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / Dubai Local TM\",BASEGEOGCRS[\"WGS 84\","];
    [definition appendString:@"ENSEMBLE[\"World Geodetic System 1984 ensemble\","];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (Transit)\", ID[\"EPSG\",1166]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G730)\", ID[\"EPSG\",1152]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G873)\", ID[\"EPSG\",1153]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1150)\", ID[\"EPSG\",1154]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1674)\", ID[\"EPSG\",1155]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1762)\", ID[\"EPSG\",1156]],"];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.2572236,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7030]], ENSEMBLEACCURACY[2],"];
    [definition appendString:@"ID[\"EPSG\",6326]],ID[\"EPSG\",4326]],"];
    [definition appendString:@"CONVERSION[\"Dubai Local Transverse Mercator\",METHOD[\"Transverse Mercator\",ID[\"EPSG\",9807]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",55.333333333,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",1,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",500000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",19839]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4400]],AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",3997]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / Dubai Local TM\","];
    [definition appendString:@"GEOGCS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"PROJECTION[\"Transverse_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",0],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",55.33333333333334],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",500000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],"];
    [definition appendString:@"AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"3997\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
}

/**
 * Test EPSG 4005
 */
-(void) test4005{
    
    NSString *code = @"4005";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"GEOGCRS[\"Unknown datum based upon the Bessel Modified ellipsoid\","];
    [definition appendString:@"DATUM[\"Not specified (based on Bessel Modified ellipsoid)\","];
    [definition appendString:@"ELLIPSOID[\"Bessel Modified\",6377492.018,299.1528128,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7005]],ID[\"EPSG\",6005]],"];
    [definition appendString:@"CS[ellipsoidal,2,ID[\"EPSG\",6422]],"];
    [definition appendString:@"AXIS[\"latitude (Lat)\",north],AXIS[\"longitude (Lon)\",east],"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]],ID[\"EPSG\",4005]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"GEOGCS[\"Unknown datum based upon the Bessel Modified ellipsoid\","];
    [definition appendString:@"DATUM[\"Not_specified_based_on_Bessel_Modified_ellipsoid\","];
    [definition appendString:@"SPHEROID[\"Bessel Modified\",6377492.018,299.1528128,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7005\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6005\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4005\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 4023
 */
-(void) test4023{
    
    NSString *code = @"4023";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"GEOGCRS[\"MOLDREF99\","];
    [definition appendString:@"DATUM[\"MOLDREF99\","];
    [definition appendString:@"ELLIPSOID[\"GRS 1980\",6378137,298.2572221,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7019]],"];
    [definition appendString:@"TOWGS84[0,0,0,0,0,0,0],"];
    [definition appendString:@"ID[\"EPSG\",1032]],"];
    [definition appendString:@"CS[ellipsoidal,2,ID[\"EPSG\",6422]],"];
    [definition appendString:@"AXIS[\"latitude (Lat)\",north],AXIS[\"longitude (Lon)\",east],"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]],ID[\"EPSG\",4023]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"GEOGCS[\"MOLDREF99\","];
    [definition appendString:@"DATUM[\"MOLDREF99\","];
    [definition appendString:@"SPHEROID[\"GRS 1980\",6378137,298.257222101,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7019\"]],"];
    [definition appendString:@"TOWGS84[0,0,0,0,0,0,0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"1032\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4023\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 4035
 */
-(void) test4035{
    
    NSString *code = @"4035";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"GEOGCRS[\"Unknown datum based upon the Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not specified (based on Authalic Sphere)\","];
    [definition appendString:@"ELLIPSOID[\"Sphere\",6371000,0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7035]],ID[\"EPSG\",6035]],"];
    [definition appendString:@"CS[ellipsoidal,2,ID[\"EPSG\",6402]],"];
    [definition appendString:@"AXIS[\"latitude (Lat)\",north],AXIS[\"longitude (Long)\",east],"];
    [definition appendString:@"ANGLEUNIT[\"degree minute second hemisphere\",1,ID[\"EPSG\",9108]],ID[\"EPSG\",4035]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"GEOGCS[\"Unknown datum based upon the Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not_specified_based_on_Authalic_Sphere\","];
    [definition appendString:@"SPHEROID[\"Sphere\",6371000,0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7035\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6035\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9108\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4035\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 4047
 */
-(void) test4047{
    
    NSString *code = @"4047";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"GEOGCRS[\"Unspecified datum based upon the GRS 1980 Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not specified (based on GRS 1980 Authalic Sphere)\","];
    [definition appendString:@"ELLIPSOID[\"GRS 1980 Authalic Sphere\",6371007,0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7048]],ID[\"EPSG\",6047]],"];
    [definition appendString:@"CS[ellipsoidal,2,ID[\"EPSG\",6422]],"];
    [definition appendString:@"AXIS[\"latitude (Lat)\",north],AXIS[\"longitude (Lon)\",east],"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]],ID[\"EPSG\",4047]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"GEOGCS[\"Unspecified datum based upon the GRS 1980 Authalic Sphere\","];
    [definition appendString:@"DATUM[\"Not_specified_based_on_GRS_1980_Authalic_Sphere\","];
    [definition appendString:@"SPHEROID[\"GRS 1980 Authalic Sphere\",6371007,0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7048\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6047\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4047\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 4055
 */
-(void) test4055{
    
    NSString *code = @"4055";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"GEOGCRS[\"Popular Visualisation CRS\","];
    [definition appendString:@"DATUM[\"Popular Visualisation Datum\","];
    [definition appendString:@"ELLIPSOID[\"Popular Visualisation Sphere\",6378137,0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7059]],"];
    [definition appendString:@"TOWGS84[0,0,0,0,0,0,0],"];
    [definition appendString:@"ID[\"EPSG\",6055]],"];
    [definition appendString:@"CS[ellipsoidal,2,ID[\"EPSG\",6422]],"];
    [definition appendString:@"AXIS[\"latitude (Lat)\",north],AXIS[\"longitude (Lon)\",east],"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]],ID[\"EPSG\",4055]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"Popular Visualisation CRS\",BASEGEOGCRS[\"Popular Visualisation CRS\","];
    [definition appendString:@"DATUM[\"Popular Visualisation Datum\","];
    [definition appendString:@"ELLIPSOID[\"Popular Visualisation Sphere\",6378137,0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7059]],"];
    [definition appendString:@"ID[\"EPSG\",6055]]],"];
    [definition appendString:@"CONVERSION[\"Coordinate Frame rotation\",METHOD[\"Coordinate Frame rotation (geocentric domain)\",ID[\"EPSG\",1032]],"];
    [definition appendString:@"PARAMETER[\"X-axis translation\",0,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Y-axis translation\",0,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Z-axis translation\",0,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"X-axis rotation\",0,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Y-axis rotation\",0,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Z-axis rotation\",0,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Scale difference\",0,SCALEUNIT[\"parts per million\",1E-06]],"];
    [definition appendString:@"],CS[Cartesian,2,ID[\"EPSG\",6422]],"];
    [definition appendString:@"AXIS[\"latitude (Lat)\",north],AXIS[\"longitude (Lon)\",east],"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]],ID[\"EPSG\",4055]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"GEOGCS[\"Popular Visualisation CRS\","];
    [definition appendString:@"DATUM[\"Popular_Visualisation_Datum\","];
    [definition appendString:@"SPHEROID[\"Popular Visualisation Sphere\",6378137,0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7059\"]],"];
    [definition appendString:@"TOWGS84[0,0,0,0,0,0,0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6055\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4055\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 4071
 */
-(void) test4071{

    NSString *code = @"4071";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"Chua / UTM zone 23S\",BASEGEOGCRS[\"Chua\","];
    [definition appendString:@"DATUM[\"Chua\","];
    [definition appendString:@"ELLIPSOID[\"International 1924\",6378388,297,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7022]],"];
    [definition appendString:@"ID[\"EPSG\",6224]],ID[\"EPSG\",4224]],"];
    [definition appendString:@"CONVERSION[\"UTM zone 23S\",METHOD[\"Transverse Mercator\",ID[\"EPSG\",9807]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",-45,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",0.9996,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",500000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",10000000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"X-axis translation\",-134,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Y-axis translation\",229,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Z-axis translation\",-29,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"ID[\"EPSG\",16123]],CS[Cartesian,2,ID[\"EPSG\",4400]],"];
    [definition appendString:@"AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",4071]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"Chua / UTM zone 23S\","];
    [definition appendString:@"GEOGCS[\"Chua\","];
    [definition appendString:@"DATUM[\"Chua\","];
    [definition appendString:@"SPHEROID[\"International 1924\",6378388,297,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7022\"]],"];
    [definition appendString:@"TOWGS84[-134,229,-29,0,0,0,0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6224\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4224\"]],"];
    [definition appendString:@"PROJECTION[\"Transverse_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",0],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",-45],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.9996],"];
    [definition appendString:@"PARAMETER[\"false_easting\",500000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",10000000],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],"];
    [definition appendString:@"AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4071\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 4326
 */
-(void) test4326{
    
    NSString *code = @"4326";
    
    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"GEOGCRS[\"WGS 84\",ENSEMBLE[\"World Geodetic System 1984 ensemble\","];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (Transit)\",ID[\"EPSG\",1166]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G730)\",ID[\"EPSG\",1152]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G873)\",ID[\"EPSG\",1153]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1150)\",ID[\"EPSG\",1154]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1674)\",ID[\"EPSG\",1155]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1762)\",ID[\"EPSG\",1156]],"];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,ID[\"EPSG\",7030]],"];
    [definition appendString:@"ENSEMBLEACCURACY[2],ID[\"EPSG\",6326]],"];
    [definition appendString:@"CS[ellipsoidal,2,ID[\"EPSG\",6422]],"];
    [definition appendString:@"AXIS[\"Geodetic latitude (Lat)\",north],AXIS[\"Geodetic longitude (Lon)\",east],"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]],"];
    [definition appendString:@"ID[\"EPSG\",4326]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.01745329251994328,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4326\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS84\",6378137,298.257223563]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433]]"];
    
    [self projectionTestSpecifiedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 4979
 */
-(void) test4979{
    
    NSString *code = @"4979";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"GEOGCRS[\"WGS 84\",ENSEMBLE[\"World Geodetic System 1984 ensemble\","];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (Transit)\",ID[\"EPSG\",1166]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G730)\",ID[\"EPSG\",1152]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G873)\",ID[\"EPSG\",1153]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1150)\",ID[\"EPSG\",1154]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1674)\",ID[\"EPSG\",1155]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1762)\",ID[\"EPSG\",1156]],"];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,ID[\"EPSG\",7030]],"];
    [definition appendString:@"ENSEMBLEACCURACY[2],ID[\"EPSG\",6326]],"];
    [definition appendString:@"CS[ellipsoidal,3,ID[\"EPSG\",6423]],"];
    [definition appendString:@"AXIS[\"Geodetic latitude (Lat)\",north,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"AXIS[\"Geodetic longitude (Lon)\",east,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"AXIS[\"Ellipsoidal height (h)\",up,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],ID[\"EPSG\",4979]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"GEOGCS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"World Geodetic System 1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137.0,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0.0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.017453292519943295],"];
    [definition appendString:@"AXIS[\"Geodetic latitude\",NORTH],"];
    [definition appendString:@"AXIS[\"Geodetic longitude\",EAST],"];
    [definition appendString:@"AXIS[\"Ellipsoidal height\",UP],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4979\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
    definition = [NSMutableString string];
    [definition appendString:@"GEODCRS[\"WGS 84\",DATUM[\"World Geodetic System 1984\","];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]]],CS[ellipsoidal,3],"];
    [definition appendString:@"AXIS[\"Geodetic latitude (Lat)\",north,"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"AXIS[\"Geodetic longitude (Long)\",east,"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"AXIS[\"Ellipsoidal height (h)\",up,"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]],ID[\"EPSG\",4979]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

}

/**
 * Test EPSG 5041
 */
-(void) test5041{

    NSString *code = @"5041";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / UPS North (E,N)\",BASEGEOGCRS[\"WGS 84\","];
    [definition appendString:@"ENSEMBLE[\"World Geodetic System 1984 ensemble\","];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (Transit)\",ID[\"EPSG\",1166]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G730)\",ID[\"EPSG\",1152]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G873)\",ID[\"EPSG\",1153]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1150)\",ID[\"EPSG\",1154]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1674)\",ID[\"EPSG\",1155]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1762)\",ID[\"EPSG\",1156]],"];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,ID[\"EPSG\",7030]],"];
    [definition appendString:@"ENSEMBLEACCURACY[2],ID[\"EPSG\",6326]],ID[\"EPSG\",4326]],"];
    [definition appendString:@"CONVERSION[\"Universal Polar Stereographic North\","];
    [definition appendString:@"METHOD[\"Polar Stereographic (variant A)\",ID[\"EPSG\",9810]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",90,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",0.994,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",2000000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",2000000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",16061]],CS[Cartesian,2,ID[\"EPSG\",1026]],"];
    [definition appendString:@"AXIS[\"Easting (E)\",South,MERIDIAN[90.0,ANGLEUNIT[\"degree\",0.0174532925199433]]],"];
    [definition appendString:@"AXIS[\"Northing (N)\",South,MERIDIAN[180.0,ANGLEUNIT[\"degree\",0.0174532925199433]]],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",5041]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / UPS North (E,N)\","];
    [definition appendString:@"GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"PROJECTION[\"Polar_Stereographic\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",90],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",0],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.994],"];
    [definition appendString:@"PARAMETER[\"false_easting\",2000000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",2000000],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"5041\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / UPS North (E,N)\","];
    [definition appendString:@"BASEGEODCRS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"World Geodetic System 1984\","];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]]]],"];
    [definition appendString:@"CONVERSION[\"Universal Polar Stereographic North\","];
    [definition appendString:@"METHOD[\"Polar Stereographic (variant A)\",ID[\"EPSG\",\"9810\"]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",90,"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",0.994,"];
    [definition appendString:@"SCALEUNIT[\"unity\",1.0]],"];
    [definition appendString:@"PARAMETER[\"False easting\",2000000,"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"False northing\",2000000,"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]],ID[\"EPSG\",\"16061\"]],"];
    [definition appendString:@"CS[Cartesian,2],AXIS[\"Easting (E)\",south,"];
    [definition appendString:@"MERIDIAN[90,ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"ORDER[1]],AXIS[\"Northing (N)\",south,"];
    [definition appendString:@"MERIDIAN[180,ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"ORDER[2]],LENGTHUNIT[\"metre\",1.0],"];
    [definition appendString:@"ID[\"EPSG\",\"5041\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

}

/**
 * Test EPSG 5042
 */
-(void) test5042{

    NSString *code = @"5042";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / UPS South (E,N)\",BASEGEOGCRS[\"WGS 84\","];
    [definition appendString:@"ENSEMBLE[\"World Geodetic System 1984 ensemble\","];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (Transit)\",ID[\"EPSG\",1166]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G730)\",ID[\"EPSG\",1152]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G873)\",ID[\"EPSG\",1153]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1150)\",ID[\"EPSG\",1154]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1674)\",ID[\"EPSG\",1155]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1762)\",ID[\"EPSG\",1156]],"];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,ID[\"EPSG\",7030]],"];
    [definition appendString:@"ENSEMBLEACCURACY[2],ID[\"EPSG\",6326]],ID[\"EPSG\",4326]],"];
    [definition appendString:@"CONVERSION[\"Universal Polar Stereographic South\","];
    [definition appendString:@"METHOD[\"Polar Stereographic (variant A)\",ID[\"EPSG\",9810]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",-90,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",0.994,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",2000000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",2000000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",16161]],CS[Cartesian,2,ID[\"EPSG\",1027]],"];
    [definition appendString:@"AXIS[\"Easting (E)\",North,MERIDIAN[90.0,ANGLEUNIT[\"degree\",0.0174532925199433]]],"];
    [definition appendString:@"AXIS[\"Northing (N)\",North,MERIDIAN[0.0,ANGLEUNIT[\"degree\",0.0174532925199433]]],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",5042]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / UPS South (E,N)\","];
    [definition appendString:@"GEOGCS[\"WGS 84\",DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"PROJECTION[\"Polar_Stereographic\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",-90],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",0],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.994],"];
    [definition appendString:@"PARAMETER[\"false_easting\",2000000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",2000000],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"5042\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / UPS South (E,N)\","];
    [definition appendString:@"BASEGEODCRS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"World Geodetic System 1984\","];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]]]],"];
    [definition appendString:@"CONVERSION[\"Universal Polar Stereographic North\","];
    [definition appendString:@"METHOD[\"Polar Stereographic (variant A)\",ID[\"EPSG\",\"9810\"]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",-90,"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",0,"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",0.994,"];
    [definition appendString:@"SCALEUNIT[\"unity\",1.0]],"];
    [definition appendString:@"PARAMETER[\"False easting\",2000000,"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"False northing\",2000000,"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]],ID[\"EPSG\",\"16161\"]],"];
    [definition appendString:@"CS[Cartesian,2],AXIS[\"Easting (E)\",north,"];
    [definition appendString:@"MERIDIAN[90,ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"ORDER[1]],AXIS[\"Northing (N)\",north,"];
    [definition appendString:@"MERIDIAN[0,ANGLEUNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"ORDER[2]],LENGTHUNIT[\"metre\",1.0],"];
    [definition appendString:@"ID[\"EPSG\",\"5042\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

}

/**
 * Test EPSG 5472
 */
-(void) test5472{
    
    NSString *code = @"5472";
    double delta = 0.0001;
    double minX = -83.04;
    double minY = 7.15;
    double maxX = -77.19;
    double maxY = 9.68;

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"Panama-Colon 1911 / Panama Polyconic\",BASEGEOGCRS[\"Panama-Colon 1911\","];
    [definition appendString:@"DATUM[\"Panama-Colon 1911\","];
    [definition appendString:@"ELLIPSOID[\"Clarke 1866\",6378206.4,294.9786982,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7008]],"];
    [definition appendString:@"ID[\"EPSG\",1072]],ID[\"EPSG\",5467]],"];
    [definition appendString:@"CONVERSION[\"Panama Polyconic\",METHOD[\"American Polyconic\",ID[\"EPSG\",9818]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",8.25,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",-81,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",1000000,LENGTHUNIT[\"Clarke's yard\",0.9143917962,ID[\"EPSG\",9037]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",1092972.1,LENGTHUNIT[\"Clarke's yard\",0.9143917962,ID[\"EPSG\",9037]]],"];
    [definition appendString:@"ID[\"EPSG\",5471]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",1028]],AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"Clarke's yard\",0.9143917962,ID[\"EPSG\",9037]],ID[\"EPSG\",5472]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"Panama-Colon 1911 / Panama Polyconic\","];
    [definition appendString:@"GEOGCS[\"Panama-Colon 1911\","];
    [definition appendString:@"DATUM[\"Panama_Colon_1911\","];
    [definition appendString:@"SPHEROID[\"Clarke 1866\",6378206.4,294.9786982139006,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7008\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"1072\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"5467\"]],"];
    [definition appendString:@"PROJECTION[\"Polyconic\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",8.25],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",-81],"];
    [definition appendString:@"PARAMETER[\"false_easting\",1000000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",1092972.1],"];
    [definition appendString:@"UNIT[\"Clarke's yard\",0.9143917962,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9037\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],"];
    [definition appendString:@"AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"5472\"]]"];
    
    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
}

/**
 * Test EPSG 7405
 */
-(void) test7405{

    NSString *code = @"7405";
    double delta = 0.01;
    double minX = -7.5600;
    double minY = 49.9600;
    double maxX = 1.7800;
    double maxY = 60.8400;

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"COMPOUNDCRS[\"OSGB36 / British National Grid + ODN height\","];
    [definition appendString:@"PROJCRS[\"OSGB36 / British National Grid\",BASEGEOGCRS[\"OSGB36\","];
    [definition appendString:@"DATUM[\"Ordnance Survey of Great Britain 1936\","];
    [definition appendString:@"ELLIPSOID[\"Airy 1830\",6377563.396,299.3249646,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7001]],ID[\"EPSG\",6277]],ID[\"EPSG\",4277]],"];
    [definition appendString:@"CONVERSION[\"British National Grid\",METHOD[\"Transverse Mercator\",ID[\"EPSG\",9807]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",49,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",-2,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",0.9996012717,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",400000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",-100000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"X-axis translation\",446.448,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Y-axis translation\",-125.157,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Z-axis translation\",542.06,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"X-axis rotation\",0.15,ANGLEUNIT[\"arc-second\",4.84813681109535993589914102357E-06]],"];
    [definition appendString:@"PARAMETER[\"Y-axis rotation\",0.247,ANGLEUNIT[\"arc-second\",4.84813681109535993589914102357E-06]],"];
    [definition appendString:@"PARAMETER[\"Z-axis rotation\",0.842,ANGLEUNIT[\"arc-second\",4.84813681109535993589914102357E-06]],"];
    [definition appendString:@"PARAMETER[\"Scale difference\",-20.489,SCALEUNIT[\"parts per million\",1E-06]],"];
    [definition appendString:@"ID[\"EPSG\",19916]],CS[Cartesian,2,ID[\"EPSG\",4400]],"];
    [definition appendString:@"AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",27700]],"];
    [definition appendString:@"VERTCRS[\"ODN height\",VDATUM[\"Ordnance Datum Newlyn\",ID[\"EPSG\",5101]],"];
    [definition appendString:@"CS[vertical,1,ID[\"EPSG\",6499]],"];
    [definition appendString:@"AXIS[\"Gravity-related height (H)\",up],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",5701]],"];
    [definition appendString:@"ID[\"EPSG\",7405]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andCompareAuthority:PROJ_AUTHORITY_EPSG andCompareCode:@"27700" andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];

    definition = [NSMutableString string];
    [definition appendString:@"COMPD_CS[\"OSGB 1936 / British National Grid + ODN height\","];
    [definition appendString:@"PROJCS[\"OSGB 1936 / British National Grid\",GEOGCS[\"OSGB 1936\","];
    [definition appendString:@"DATUM[\"OSGB_1936\","];
    [definition appendString:@"SPHEROID[\"Airy 1830\",6377563.396,299.3249646,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7001\"]],"];
    [definition appendString:@"TOWGS84[446.448,-125.157,542.06,0.15,0.247,0.842,-20.489],AUTHORITY[\"EPSG\",\"6277\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4277\"]],"];
    [definition appendString:@"PROJECTION[\"Transverse_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",49],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",-2],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.9996012717],"];
    [definition appendString:@"PARAMETER[\"false_easting\",400000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",-100000],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"27700\"]],"];
    [definition appendString:@"VERT_CS[\"ODN height\",VERT_DATUM[\"Ordnance Datum Newlyn\",2005,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"5101\"]],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Up\",UP],AUTHORITY[\"EPSG\",\"5701\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7405\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andCompareAuthority:PROJ_AUTHORITY_EPSG andCompareCode:@"27700" andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];

}

/**
 * Test NGA 8101
 */
-(void) test8101{

    NSString *code = @"8101";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"COMPOUNDCRS[“WGS84 Height (EGM08)”,"];
    [definition appendString:@"GEODCRS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"World Geodetic System 1984\","];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,LENGTHUNIT[\"metre\",1.0]]],"];
    [definition appendString:@"CS[ellipsoidal,2],"];
    [definition appendString:@"AXIS[\"Geodetic latitude (Lat)\",north],"];
    [definition appendString:@"AXIS[\"Geodetic longitude (Long)\",east],"];
    [definition appendString:@"ANGLEUNIT[\"degree\",0.0174532925199433],ID[\"EPSG\",4326]],"];
    [definition appendString:@"VERTCRS[\"EGM2008 geoid height\","];
    [definition appendString:@"VDATUM[\"EGM2008 geoid\",ANCHOR[\"WGS 84 ellipsoid\"]],"];
    [definition appendString:@"CS[vertical,1],AXIS[\"Gravity-related height (H)\",up],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1.0]ID[\"EPSG\",\"3855\"]],"];
    [definition appendString:@"ID[“NSG”,”8101”]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_NSG andCode:code andCompareAuthority:PROJ_AUTHORITY_EPSG andCompareCode:@"4326" andDefinition:definition];

}

/**
 * Test EPSG 9801
 */
-(void) test9801{

    int code = 9801;

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"Lambert_Conformal_Conic (1SP)\","];
    [definition appendString:@"GEODCRS[\"GCS_North_American_1983\","];
    [definition appendString:@"DATUM[\"North_American_Datum_1983\","];
    [definition appendString:@"SPHEROID[\"GRS_1980\",6371000,0]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0],"];
    [definition appendString:@"UNIT[\"Degree\",0.017453292519943295]],"];
    [definition appendString:@"PROJECTION[\"Lambert_Conformal_Conic_1SP\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",25],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",-95],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_1\",25],"];
    [definition appendString:@"UNIT[\"Meter\",1],AUTHORITY[\"EPSG\",\"9801\"]]"];

    PROJProjection *projection = [PROJProjectionFactory projectionByDefinition:definition];

    [PROJTestUtils assertNotNil:projection];
    [PROJTestUtils assertEqualWithValue:PROJ_AUTHORITY_EPSG andValue2:projection.authority];
    [PROJTestUtils assertEqualWithValue:[NSString stringWithFormat:@"%d", code] andValue2:projection.code];
    [PROJTestUtils assertEqualWithValue:definition andValue2:projection.definition];
    [PROJTestUtils assertTrue:[[NSString stringWithUTF8String:projection.crs->descr] hasPrefix:@"Lambert Conformal Conic"]];
    [PROJTestUtils assertEqualDoubleWithValue:[[[CRSGeoDatums fromType:CRS_DATUM_NAD83] ellipsoid] equatorRadius] andValue2:projection.crs->a];

}

/**
 * Test EPSG 9802
 */
-(void) test9802{

    int code = 9802;

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"Lambert Conic Conformal (2SP)\","];
    [definition appendString:@"GEODCRS[\"GCS_North_American_1983\","];
    [definition appendString:@"DATUM[\"North_American_Datum_1983\","];
    [definition appendString:@"SPHEROID[\"GRS_1980\",6378160,298.2539162964695]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433]],"];
    [definition appendString:@"PROJECTION[\"Lambert_Conformal_Conic_2SP\"],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_1\",30],"];
    [definition appendString:@"PARAMETER[\"standard_parallel_2\",60],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",30],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",126],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9802\"]]"];

    PROJProjection *projection = [PROJProjectionFactory projectionByDefinition:definition];

    [PROJTestUtils assertNotNil:projection];
    [PROJTestUtils assertEqualWithValue:PROJ_AUTHORITY_EPSG andValue2:projection.authority];
    [PROJTestUtils assertEqualWithValue:[NSString stringWithFormat:@"%d", code] andValue2:projection.code];
    [PROJTestUtils assertEqualWithValue:definition andValue2:projection.definition];
    [PROJTestUtils assertTrue:[[NSString stringWithUTF8String:projection.crs->descr] hasPrefix:@"Lambert Conformal Conic"]];
    [PROJTestUtils assertEqualDoubleWithValue:[[[CRSGeoDatums fromType:CRS_DATUM_NAD83] ellipsoid] equatorRadius] andValue2:projection.crs->a];

}

/**
 * Test EPSG 21780
 */
-(void) test21780{

    NSString *code = @"21780";
    double delta = 0.0001;
    double minX = 5.96;
    double minY = 45.82;
    double maxX = 10.49;
    double maxY = 47.81;

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"Bern 1898 (Bern) / LV03C\",BASEGEOGCRS[\"Bern 1898 (Bern)\","];
    [definition appendString:@"DATUM[\"CH1903 (Bern)\","];
    [definition appendString:@"ELLIPSOID[\"Bessel 1841\",6377397.155,299.1528128,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",7004]],ID[\"EPSG\",6801]],"];
    [definition appendString:@"PRIMEM[\"Bern\",7.439583333,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]],ID[\"EPSG\",8907]],ID[\"EPSG\",4801]],"];
    [definition appendString:@"CONVERSION[\"Swiss Oblique Mercator 1903C\",METHOD[\"Hotine Oblique Mercator (variant B)\",ID[\"EPSG\",9815]],"];
    [definition appendString:@"PARAMETER[\"Latitude of projection centre\",46.952405556,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of projection centre\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Azimuth of initial line\",90,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Angle from Rectified to Skew Grid\",90,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor on initial line\",1,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"Easting at projection centre\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"Northing at projection centre\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"X-axis translation\",674.4,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Y-axis translation\",15.1,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"PARAMETER[\"Z-axis translation\",405.3,LENGTHUNIT[\"metre\",1.0]],"];
    [definition appendString:@"ID[\"EPSG\",19923]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4498]],AXIS[\"Easting (Y)\",east],AXIS[\"Northing (X)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",21780]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"Bern 1898 (Bern) / LV03C\","];
    [definition appendString:@"GEOGCS[\"Bern 1898 (Bern)\","];
    [definition appendString:@"DATUM[\"CH1903_Bern\","];
    [definition appendString:@"SPHEROID[\"Bessel 1841\",6377397.155,299.1528128,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7004\"]],"];
    [definition appendString:@"TOWGS84[674.4,15.1,405.3,0,0,0,0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6801\"]],"];
    [definition appendString:@"PRIMEM[\"Bern\",7.439583333333333,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8907\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4801\"]],"];
    [definition appendString:@"PROJECTION[\"Hotine_Oblique_Mercator_Azimuth_Center\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_center\",46.95240555555556],"];
    [definition appendString:@"PARAMETER[\"longitude_of_center\",0],"];
    [definition appendString:@"PARAMETER[\"azimuth\",90],"];
    [definition appendString:@"PARAMETER[\"rectified_grid_angle\",90],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",1],"];
    [definition appendString:@"PARAMETER[\"false_easting\",0],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Y\",EAST],"];
    [definition appendString:@"AXIS[\"X\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"21780\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
    
}

/**
 * Test EPSG 27258
 */
-(void) test27258{

    NSString *code = @"27258";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"NZGD49 / UTM zone 58S\",BASEGEOGCRS[\"NZGD49\","];
    [definition appendString:@"DATUM[\"New Zealand Geodetic Datum 1949\","];
    [definition appendString:@"ELLIPSOID[\"International 1924\",6378388,297,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],"];
    [definition appendString:@"ID[\"EPSG\",7022]],ID[\"EPSG\",6272]],ID[\"EPSG\",4272]],"];
    [definition appendString:@"CONVERSION[\"UTM zone 58S\",METHOD[\"Transverse Mercator\",ID[\"EPSG\",9807]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",165,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",0.9996,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",500000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",10000000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",16158]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4400]],AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",27258]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"NZGD49 / UTM zone 58S\","];
    [definition appendString:@"GEOGCS[\"NZGD49\","];
    [definition appendString:@"DATUM[\"New_Zealand_Geodetic_Datum_1949\","];
    [definition appendString:@"SPHEROID[\"International 1924\",6378388,297,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7022\"]],"];
    [definition appendString:@"TOWGS84[59.47,-5.04,187.44,0.47,-0.1,1.024,-4.5993],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6272\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4272\"]],"];
    [definition appendString:@"PROJECTION[\"Transverse_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",0],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",165],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.9996],"];
    [definition appendString:@"PARAMETER[\"false_easting\",500000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",10000000],"];
    [definition appendString:@"UNIT[\"metre\",1,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],"];
    [definition appendString:@"AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"27258\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];
    
}

/**
 * Test EPSG 32660
 */
-(void) test32660{

    NSString *code = @"32660";

    NSMutableString *definition = [NSMutableString string];
    [definition appendString:@"PROJCRS[\"WGS 84 / UTM zone 60N\",BASEGEOGCRS[\"WGS 84\","];
    [definition appendString:@"ENSEMBLE[\"World Geodetic System 1984 ensemble\","];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (Transit)\",ID[\"EPSG\",1166]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G730)\",ID[\"EPSG\",1152]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G873)\",ID[\"EPSG\",1153]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1150)\",ID[\"EPSG\",1154]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1674)\",ID[\"EPSG\",1155]],"];
    [definition appendString:@"MEMBER[\"World Geodetic System 1984 (G1762)\",ID[\"EPSG\",1156]],"];
    [definition appendString:@"ELLIPSOID[\"WGS 84\",6378137,298.257223563,ID[\"EPSG\",7030]],"];
    [definition appendString:@"ENSEMBLEACCURACY[2],ID[\"EPSG\",6326]],ID[\"EPSG\",4326]],"];
    [definition appendString:@"CONVERSION[\"UTM zone 60N\",METHOD[\"Transverse Mercator\",ID[\"EPSG\",9807]],"];
    [definition appendString:@"PARAMETER[\"Latitude of natural origin\",0,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Longitude of natural origin\",177,ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9102]]],"];
    [definition appendString:@"PARAMETER[\"Scale factor at natural origin\",0.9996,SCALEUNIT[\"unity\",1,ID[\"EPSG\",9201]]],"];
    [definition appendString:@"PARAMETER[\"False easting\",500000,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],"];
    [definition appendString:@"ID[\"EPSG\",16060]],"];
    [definition appendString:@"CS[Cartesian,2,ID[\"EPSG\",4400]],AXIS[\"Easting (E)\",east],AXIS[\"Northing (N)\",north],"];
    [definition appendString:@"LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]],ID[\"EPSG\",32660]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / UTM zone 60N\",GEOGCS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS 84\",6378137,298.257223563,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"7030\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,AUTHORITY[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.01745329251994328,"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"UNIT[\"metre\",1,AUTHORITY[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"PROJECTION[\"Transverse_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",0],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",177],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.9996],"];
    [definition appendString:@"PARAMETER[\"false_easting\",500000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"AUTHORITY[\"EPSG\",\"32660\"],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

    definition = [NSMutableString string];
    [definition appendString:@"PROJCS[\"WGS 84 / UTM zone 60N\",GEOGCRS[\"WGS 84\","];
    [definition appendString:@"DATUM[\"WGS_1984\","];
    [definition appendString:@"SPHEROID[\"WGS84\",6378137,298.257223563,"];
    [definition appendString:@"ID[\"EPSG\",\"7030\"]],ID[\"EPSG\",\"6326\"]],"];
    [definition appendString:@"PRIMEM[\"Greenwich\",0,ID[\"EPSG\",\"8901\"]],"];
    [definition appendString:@"UNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",\"9122\"]],"];
    [definition appendString:@"ID[\"EPSG\",\"4326\"]],"];
    [definition appendString:@"PROJECTION[\"Transverse_Mercator\"],"];
    [definition appendString:@"PARAMETER[\"latitude_of_origin\",0],"];
    [definition appendString:@"PARAMETER[\"central_meridian\",177],"];
    [definition appendString:@"PARAMETER[\"scale_factor\",0.9996],"];
    [definition appendString:@"PARAMETER[\"false_easting\",500000],"];
    [definition appendString:@"PARAMETER[\"false_northing\",0],"];
    [definition appendString:@"UNIT[\"metre\",1,ID[\"EPSG\",\"9001\"]],"];
    [definition appendString:@"AXIS[\"Easting\",EAST],AXIS[\"Northing\",NORTH],"];
    [definition appendString:@"ID[\"EPSG\",\"32660\"]]"];

    [self projectionTestDerivedWithAuthority:PROJ_AUTHORITY_EPSG andCode:code andDefinition:definition];

}

/**
 * Test projection creation and transformations with derived authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param definition
 *            WKT definition
 */
-(void) projectionTestDerivedWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition{
    [self projectionTestDerivedWithAuthority:authority andCode:code andDefinition:definition andDelta:0];
}

/**
 * Test projection creation and transformations with specified authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param definition
 *            WKT definition
 */
-(void) projectionTestSpecifiedWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition{
    [self projectionTestSpecifiedWithAuthority:authority andCode:code andDefinition:definition andDelta:0];
}

/**
 * Test projection creation and transformations with derived authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param definition
 *            WKT definition
 */
-(void) projectionTestDerivedWithAuthority: (NSString *) authority andCode: (NSString *) code andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDefinition: (NSString *) definition{
    [self projectionTestDerivedWithAuthority:authority andCode:code andCompareAuthority:compareAuthority andCompareCode:compareCode andDefinition:definition andDelta:0];
}

/**
 * Test projection creation and transformations with derived authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param definition
 *            WKT definition
 * @param minX
 *            min x in degrees
 * @param minY
 *            min y in degrees
 * @param maxX
 *            max x in degrees
 * @param maxY
 *            max y in degrees
 */
-(void) projectionTestDerivedWithAuthority: (NSString *) authority andCode: (NSString *) code andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDefinition: (NSString *) definition andMinX: (double) minX andMinY: (double) minY andMaxX: (double) maxX andMaxY: (double) maxY{
    [self projectionTestDerivedWithAuthority:authority andCode:code andCompareAuthority:compareAuthority andCompareCode:compareCode andDefinition:definition andDelta:0 andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
}

/**
 * Test projection creation and transformations with specified authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param definition
 *            WKT definition
 */
-(void) projectionTestSpecifiedWithAuthority: (NSString *) authority andCode: (NSString *) code andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDefinition: (NSString *) definition{
    [self projectionTestSpecifiedWithAuthority:authority andCode:code andCompareAuthority:compareAuthority andCompareCode:compareCode andDefinition:definition andDelta:0];
}

/**
 * Test projection creation and transformations with derived authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param definition
 *            WKT definition
 * @param delta
 *            delta comparison
 */
-(void) projectionTestDerivedWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition andDelta: (double) delta{
    [self projectionTestDerivedWithAuthority:authority andCode:code andCompareAuthority:authority andCompareCode:code andDefinition:definition andDelta:delta];
}

/**
 * Test projection creation and transformations with specified authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param definition
 *            WKT definition
 * @param delta
 *            delta comparison
 */
-(void) projectionTestSpecifiedWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition andDelta: (double) delta{
    [self projectionTestSpecifiedWithAuthority:authority andCode:code andCompareAuthority:authority andCompareCode:code andDefinition:definition andDelta:delta];
}

/**
 * Test projection creation and transformations with derived authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param definition
 *            WKT definition
 * @param delta
 *            delta comparison
 */
-(void) projectionTestDerivedWithAuthority: (NSString *) authority andCode: (NSString *) code andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDefinition: (NSString *) definition andDelta: (double) delta{
    PROJProjection *projection = [PROJProjectionFactory projectionByDefinition:definition];
    [self projectionTestWithAuthority:authority andCode:code andCompareAuthority:compareAuthority andCompareCode:compareCode andDefinition:definition andProjection:projection andDelta:delta];
}

/**
 * Test projection creation and transformations with derived authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param definition
 *            WKT definition
 * @param minX
 *            min x in degrees
 * @param minY
 *            min y in degrees
 * @param maxX
 *            max x in degrees
 * @param maxY
 *            max y in degrees
 */
-(void) projectionTestDerivedWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition andMinX: (double) minX andMinY: (double) minY andMaxX: (double) maxX andMaxY: (double) maxY{
    [self projectionTestDerivedWithAuthority:authority andCode:code andDefinition:definition andDelta:0 andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
}

/**
 * Test projection creation and transformations with derived authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param definition
 *            WKT definition
 * @param delta
 *            delta comparison
 * @param minX
 *            min x in degrees
 * @param minY
 *            min y in degrees
 * @param maxX
 *            max x in degrees
 * @param maxY
 *            max y in degrees
 */
-(void) projectionTestDerivedWithAuthority: (NSString *) authority andCode: (NSString *) code andDefinition: (NSString *) definition andDelta: (double) delta andMinX: (double) minX andMinY: (double) minY andMaxX: (double) maxX andMaxY: (double) maxY{
    [self projectionTestDerivedWithAuthority:authority andCode:code andCompareAuthority:authority andCompareCode:code andDefinition:definition andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
}

/**
 * Test projection creation and transformations with derived authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param definition
 *            WKT definition
 * @param delta
 *            delta comparison
 * @param minX
 *            min x in degrees
 * @param minY
 *            min y in degrees
 * @param maxX
 *            max x in degrees
 * @param maxY
 *            max y in degrees
 */
-(void) projectionTestDerivedWithAuthority: (NSString *) authority andCode: (NSString *) code andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDefinition: (NSString *) definition andDelta: (double) delta andMinX: (double) minX andMinY: (double) minY andMaxX: (double) maxX andMaxY: (double) maxY{
    PROJProjection *projection = [PROJProjectionFactory projectionByDefinition:definition];
    [self projectionTestWithAuthority:authority andCode:code andCompareAuthority:compareAuthority andCompareCode:compareCode andDefinition:definition andProjection:projection andDelta:delta andMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
}

/**
 * Test projection creation and transformations with specified authority and
 * epsg
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param definition
 *            WKT definition
 * @param delta
 *            delta comparison
 */
-(void) projectionTestSpecifiedWithAuthority: (NSString *) authority andCode: (NSString *) code andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDefinition: (NSString *) definition andDelta: (double) delta{
    PROJProjection *projection = [PROJProjectionFactory projectionWithAuthority:authority andCode:code andDefinition:definition];
    [self projectionTestWithAuthority:authority andCode:code andCompareAuthority:compareAuthority andCompareCode:compareCode andDefinition:definition andProjection:projection andDelta:delta];
}

/**
 * Test projection creation and transformations
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param definition
 *            WKT definition
 * @param projection
 *            projection
 * @param delta
 *            delta comparison
 */
-(void) projectionTestWithAuthority: (NSString *) authority andCode: (NSString *) code andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDefinition: (NSString *) definition andProjection: (PROJProjection *) projection andDelta: (double) delta{
    [self projectionTestWithAuthority:authority andCode:code andCompareAuthority:compareAuthority andCompareCode:compareCode andDefinition:definition andProjection:projection andDelta:delta andMinX:-PROJ_WGS84_HALF_WORLD_LON_WIDTH andMinY:PROJ_WEB_MERCATOR_MIN_LAT_RANGE andMaxX:PROJ_WGS84_HALF_WORLD_LON_WIDTH andMaxY:PROJ_WEB_MERCATOR_MAX_LAT_RANGE];
}

/**
 * Test projection creation and transformations
 *
 * @param authority
 *            authority
 * @param code
 *            code
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param definition
 *            WKT definition
 * @param projection
 *            projection
 * @param delta
 *            delta comparison
 * @param minX
 *            min x in degrees
 * @param minY
 *            min y in degrees
 * @param maxX
 *            max x in degrees
 * @param maxY
 *            max y in degrees
 */
-(void) projectionTestWithAuthority: (NSString *) authority andCode: (NSString *) code andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDefinition: (NSString *) definition andProjection: (PROJProjection *) projection andDelta: (double) delta andMinX: (double) minX andMinY: (double) minY andMaxX: (double) maxX andMaxY: (double) maxY{

    [PROJTestUtils assertNotNil:projection];
    [PROJTestUtils assertEqualWithValue:authority andValue2:projection.authority];
    [PROJTestUtils assertEqualWithValue:code andValue2:projection.code];
    [PROJTestUtils assertEqualWithValue:definition andValue2:projection.definition];

    PROJProjection *projection2 = [PROJProjectionFactory cachelessProjectionWithName:compareCode];

    [self compareProjection:projection withProjection:projection2 andCompareAuthority:compareAuthority andCompareCode:compareCode andDelta:delta];

    int transformCode;
    if([projection isUnit:PROJ_UNIT_METERS]){
        transformCode = 4326;
    }else{
        transformCode = 3857;
        PROJProjectionTransform *boundsTransform = [PROJProjectionTransform transformFromEpsg:4326 andToEpsg:3857];
        NSArray<NSDecimalNumber *> *projectedBounds = [boundsTransform transformWithMinX:minX andMinY:minY andMaxX:maxX andMaxY:maxY];
        minX = [[projectedBounds objectAtIndex:0] doubleValue];
        minY = [[projectedBounds objectAtIndex:1] doubleValue];
        maxX = [[projectedBounds objectAtIndex:2] doubleValue];
        maxY = [[projectedBounds objectAtIndex:3] doubleValue];
    }

    PROJProjection *transformProjection = [PROJProjectionFactory projectionWithEpsgInt:transformCode];

    PROJProjectionTransform *transformTo = [transformProjection transformationWithProjection:projection];
    PROJProjectionTransform *transformTo2 = [transformProjection transformationWithProjection:projection2];

    PROJProjectionTransform *transformFrom = [projection transformationWithProjection:transformProjection];
    PROJProjectionTransform *transformFrom2 = [projection2 transformationWithProjection:transformProjection];

    double xRange = maxX - minX;
    double yRange = maxY - minY;
    double midX = minX + (xRange / 2.0);
    double midY = minY + (yRange / 2.0);

    [self coordinateTestWithX:minX andY:minY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    [self coordinateTestWithX:minX andY:maxY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    [self coordinateTestWithX:maxX andY:minY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    [self coordinateTestWithX:maxX andY:maxY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    [self coordinateTestWithX:midX andY:minY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    [self coordinateTestWithX:midX andY:maxY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    [self coordinateTestWithX:minX andY:midY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    [self coordinateTestWithX:maxX andY:midY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    [self coordinateTestWithX:midX andY:midY andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];

    for(int i = 0; i < 10; i++){
        
        double x = minX + ([PROJTestUtils randomDouble] * xRange);
        double y = minY + ([PROJTestUtils randomDouble] * yRange);
        [self coordinateTestWithX:x andY:y andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
    }

    [PROJProjectionFactory clearTransform:transformTo];
    [PROJProjectionFactory clearTransform:transformTo2];
    
}

/**
 * Test transformations of a coordinate
 *
 * @param x
 *            x coordinate
 * @param y
 *            y coordinate
 * @param delta
 *            delta comparison
 * @param transformTo
 *            transformation to
 * @param transformTo2
 *            transformation to 2
 * @param transformFrom
 *            transformation from
 * @param transformFrom2
 *            transformation from 2
 */
-(void) coordinateTestWithX: (double) x andY: (double) y andDelta: (double) delta andTransformTo: (PROJProjectionTransform *) transformTo andTransformTo2: (PROJProjectionTransform *) transformTo2 andTransformFrom: (PROJProjectionTransform *) transformFrom andTransformFrom2: (PROJProjectionTransform *) transformFrom2{
    [self coordinateTestWithCoordinate:CLLocationCoordinate2DMake(y, x) andDelta:delta andTransformTo:transformTo andTransformTo2:transformTo2 andTransformFrom:transformFrom andTransformFrom2:transformFrom2];
}

/**
 * Test transformation of a coordinate
 *
 * @param coordinate
 *            projection coordinate
 * @param delta
 *            delta comparison
 * @param transformTo
 *            transformation to
 * @param transformTo2
 *            transformation to 2
 * @param transformFrom
 *            transformation from
 * @param transformFrom2
 *            transformation from 2
 */
-(void) coordinateTestWithCoordinate: (CLLocationCoordinate2D) coordinate andDelta: (double) delta andTransformTo: (PROJProjectionTransform *) transformTo andTransformTo2: (PROJProjectionTransform *) transformTo2 andTransformFrom: (PROJProjectionTransform *) transformFrom andTransformFrom2: (PROJProjectionTransform *) transformFrom2{

    CLLocationCoordinate2D coordinateTo= [transformTo transform:coordinate];
    CLLocationCoordinate2D coordinateTo2= [transformTo2 transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:coordinateTo2.longitude andValue2:coordinateTo.longitude andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:coordinateTo2.latitude andValue2:coordinateTo.latitude andDelta:delta];

    CLLocationCoordinate2D coordinateFrom = [transformFrom transform:coordinateTo];
    CLLocationCoordinate2D coordinateFrom2 = [transformFrom2 transform:coordinateTo];

    if(delta > 0.0){
        double difference = fabs(coordinateFrom2.longitude - coordinateFrom.longitude);
        [PROJTestUtils assertTrue:difference <= delta || fabs(difference - 360.0) <= delta];
    }else{
        [PROJTestUtils assertEqualDoubleWithValue:coordinateFrom2.longitude andValue2:coordinateFrom.longitude andDelta:delta];
    }
    [PROJTestUtils assertEqualDoubleWithValue:coordinateFrom2.latitude andValue2:coordinateFrom.latitude andDelta:delta];

}

/**
 * Compare two projections
 *
 * @param projection
 *            projection
 * @param projection2
 *            projection 2
 * @param compareAuthority
 *            compare authority
 * @param compareCode
 *            compare code
 * @param delta
 *            delta comparison
 */
-(void) compareProjection: (PROJProjection *) projection withProjection: (PROJProjection *) projection2 andCompareAuthority: (NSString *) compareAuthority andCompareCode: (NSString *) compareCode andDelta: (double) delta{

    if(![projection.code isEqualToString:compareCode] || ![projection.authority isEqualToString:compareAuthority]){
        projection2 = [PROJProjection projectionWithAuthority:projection.authority andCode:projection.code andCrs:projection2.crs];
    }

    [PROJTestUtils assertEqualWithValue:projection andValue2:projection2];
    
    projPJ crs = [projection crs];
    projPJ crs2 = [projection2 crs];
    [PROJTestUtils assertEqualWithValue:[NSString stringWithUTF8String:crs->descr] andValue2:[NSString stringWithUTF8String:crs2->descr]];
    NSDictionary<NSString *, NSString *> *params1 = [self params:crs];
    NSDictionary<NSString *, NSString *> *params2 = [self params:crs2];
    [self compareParams:params1 withParams:params2 andDelta:delta];
    [PROJTestUtils assertEqualIntWithValue:crs->over andValue2:crs2->over];
    [PROJTestUtils assertEqualIntWithValue:crs->geoc andValue2:crs2->geoc];
    [PROJTestUtils assertEqualIntWithValue:crs->is_latlong andValue2:crs2->is_latlong];
    [PROJTestUtils assertEqualIntWithValue:crs->is_geocent andValue2:crs2->is_geocent];
    [PROJTestUtils assertEqualDoubleWithValue:crs->a andValue2:crs2->a];
    [PROJTestUtils assertEqualDoubleWithValue:crs->a_orig andValue2:crs2->a_orig];
    [PROJTestUtils assertEqualDoubleWithValue:crs->es andValue2:crs2->es andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->es_orig andValue2:crs2->es_orig andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->e andValue2:crs2->e andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->ra andValue2:crs2->ra];
    [PROJTestUtils assertEqualDoubleWithValue:crs->one_es andValue2:crs2->one_es andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->rone_es andValue2:crs2->rone_es andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->lam0 andValue2:crs2->lam0 andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->phi0 andValue2:crs2->phi0 andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->x0 andValue2:crs2->x0 andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->y0 andValue2:crs2->y0 andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->k0 andValue2:crs2->k0];
    [PROJTestUtils assertEqualDoubleWithValue:crs->to_meter andValue2:crs2->to_meter];
    [PROJTestUtils assertEqualDoubleWithValue:crs->fr_meter andValue2:crs2->fr_meter];
    if(crs->datum_type != crs2->datum_type){
        [PROJTestUtils assertTrue:crs->datum_type == PJD_UNKNOWN || crs2->datum_type == PJD_UNKNOWN];
    }
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[0] andValue2:crs2->datum_params[0] andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[1] andValue2:crs2->datum_params[1] andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[2] andValue2:crs2->datum_params[2] andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[3] andValue2:crs2->datum_params[3] andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[4] andValue2:crs2->datum_params[4] andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[5] andValue2:crs2->datum_params[5] andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[6] andValue2:crs2->datum_params[6] andDelta:delta];
    [PROJTestUtils assertEqualIntWithValue:crs->gridlist_count andValue2:crs2->gridlist_count];
    [PROJTestUtils assertEqualIntWithValue:crs->has_geoid_vgrids andValue2:crs2->has_geoid_vgrids];
    [PROJTestUtils assertEqualIntWithValue:crs->vgridlist_geoid_count andValue2:crs2->vgridlist_geoid_count];
    [PROJTestUtils assertEqualDoubleWithValue:crs->vto_meter andValue2:crs2->vto_meter];
    [PROJTestUtils assertEqualDoubleWithValue:crs->vfr_meter andValue2:crs2->vfr_meter];
    [PROJTestUtils assertEqualDoubleWithValue:crs->from_greenwich andValue2:crs2->from_greenwich];
    [PROJTestUtils assertEqualDoubleWithValue:crs->long_wrap_center andValue2:crs2->long_wrap_center];
    [PROJTestUtils assertEqualIntWithValue:crs->is_long_wrap_set andValue2:crs2->is_long_wrap_set];
    [PROJTestUtils assertEqualWithValue:[NSString stringWithUTF8String:crs->axis] andValue2:[NSString stringWithUTF8String:crs2->axis]];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_date andValue2:crs2->datum_date];
     
}

-(NSDictionary<NSString *, NSString *> *) params: (projPJ) crs{
    
    NSMutableDictionary<NSString *, NSString *> *params = [NSMutableDictionary dictionary];
    
    paralist *curr;
    for(curr = crs->params; curr; curr = curr->next){
        NSString *param = [NSString stringWithUTF8String:curr->param];
        NSString *key = nil;
        NSString *value = nil;
        NSRange range = [param rangeOfString:@"="];
        if(range.length != 0){
            key = [param substringToIndex:range.location];
            value = [param substringFromIndex:range.location + 1];
        }else{
            key = param;
            value = @"";
        }
        [params setValue:value forKey:key];
        if([key isEqualToString:@"k"]){
            [params setValue:value forKey:@"k_0"];
        }
    }
    
    return params;
}

-(void) compareParams: (NSDictionary<NSString *, NSString *> *) params1 withParams: (NSDictionary<NSString *, NSString *> *) params2 andDelta: (double) delta{
    
    for(NSString *key in params1){
        NSString *value1 = [params1 objectForKey:key];
        NSString *value2 = [params2 objectForKey:key];
        if(value2 == nil){
            value2 = @"0";
        }
        NSScanner *scanner1 = [NSScanner scannerWithString:value1];
        NSScanner *scanner2 = [NSScanner scannerWithString:value2];
        double number1;
        double number2;
        if([scanner1 scanDouble:&number1] && [scanner2 scanDouble:&number2]){
            [PROJTestUtils assertEqualDoubleWithValue:number1 andValue2:number2 andDelta:delta];
        }else{
            [PROJTestUtils assertEqualWithValue:value1 andValue2:value2];
        }
    }
    
}

@end
