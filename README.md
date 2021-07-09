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

// TODO

```

### Build ###

[![Build & Test](https://github.com/ngageoint/projections-ios/workflows/Build%20&%20Test/badge.svg)](https://github.com/ngageoint/projections-ios/actions/workflows/build-test.yml)

Build this repository using Xcode and/or CocoaPods:

    pod repo update
    pod install

Open proj-ios.xcworkspace in Xcode or build from command line:

    xcodebuild -workspace 'proj-ios.xcworkspace' -scheme proj-ios build

Run tests from Xcode or from command line:

    xcodebuild test -workspace 'proj-ios.xcworkspace' -scheme proj-ios -destination 'platform=iOS Simulator,name=iPhone 12'

### Include Library ###

Include this repository by specifying it in a Podfile using a supported option.

Pull from [CocoaPods](https://cocoapods.org/pods/proj-ios):

    pod 'proj-ios', '~> 1.0.0'

Pull from GitHub:

    pod 'proj-ios', :git => 'https://github.com/ngageoint/projections-ios.git', :branch => 'master'
    pod 'proj-ios', :git => 'https://github.com/ngageoint/projections-ios.git', :tag => '1.0.0'

Include as local project:

    pod 'proj-ios', :path => '../projections-ios'

### Swift ###

To use from Swift, import the proj-ios bridging header from the Swift project's bridging header

    #import "proj-ios-Bridging-Header.h"

#### Transform ####

```swift

// TODO

```

### Remote Dependencies ###

* [proj4](https://trac.osgeo.org/proj/) (The MIT License (MIT)) - Cartographic projection software
* [Coordinate Reference Systems](https://github.com/ngageoint/coordinate-reference-systems-ios) (The MIT License (MIT)) - Coordinate Reference Systems Library
