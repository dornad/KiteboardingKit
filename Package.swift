// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "KiteboardingKit",
    products: [
        .library(
            name: "KiteboardingKit",
            targets: ["KiteboardingKit"]),
    ],
    targets: [
        .target(
            name: "KiteboardingKit"),
        .testTarget(
            name: "KiteboardingKitTests",
            dependencies: ["KiteboardingKit"]),
    ]
)
