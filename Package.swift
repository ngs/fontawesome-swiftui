// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FontAwesome",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15),
        .tvOS(.v14),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "FontAwesome",
            targets: ["FontAwesome"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FontAwesome",
            dependencies: []),
        .testTarget(
            name: "FontAwesomeTests",
            dependencies: ["FontAwesome"])
    ]
)
