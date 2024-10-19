// swift-tools-version:  6.0
@preconcurrency import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: [:]
    )
#endif

let package = Package(
    name: "Template",
    dependencies: [
        .package(path: "../Packages/iOS"),
        .package(path: "../Packages/macOS")
    ]
)
