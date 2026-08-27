// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-property-carrier",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Property Carrier",
            targets: ["Property Carrier"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-property.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-carrier.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Property Carrier",
            dependencies: [
                .product(name: "Property", package: "swift-property"),
                .product(name: "Carrier", package: "swift-carrier"),
            ]
        ),
        .testTarget(
            name: "Property Carrier Tests",
            dependencies: [
                "Property Carrier",
                .product(name: "Property", package: "swift-property"),
                .product(name: "Carrier", package: "swift-carrier"),
            ],
            path: "Tests/Property Carrier Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
