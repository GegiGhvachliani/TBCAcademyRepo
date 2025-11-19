// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Countries",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Countries",
            targets: ["Countries"]),
    ],
    dependencies: [
        .package(path: "../Networking"),
        .package(path: "../CommonUIComponents"),
        .package(url: "https://github.com/roberthein/TinyConstraints.git", from: "4.0.2"),
    ],
    targets: [
        .target(
            name: "Countries",
            dependencies: [
                "Networking",
                "CommonUIComponents",
                .product(name: "TinyConstraints", package: "TinyConstraints")
            ]
            
        ),
        
    ]
)
