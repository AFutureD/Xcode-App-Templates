// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Third",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Third",
            targets: ["Third"]
        ),
        .library(
            name: "ThirdUI",
            targets: ["ThirdUI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.5.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Third",
            dependencies: [
                .TCA
            ]
        ),
        .target(
            name: "ThirdUI"
        ),
        .testTarget(
            name: "ThirdTests",
            dependencies: ["Third"]
        ),
    ]
)

extension Target.Dependency {
    static let TCA = Self.product(name: "ComposableArchitecture", package: "swift-composable-architecture")
}
