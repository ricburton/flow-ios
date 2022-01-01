// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "Models",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Models", targets: ["Models"]
        ),
    ],
    dependencies: [
        .package(name: "SparrowKit", url: "https://github.com/ivanvorobei/SparrowKit", .upToNextMajor(from: "3.4.8")),
        .package(name: "Constants", path: "Constants")
    ],
    targets: [
        .target(
            name: "Models",
            dependencies: [
                .product(name: "SparrowKit", package: "SparrowKit"),
                .product(name: "Constants", package: "Constants")
            ]
        )
    ]
)
