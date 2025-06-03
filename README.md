# Projections iOS

#### Projections Lib ####

The Projections Library was developed at the [National Geospatial-Intelligence Agency (NGA)](http://www.nga.mil/) in collaboration with [BIT Systems](https://www.caci.com/bit-systems/). The government has "unlimited rights" and is releasing this software to increase the impact of government investments by providing developers with the opportunity to take things in new directions. The software use, modification, and distribution rights are stipulated within the [MIT license](http://choosealicense.com/licenses/mit/).

### Pull Requests ###
If you'd like to contribute to this project, please make a pull request. We'll review the pull request and discuss the changes. All pull request contributions to this project will be released under the MIT license.

Software source code previously released under an open source license and then modified by NGA staff is considered a "joint work" (see 17 USC § 101); it is partially copyrighted, partially public domain, and as a whole is protected by the copyrights of the non-government authors and must be released according to the terms of the original open source license.

### About ###

[Projections](http://ngageoint.github.io/projections-ios/) is an iOS library for performing projection conversions between coordinates.

For conversions between geometries, see [Simple Features Projections](https://ngageoint.github.io/simple-features-proj-ios/).

### Usage ###

View the latest [Appledoc](http://ngageoint.github.io/projections-ios/docs/api/)

```objectivec

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

```

### Build ###

[![Build](https://github.com/ngageoint/projections-ios/actions/workflows/build.yml/badge.svg)](https://github.com/ngageoint/projections-ios/actions/workflows/build.yml)


Build this repository SPM:

    swift build

Run tests for SPM:
    
    swift test
    
Open Package in Xcode:

    open Package.swift

### Include Library ###

Use this library via SPM in your Package.swift:

    dependencies: [
        .package(url: "https://github.com/ngageoint/projections-ios.git", branch: "release/3.0.0"),
    ]
    
Or as a tagged release:

    dependencies: [
        .package(url: "https://github.com/ngageoint/projections-ios.git", from: "3.0.0"),
    ]

Reference it in your Package.swift target:

    .target(
        name: "projections",
        dependencies: [
            .product(name: "projections", package: "projections-ios"),
        ],
    ),

### Swift ###

To use from Swift, import the library:

    import projections

```swift

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

transform.destroy()
inverseTransform.destroy()

```

### Remote Dependencies ###

* [PROJ](https://proj.org/) (The MIT License (MIT)) - Cartographic projection software
* [Coordinate Reference Systems](https://github.com/ngageoint/coordinate-reference-systems-ios) (The MIT License (MIT)) - Coordinate Reference Systems Library
