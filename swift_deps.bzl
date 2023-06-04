load("@rules_swift_package_manager//swiftpkg:defs.bzl", "swift_package")

def swift_dependencies():
    # version: 1.1.0
    swift_package(
        name = "swiftpkg_swift_atomics",
        commit = "6c89474e62719ddcc1e9614989fff2f68208fe10",
        dependencies_index = "@//:swift_deps_index.json",
        remote = "https://github.com/apple/swift-atomics.git",
    )
