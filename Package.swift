// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "SwiftAtomicsTest",
    dependencies: [
        .package(url: "https://github.com/apple/swift-atomics.git", exact: "1.1.0")
    ],
    targets: [
        .executableTarget(
            name: "SwiftAtomicsTest",
            dependencies: [
                .product(name: "Atomics", package: "swift-atomics"),
            ],
            exclude: ["BUILD.bazel"]
        )
    ]
)