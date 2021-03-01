# Simple Features Projection iOS

#### Simple Features Projection Lib ####

The Simple Features Libraries were developed at the [National Geospatial-Intelligence Agency (NGA)](http://www.nga.mil/) in collaboration with [BIT Systems](https://www.caci.com/bit-systems/). The government has "unlimited rights" and is releasing this software to increase the impact of government investments by providing developers with the opportunity to take things in new directions. The software use, modification, and distribution rights are stipulated within the [MIT license](http://choosealicense.com/licenses/mit/).

### Pull Requests ###
If you'd like to contribute to this project, please make a pull request. We'll review the pull request and discuss the changes. All pull request contributions to this project will be released under the MIT license.

Software source code previously released under an open source license and then modified by NGA staff is considered a "joint work" (see 17 USC § 101); it is partially copyrighted, partially public domain, and as a whole is protected by the copyrights of the non-government authors and must be released according to the terms of the original open source license.

### About ###

[Simple Features Projection](http://ngageoint.github.io/simple-features-proj-ios/) is an iOS library for performing projection conversions between [Simple Feature](https://github.com/ngageoint/simple-features-ios) Geometries.

### Usage ###

View the latest [Appledoc](http://ngageoint.github.io/simple-features-proj-ios/docs/api/)

#### Transform ####

```objectivec

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

```

### Build ###

[![Build & Test](https://github.com/ngageoint/simple-features-proj-ios/workflows/Build%20&%20Test/badge.svg)](https://github.com/ngageoint/simple-features-proj-ios/actions?query=workflow%3A%22Build+%26+Test%22)

Build this repository using Xcode and/or CocoaPods:

    pod repo update
    pod install

Open sf-proj-ios.xcworkspace in Xcode or build from command line:

    xcodebuild -workspace 'sf-proj-ios.xcworkspace' -scheme sf-proj-ios build

Run tests from Xcode or from command line:

    xcodebuild test -workspace 'sf-proj-ios.xcworkspace' -scheme sf-proj-ios -destination 'platform=iOS Simulator,name=iPhone 8'

### Include Library ###

Include this repository by specifying it in a Podfile using a supported option.

Pull from [CocoaPods](https://cocoapods.org/pods/sf-proj-ios):

    pod 'sf-proj-ios', '~> 4.0.0'

Pull from GitHub:

    pod 'sf-proj-ios', :git => 'https://github.com/ngageoint/simple-features-proj-ios.git', :branch => 'master'
    pod 'sf-proj-ios', :git => 'https://github.com/ngageoint/simple-features-proj-ios.git', :tag => '4.0.0'

Include as local project:

    pod 'sf-proj-ios', :path => '../simple-features-proj-ios'

### Swift ###

To use from Swift, import the sf-proj-ios bridging header from the Swift project's bridging header

    #import "sf-proj-ios-Bridging-Header.h"

#### Transform ####

```swift

// var geometry: SFGeometry = ...

let projection1: SFPProjection = SFPProjectionFactory.projection(withAuthority: PROJ_AUTHORITY_EPSG, andIntCode: PROJ_EPSG_WEB_MERCATOR)
let projection2: SFPProjection = SFPProjectionFactory.projection(withAuthority: PROJ_AUTHORITY_EPSG, andIntCode: PROJ_EPSG_WORLD_GEODETIC_SYSTEM)

let transform: SFPProjectionTransform = SFPProjectionTransform(from: projection1, andTo: projection2)

let transformed: SFGeometry = transform.transform(with: geometry)

```

### Remote Dependencies ###

* [Simple Features](https://github.com/ngageoint/simple-features-ios) (The MIT License (MIT)) - Simple Features Lib
* [proj4](https://trac.osgeo.org/proj/) (The MIT License (MIT)) - Cartographic projection software
