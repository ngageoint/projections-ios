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

@implementation PROJProjectionFactoryCodeTest

- (void)setUp {
    [super setUp];
    [PROJProjectionFactory clear];
    [PROJProjectionRetriever clear];
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
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],ID[\"EPSG\",19895]],"];
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
    [definition appendString:@"PARAMETER[\"False northing\",0,LENGTHUNIT[\"metre\",1,ID[\"EPSG\",9001]]],ID[\"EPSG\",19894]],"];
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
 * Test EPSG 3857
 */
/* TODO
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
 */

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

// TODO

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
    [PROJTestUtils assertEqualDoubleWithValue:crs->es andValue2:crs2->es];
    [PROJTestUtils assertEqualDoubleWithValue:crs->es_orig andValue2:crs2->es_orig];
    [PROJTestUtils assertEqualDoubleWithValue:crs->e andValue2:crs2->e];
    [PROJTestUtils assertEqualDoubleWithValue:crs->ra andValue2:crs2->ra];
    [PROJTestUtils assertEqualDoubleWithValue:crs->one_es andValue2:crs2->one_es];
    [PROJTestUtils assertEqualDoubleWithValue:crs->rone_es andValue2:crs2->rone_es];
    [PROJTestUtils assertEqualDoubleWithValue:crs->lam0 andValue2:crs2->lam0 andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->phi0 andValue2:crs2->phi0 andDelta:delta];
    [PROJTestUtils assertEqualDoubleWithValue:crs->x0 andValue2:crs2->x0];
    [PROJTestUtils assertEqualDoubleWithValue:crs->y0 andValue2:crs2->y0];
    [PROJTestUtils assertEqualDoubleWithValue:crs->k0 andValue2:crs2->k0];
    [PROJTestUtils assertEqualDoubleWithValue:crs->to_meter andValue2:crs2->to_meter];
    [PROJTestUtils assertEqualDoubleWithValue:crs->fr_meter andValue2:crs2->fr_meter];
    if(crs->datum_type != crs2->datum_type){
        [PROJTestUtils assertTrue:crs->datum_type == PJD_UNKNOWN || crs2->datum_type == PJD_UNKNOWN];
    }
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[0] andValue2:crs2->datum_params[0]];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[1] andValue2:crs2->datum_params[1]];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[2] andValue2:crs2->datum_params[2]];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[3] andValue2:crs2->datum_params[3]];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[4] andValue2:crs2->datum_params[4]];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[5] andValue2:crs2->datum_params[5]];
    [PROJTestUtils assertEqualDoubleWithValue:crs->datum_params[6] andValue2:crs2->datum_params[6]];
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
