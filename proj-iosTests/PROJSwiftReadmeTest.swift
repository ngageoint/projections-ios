//
//  PROJSwiftReadmeTest.swift
//  proj-iosTests
//
//  Created by Brian Osborn on 7/9/21.
//  Copyright © 2021 NGA. All rights reserved.
//

import XCTest

/**
* README example tests
*/
class PROJSwiftReadmeTest: XCTestCase{
    
    /**
     * Test transform
     */
    func testTransform(){
        
        let transformed : CLLocationCoordinate2D = testTransform(CLLocationCoordinate2DMake(111325.14286638486, 111319.49079327357))
        
        PROJTestUtils.assertEqualDouble(withValue: 1.0, andValue2: transformed.longitude, andDelta: 0.0000000000001)
        PROJTestUtils.assertEqualDouble(withValue: 1.0, andValue2: transformed.latitude, andDelta: 0.0000000000001)
        
    }
    
    /**
     * Test transform
     *
     * @param coordinate
     *            projection coordinate
     * @return projection coordinate
     */
    func testTransform(_ coordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D{
        
        // CLLocationCoordinate2D coordinate = ...
        
        let projection1 : PROJProjection = PROJProjectionFactory.projection(withAuthority: PROJ_AUTHORITY_EPSG, andIntCode: PROJ_EPSG_WEB_MERCATOR)
        let projection2 : PROJProjection = PROJProjectionFactory.projection(withName: "EPSG:4326")
        let projection3 : PROJProjection = PROJProjectionFactory.projection(withAuthority: PROJ_AUTHORITY_EPSG, andIntCode: 3123,
            andParams: "+proj=tmerc +lat_0=0 +lon_0=121 +k=0.99995 +x_0=500000 +y_0=0 +ellps=clrk66 "
                + "+towgs84=-127.62,-67.24,-47.04,-3.068,4.903,1.578,-1.06 +units=m +no_defs")
        let projection4 : PROJProjection = PROJProjectionFactory.projection(byDefinition: "PROJCS[\"Lambert_Conformal_Conic (1SP)\","
            + "GEODCRS[\"GCS_North_American_1983\","
            + "DATUM[\"North_American_Datum_1983\","
            + "SPHEROID[\"GRS_1980\",6371000,0]],"
            + "PRIMEM[\"Greenwich\",0],"
            + "UNIT[\"Degree\",0.017453292519943295]],"
            + "PROJECTION[\"Lambert_Conformal_Conic_1SP\"],"
            + "PARAMETER[\"latitude_of_origin\",25],"
            + "PARAMETER[\"central_meridian\",-95],"
            + "PARAMETER[\"scale_factor\",1],"
            + "PARAMETER[\"false_easting\",0],"
            + "PARAMETER[\"false_northing\",0],"
            + "PARAMETER[\"standard_parallel_1\",25],"
            + "UNIT[\"Meter\",1],AUTHORITY[\"EPSG\",\"9801\"]]")

        let transform : PROJProjectionTransform = projection1.transformation(with: projection2)
        let inverseTransform : PROJProjectionTransform = transform.inverseTransformation()
        
        let transformed : CLLocationCoordinate2D = transform.transform(coordinate)
        let inverseTransformed : CLLocationCoordinate2D = inverseTransform.transform(transformed)

        return transformed;
    }
    
}
