// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonUI",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "CommonUI",
            targets: ["CommonUI"]),
    ],
    dependencies: [
        .package(name: "Common", path: "../Common"),
        .package(name: "Third", path: "../Third")
    ],
    targets: [
        .target(
            name: "CommonUI",
            dependencies: [.third, "Common"]
        ),
        .testTarget(
            name: "CommonUITests",
            dependencies: ["CommonUI"]),
    ]
)

extension Target.Dependency {
    static let third = Self.product(name: "ThirdUI", package: "Third")
}
