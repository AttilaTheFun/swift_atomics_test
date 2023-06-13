#!/bin/sh

# Compiling Swift module //Sources/Atomics:Atomics

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swiftc \
-emit-object \
-output-file-map \
bazel-out/aarch64-dbg/bin/Sources/Atomics/Atomics.output_file_map.json \
-Xfrontend \
-no-clang-module-breadcrumbs \
-emit-module-path \
bazel-out/aarch64-dbg/bin/Sources/Atomics/Atomics.swiftmodule \
-enable-bare-slash-regex \
-DDEBUG \
-Onone \
-Xfrontend \
-no-serialize-debugging-options \
-enable-testing \
-g \
'-Xwrapped-swift=-debug-prefix-pwd-is-dot' \
'-Xwrapped-swift=-file-prefix-pwd-is-dot' \
-module-cache-path \
bazel-out/aarch64-dbg/bin/_swift_module_cache \
-Xcc \
-iquote. \
-Xcc \
-iquotebazel-out/aarch64-dbg/bin \
-Xfrontend \
-color-diagnostics \
-enable-batch-mode \
-module-name \
Atomics \
-DSWIFT_PACKAGE \
-parse-as-library \
-static \
Sources/Atomics/AtomicBool.swift \
Sources/Atomics/AtomicValue.swift \
Sources/Atomics/ManagedAtomic.swift

# Extracting autolink data for Swift module //Sources/Atomics:Atomics

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-autolink-extract \
bazel-out/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o \
bazel-out/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o \
bazel-out/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o \
-o \
bazel-out/aarch64-dbg/bin/Sources/Atomics/Atomics.autolink

# Wrapping Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest for debugging

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift \
-modulewrap \
bazel-out/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.swiftmodule \
-o \
bazel-out/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.modulewrap.o

# Linking Sources/SwiftAtomicsTest/SwiftAtomicsTest

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/clang-13 \
@bazel-out/aarch64-dbg/bin/Sources/Atomics/Atomics.autolink \
@bazel-out/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.autolink \
@bazel-out/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest-2.params