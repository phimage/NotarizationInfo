// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NotarizationInfo",
    products: [
        .library(
            name: "NotarizationInfo",
            targets: ["NotarizationInfo"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NotarizationInfo",
            dependencies: []),
        .testTarget(
            name: "NotarizationInfoTests",
            dependencies: ["NotarizationInfo"])
    ]
)
