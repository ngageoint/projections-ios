//
//  SFPReadmeTest.m
//  sf-proj-iosTests
//
//  Created by Brian Osborn on 7/24/20.
//  Copyright © 2020 NGA. All rights reserved.
//

#import "SFPReadmeTest.h"
#import "SFPTestUtils.h"
#import "SFPProjectionFactory.h"
#import "SFPProjectionTransform.h"
#import "SFPProjectionConstants.h"

@implementation SFPReadmeTest

/**
 * Test transform
 */
-(void) testTransform{
    
    SFGeometry *transformed = [self transformTester: [[SFPoint alloc] initWithXValue:111319.49079327357 andYValue:111325.14286638486]];
    
    [SFPTestUtils assertEqualIntWithValue:SF_POINT andValue2:transformed.geometryType];
    SFPoint *point = (SFPoint *) transformed;
    [SFPTestUtils assertEqualDoubleWithValue:1.0 andValue2:[point.x doubleValue] andDelta:.0000000000001];
    [SFPTestUtils assertEqualDoubleWithValue:1.0 andValue2:[point.y doubleValue] andDelta:.0000000000001];
    
}

/**
 * Test transform
 *
 * @param geometry
 *            geometry
 * @return geometry
 */
-(SFGeometry *) transformTester: (SFGeometry *) geometry{
    
    // SFGeometry *geometry = ...

    SFPProjection *projection1 =
        [SFPProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_EPSG
        andIntCode:PROJ_EPSG_WEB_MERCATOR];
    SFPProjection *projection2 =
        [SFPProjectionFactory projectionWithAuthority:PROJ_AUTHORITY_EPSG
        andIntCode:PROJ_EPSG_WORLD_GEODETIC_SYSTEM];
    
    SFPProjectionTransform *transform =
        [[SFPProjectionTransform alloc] initWithFromProjection:projection1
        andToProjection:projection2];

    SFGeometry *transformed = [transform transformWithGeometry:geometry];

    return transformed;
}

@end
