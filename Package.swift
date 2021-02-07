// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TagsView",
    products: [
        .library(
            name: "TagsView",
            targets: ["TagsView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TagsView",
            dependencies: []),
        .testTarget(
            name: "TagsViewTests",
            dependencies: ["TagsView"]),
    ]
)
