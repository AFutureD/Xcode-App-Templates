// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Common",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Common",
            targets: ["Common"]),
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "BaseKit", path: "../BaseKit"),
        .package(name: "Third", path: "../Third")
    ],
    targets: [
        .target(
            name: "Common",
            dependencies: [.third, "Domain", "BaseKit"]
        ),
        .testTarget(
            name: "CommonTests",
            dependencies: ["Common"]),
    ]
)

extension Target.Dependency {
    static let third = Self.product(name: "Third", package: "Third")
}
