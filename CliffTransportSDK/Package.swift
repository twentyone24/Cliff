// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CliffTransportSDK",
    platforms: [
        .iOS("13.0"),
        .macOS("10.15.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CliffTransportSDK",
            targets: ["CliffTransportSDK"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-crypto.git", from: "1.1.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CliffTransportSDK",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Crypto", package: "swift-crypto")
            ]
        ),
        .testTarget(
            name: "CliffTransportSDKTests",
            dependencies: [
                .target(name: "CliffTransportSDK")
            ]
        )
    ]
)
