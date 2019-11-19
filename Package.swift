// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RDAdjustableNavigationController",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "RDAdjustableNavigationController",
            targets: ["RDAdjustableNavigationController"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "RDAdjustableNavigationController",
            dependencies: []),
        .testTarget(
            name: "RDAdjustableNavigationControllerTests",
            dependencies: ["RDAdjustableNavigationController"]),
    ]
)
