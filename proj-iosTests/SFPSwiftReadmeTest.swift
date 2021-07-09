//
//  SFPSwiftReadmeTest.swift
//  sf-proj-iosTests
//
//  Created by Brian Osborn on 7/24/20.
//  Copyright © 2020 NGA. All rights reserved.
//

import XCTest

/**
* README example tests
*/
class SFPSwiftReadmeTest: XCTestCase{
    
    /**
     * Test transform
     */
    func testTransform(){
        
        let transformed: SFGeometry = transformTester(SFPoint(xValue: 111319.49079327357, andYValue: 111325.14286638486))
        
        SFPTestUtils.assertEqualInt(withValue: Int32(SF_POINT.rawValue), andValue2: Int32(transformed.geometryType.rawValue))
        let point: SFPoint = transformed as! SFPoint
        SFPTestUtils.assertEqualDouble(withValue: 1.0, andValue2: point.x.doubleValue, andDelta: 0.0000000000001)
        SFPTestUtils.assertEqualDouble(withValue: 1.0, andValue2: point.y.doubleValue, andDelta: 0.0000000000001)
        
    }
    
    /**
     * Test transform
     *
     * @param geometry
     *            geometry
     * @return geometry
     */
    func transformTester(_ geometry: SFGeometry) -> SFGeometry{
    
        // var geometry: SFGeometry = ...

        let projection1: SFPProjection = SFPProjectionFactory.projection(withAuthority: PROJ_AUTHORITY_EPSG, andIntCode: PROJ_EPSG_WEB_MERCATOR)
        let projection2: SFPProjection = SFPProjectionFactory.projection(withAuthority: PROJ_AUTHORITY_EPSG, andIntCode: PROJ_EPSG_WORLD_GEODETIC_SYSTEM)
        
        let transform: SFPProjectionTransform = SFPProjectionTransform(from: projection1, andTo: projection2)
        
        let transformed: SFGeometry = transform.transform(with: geometry)

        return transformed
    }
    
}
