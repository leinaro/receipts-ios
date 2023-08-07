// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Modules",
            targets: [
                "Modules",
                "Home",
                "AppCore",
                "RecipeDetail",
                "Network",
                "Domain",
                "Map"
            ]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            exact: Version(1,0,0)
        ),
        .package(
            url: "https://github.com/Moya/Moya.git",
            exact: Version(15, 0, 3)
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
            exact: Version(1, 11, 0)
        )

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Map",
            dependencies: [
                "AppCore"
            ]
        ),
        .target(
            name: "Modules",
            dependencies: []
        ),
        .target(
            name: "Domain",
            dependencies: [
                "Network"
            ]
        ),
        .target(
            name: "Network",
            dependencies: [
                .product(name: "ReactiveMoya", package: "Moya"),
                "AppCore"
            ]
        ),
        .target(
            name: "AppCore",
            dependencies: []
        ),
        .target(
            name: "RecipeDetail",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "AppCore",
                "Map"
            ]
        ),
        .target(
            name: "Home",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                //.product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                "AppCore",
                "Domain"
            ]
        ),
        .target(
            name: "Utils-Tests",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        ),
        .testTarget(
            name: "ModulesTests",
            dependencies: [
                "Modules",
                "Home",
                "RecipeDetail",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                "Utils-Tests",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ]
        )
    ]
)
