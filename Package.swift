// swift-tools-version: 5.8
// temp: swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "SwiftAtomicsTest",
    targets: [
        .target(
            name: "Atomics",
            exclude: [
                "BUILD.bazel",
            ]
        ),
        .executableTarget(
            name: "SwiftAtomicsTest",
            dependencies: [
                "Atomics"
            ],
            exclude: ["BUILD.bazel"]
        )
    ]
)