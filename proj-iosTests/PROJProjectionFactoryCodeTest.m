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
    CLLocationCoordinate2D expectedCoordinate = CLLocationCoordinate2DMake(1.8282612229838397E7, 1.1608322257560592E7);

    PROJProjection *projection = [PROJProjectionFactory projectionByDefinition:definition];
    PROJProjectionTransform *transform = [PROJProjectionTransform transformFromEpsg:4326 andToProjection:projection];
    CLLocationCoordinate2D projectedCoordinate = [transform transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.longitude andValue2:projectedCoordinate.longitude];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.latitude andValue2:projectedCoordinate.latitude];
    
    PROJProjection *projection2 = [PROJProjectionFactory cachelessProjectionWithName:code];
    PROJProjectionTransform *transform2 = [PROJProjectionTransform transformFromEpsg:4326 andToProjection:projection2];
    CLLocationCoordinate2D projectedCoordinate2 = [transform2 transform:coordinate];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.longitude andValue2:projectedCoordinate2.longitude];
    [PROJTestUtils assertEqualDoubleWithValue:expectedCoordinate.latitude andValue2:projectedCoordinate2.latitude];
    
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

    PROJProjection *transformProjection = [PROJProjectionFactory cachelessProjectionWithEpsgInt:transformCode];

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

    /* TODO
    
    CoordinateReferenceSystem crs = projection.getCrs();
    CoordinateReferenceSystem crs2 = projection2.getCrs();
    Datum datum = crs.getDatum();
    Datum datum2 = crs2.getDatum();
    Ellipsoid ellipsoid = datum.getEllipsoid();
    Ellipsoid ellipsoid2 = datum2.getEllipsoid();
    double[] transform = datum.getTransformToWGS84();
    double[] transform2 = datum2.getTransformToWGS84();
    org.locationtech.proj4j.proj.Projection proj = crs.getProjection();
    org.locationtech.proj4j.proj.Projection proj2 = crs2.getProjection();

    assertEquals(ellipsoid.getEccentricitySquared(),
            ellipsoid2.getEccentricitySquared(), 0);
    assertEquals(ellipsoid.getEquatorRadius(),
            ellipsoid2.getEquatorRadius(), 0);
    assertEquals(ellipsoid.getA(), ellipsoid2.getA(), 0);
    assertEquals(ellipsoid.getB(), ellipsoid2.getB(), 0);

    assertEquals(proj.getEllipsoid().getEccentricitySquared(),
            proj2.getEllipsoid().getEccentricitySquared(), 0);
    assertEquals(proj.getEllipsoid().getEquatorRadius(),
            proj2.getEllipsoid().getEquatorRadius(), 0);
    assertEquals(proj.getEllipsoid().getA(), proj2.getEllipsoid().getA(),
            0);
    assertEquals(proj.getEllipsoid().getB(), proj2.getEllipsoid().getB(),
            0);

    if (transform != null || transform2 != null) {
        if (transform != null && transform2 != null) {
            assertEquals(transform.length, transform2.length);
            for (int i = 0; i < transform.length; i++) {
                assertEquals(transform[i], transform2[i], 0);
            }
        } else {
            double[] transformTest = transform != null ? transform
                    : transform2;
            for (int i = 0; i < transformTest.length; i++) {
                assertEquals(0, transformTest[i], 0);
            }
        }
    }

    assertEquals(proj.getAlpha(), proj2.getAlpha(), delta);
    assertEquals(proj.getAxisOrder(), proj2.getAxisOrder());
    assertEquals(proj.getEPSGCode(), proj2.getEPSGCode(), 0);
    assertEquals(proj.getEquatorRadius(), proj2.getEquatorRadius(), 0);
    assertEquals(proj.getFalseEasting(), proj2.getFalseEasting(), 0);
    assertEquals(proj.getFalseNorthing(), proj2.getFalseNorthing(), 0);
    assertEquals(proj.getFromMetres(), proj2.getFromMetres(), 0);
    assertEquals(proj.getLonC(), proj2.getLonC(), delta);
    assertEquals(proj.getMaxLatitude(), proj2.getMaxLatitude(), 0);
    assertEquals(proj.getMaxLatitudeDegrees(),
            proj2.getMaxLatitudeDegrees(), 0);
    assertEquals(proj.getMaxLongitude(), proj2.getMaxLongitude(), 0);
    assertEquals(proj.getMaxLongitudeDegrees(),
            proj2.getMaxLongitudeDegrees(), 0);
    assertEquals(proj.getMinLatitude(), proj2.getMinLatitude(), 0);
    assertEquals(proj.getMinLatitudeDegrees(),
            proj2.getMinLatitudeDegrees(), 0);
    assertEquals(proj.getMinLongitude(), proj2.getMinLongitude(), 0);
    assertEquals(proj.getMinLongitudeDegrees(),
            proj2.getMinLongitudeDegrees(), 0);
    assertEquals(proj.getPrimeMeridian(), proj2.getPrimeMeridian());
    if (delta == 0.0) {
        assertEquals(proj.getPROJ4Description().toLowerCase(),
                proj2.getPROJ4Description().toLowerCase());
    }
    assertEquals(proj.getProjectionLatitude(),
            proj2.getProjectionLatitude(), delta);
    assertEquals(proj.getProjectionLatitude1(),
            proj2.getProjectionLatitude1(), delta);
    assertEquals(proj.getProjectionLatitude1Degrees(),
            proj2.getProjectionLatitude1Degrees(), delta);
    assertEquals(proj.getProjectionLatitude2(),
            proj2.getProjectionLatitude2(), delta);
    assertEquals(proj.getProjectionLatitude2Degrees(),
            proj2.getProjectionLatitude2Degrees(), delta);
    assertEquals(proj.getProjectionLatitudeDegrees(),
            proj2.getProjectionLatitudeDegrees(), delta);
    assertEquals(proj.getProjectionLongitude(),
            proj2.getProjectionLongitude(), delta);
    assertEquals(proj.getProjectionLongitudeDegrees(),
            proj2.getProjectionLongitudeDegrees(), delta);
    assertEquals(proj.getScaleFactor(), proj2.getScaleFactor(), 0);
    assertEquals(proj.getTrueScaleLatitude(), proj2.getTrueScaleLatitude(),
            delta);
    assertEquals(proj.getTrueScaleLatitudeDegrees(),
            proj2.getTrueScaleLatitudeDegrees(), delta);
    assertEquals(proj.getUnits(), proj2.getUnits());

     */
     
}

@end
