load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_swift_package_manager",
    sha256 = "54f358ac1ed2bcf65404bc26c9d1298486ea88bfc230f452531e7ac26bcfca8b",
    urls = [
        "https://github.com/cgrindel/rules_swift_package_manager/releases/download/v0.4.3/rules_swift_package_manager.v0.4.3.tar.gz",
    ],
)

load("@rules_swift_package_manager//:deps.bzl", "swift_bazel_dependencies")

swift_bazel_dependencies()

load("@cgrindel_bazel_starlib//:deps.bzl", "bazel_starlib_dependencies")

bazel_starlib_dependencies()

# MARK: - Gazelle

# gazelle:repo bazel_gazelle

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("@rules_swift_package_manager//:go_deps.bzl", "swift_bazel_go_dependencies")
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

# Declare Go dependencies before calling go_rules_dependencies.
swift_bazel_go_dependencies()

go_rules_dependencies()

go_register_toolchains(version = "1.19.1")

gazelle_dependencies()

# MARK: - Swift Toolchain

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "b98bd1ec03c713e2ff5c3aa8c05930d8b6ab85cc82b3ae5d869058da4731f230",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.8.0/rules_swift.1.8.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)
load("//:swift_deps.bzl", "swift_dependencies")

# gazelle:repository_macro swift_deps.bzl%swift_dependencies
swift_dependencies()

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()