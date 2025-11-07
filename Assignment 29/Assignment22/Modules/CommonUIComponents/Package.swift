// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CommonUIComponents",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "CommonUIComponents",
            targets: ["CommonUIComponents"]),
    ],
    dependencies: [
        .package(url: "https://github.com/roberthein/TinyConstraints.git", from: "4.0.2")
    ],
    targets: [
        .target(
            name: "CommonUIComponents",
            dependencies: [
                .product(name: "TinyConstraints", package: "TinyConstraints")
            ]),
    ]
)
