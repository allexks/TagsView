// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TagsView",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "TagsView",
            targets: ["TagsView"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TagsView",
            dependencies: []
        ),
        .testTarget(
            name: "TagsViewTests",
            dependencies: ["TagsView"]
        ),
    ]
)
