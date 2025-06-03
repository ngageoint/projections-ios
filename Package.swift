// swift-tools-version: 5.10
import PackageDescription

/// Cocoapods to SPM Conversion Notes
/// * Using name: `proj-ios` causes issues with resource loading in Objective-C with [SWIFTPM_MODULE_BUNDLE pathForResource:resource ofType:type]; (The `-` become `_`)
/// * Moved `proj.db` into this package since it gets loaded here for actual usage, not in PROJ (Access to resources is limited in SPM vs cocoapods)
/// * Reorganized headers into include folder and resources into Resources
/// * Updated to use Module header imports with angled brackets for Objective-C framework imports
///

let package = Package(
    name: "Projections",
    platforms: [
        .iOS(.v13), .macOS(.v12)
    ],
    products: [
        .library(
            name: "Projections",
            type: .static,
            targets: ["Projections"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/ngageoint/PROJ.git", from: "9.4.2"),
        .package(url: "https://github.com/ngageoint/coordinate-reference-systems-ios.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "Projections",
            dependencies: [
                .product(name: "proj", package: "PROJ"),
                .product(name: "CoordinateReferenceSystems", package: "coordinate-reference-systems-ios"),
            ],
            path: "proj-ios",
            resources: [
                .copy("Resources/proj.db"),
                .copy("Resources/projections.ogc.plist"),
                .copy("Resources/projections.none.plist"),
                .copy("Resources/projections.epsg.plist")
            ]
        ),
        .testTarget(
            name: "proj-iosTests",
            dependencies: [
                "Projections",
            ],
            path: "proj-iosTests",
            exclude: [
                "Info.plist",
            ]
        ),
        .testTarget(
            name: "proj-iosTests-swift",
            dependencies: [
                "Projections",
            ],
            path: "proj-iosTests-swift"
        ),
    ]
)


