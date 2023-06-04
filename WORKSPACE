workspace(name = "swift_atomics_test")

# MARK: - Rules Swift

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "b98bd1ec03c713e2ff5c3aa8c05930d8b6ab85cc82b3ae5d869058da4731f230",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.8.0/rules_swift.1.8.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

# MARK: - Swift Atomics

http_archive(
    name = "com_github_apple_swift_atomics",
    url = "https://github.com/apple/swift-collections/archive/1.0.4.tar.gz",
    sha256 = "1bee7f469f7e8dc49f11cfa4da07182fbc79eab000ec2c17bfdce468c5d276fb",
    strip_prefix = "swift-atomics-1.1.0/",
    build_file = "@swift_atomics_test//Sources:SwiftAtomics/BUILD.overlay",
)