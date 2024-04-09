// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureModules",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Search",
            targets: ["Search"])
    ],
    dependencies: [
        .package(path: "../SharedModules")
    ],
    targets: [
        .target(
            name: "Search",
            dependencies: [
                .product(name: "UseCase", package: "SharedModules"),
                .product(name: "Repository", package: "SharedModules"),
                .product(name: "Component", package: "SharedModules")
            ]
        )
    ]
)
