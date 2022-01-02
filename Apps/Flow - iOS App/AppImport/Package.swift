// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "AppImport",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "AppImport", targets: ["AppImport"]),
    ],
    dependencies: [
        .package(name: "SPAlert", url: "https://github.com/ivanvorobei/SPAlert", .upToNextMajor(from: "3.4.1")),
        .package(name: "SPIndicator", url: "https://github.com/ivanvorobei/SPIndicator", .upToNextMajor(from: "1.6.0")),
        .package(name: "Alamofire", url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.4.4")),
        .package(name: "SwiftyJSON", url: "https://github.com/SwiftyJSON/SwiftyJSON", .upToNextMajor(from: "5.0.1")),
        .package(name: "Nuke", url: "https://github.com/kean/Nuke", .upToNextMajor(from: "10.5.2")),
        .package(name: "Models", path: "Models"),
        .package(name: "SPDiffable", path: "SPDiffable"),
        .package(name: "NativeUIKit", path: "NativeUIKit"),
        .package(name: "SparrowKit", path: "SparrowKit"),
        .package(name: "Constants", path: "Constants")
    ],
    targets: [
        .target(
            name: "AppImport",
            dependencies: [
                .product(name: "SparrowKit", package: "SparrowKit"),
                .product(name: "NativeUIKit", package: "NativeUIKit"),
                .product(name: "SPAlert", package: "SPAlert"),
                .product(name: "SPIndicator", package: "SPIndicator"),
                .product(name: "SPDiffable", package: "SPDiffable"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SwiftyJSON", package: "SwiftyJSON"),
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "Models", package: "Models"),
                .product(name: "Constants", package: "Constants")
            ]
        )
    ]
)
