//
//  PROJReadmeTest.m
//  proj-iosTests
//
//  Created by Brian Osborn on 7/9/21.
//  Copyright © 2021 NGA. All rights reserved.
//

#import "PROJReadmeTest.h"
#import "PROJProjectionFactory.h"
#import "PROJProjectionConstants.h"
#import "PROJTestUtils.h"

@implementation PROJReadmeTest

/**
 * Test transform
 */
-(void) testTransform{
    
    CLLocationCoordinate2D transformed = [self testTransform:
                                          CLLocationCoordinate2DMake(111325.14286638486, 111319.49079327357)];
    
    [PROJTestUtils assertEqualDoubleWithValue:1.0 andValue2:transformed.longitude andDelta:.0000000000001];
    [PROJTestUtils assertEqualDoubleWithValue:1.0 andValue2:transformed.latitude andDelta:.0000000000001];
    
}

/**
 * Test transform
 *
 * @param coordinate
 *            projection coordinate
 * @return projection coordinate
 */
-(CLLocationCoordinate2D) testTransform: (CLLocationCoordinate2D) coordinate{
    
    // CLLocationCoordinate2D coordinate = ...

    PROJProjection *projection1 = [PROJProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_EPSG
                                                                      andIntCode:PROJ_EPSG_WEB_MERCATOR];
    PROJProjection *projection2 = [PROJProjectionFactory projectionWithName:@"EPSG:4326"];
    NSString *params = @"+proj=tmerc +lat_0=0 +lon_0=121 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 +towgs84=-127.62,-67.24,-47.04,-3.068,4.903,1.578,-1.06 +units=m +no_defs";
    PROJProjection *projection3 = [PROJProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_EPSG
                                                                      andIntCode:3123
                                                                       andParams:params];
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
    PROJProjection *projection4 = [PROJProjectionFactory projectionByDefinition:definition];

    PROJProjectionTransform *transform = [projection1 transformationWithProjection:projection2];
    PROJProjectionTransform *inverseTransform = [transform inverseTransformation];
    
    CLLocationCoordinate2D transformed = [transform transform:coordinate];
    CLLocationCoordinate2D inverseTransformed = [inverseTransform transform:transformed];

    [transform destroy];
    [inverseTransform destroy];

    return transformed;
}

@end
