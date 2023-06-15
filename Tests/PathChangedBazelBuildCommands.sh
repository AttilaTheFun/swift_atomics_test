#!/bin/sh

# Creating Directories

echo "Creating Directories"

mkdir -p bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs
mkdir -p bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest

# Creating Files

echo "Creating Files"

touch bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.output_file_map.json
touch bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.ast
touch bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o
touch bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.ast
touch bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o
touch bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.ast
touch bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o
touch bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.swiftmodule

# Creating Output File Maps

echo "Creating Output File Map"

ATOMICS_OUTPUT_FILE_MAP=$(cat << END
{"Sources/Atomics/AtomicBool.swift":{"ast-dump":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.ast","object":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o"},"Sources/Atomics/AtomicValue.swift":{"ast-dump":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.ast","object":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o"},"Sources/Atomics/ManagedAtomic.swift":{"ast-dump":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.ast","object":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o"}}
END
)

echo $ATOMICS_OUTPUT_FILE_MAP > bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.output_file_map.json

TEST_OUTPUT_FILE_MAP=$(cat << END
{"Sources/SwiftAtomicsTest/SwiftAtomicsTestMain.swift":{"ast-dump":"bazel-out/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest_objs/SwiftAtomicsTestMain.swift.ast","object":"bazel-out/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest_objs/SwiftAtomicsTestMain.swift.o"}
END
)

echo $TEST_OUTPUT_FILE_MAP > bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.output_file_map.jso

# Compiling Swift module //Sources/Atomics:Atomics

# '-Xwrapped-swift=-debug-prefix-pwd-is-dot' \
# '-Xwrapped-swift=-file-prefix-pwd-is-dot' \

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swiftc \
-emit-object \
-output-file-map \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.output_file_map.json \
-Xfrontend \
-no-clang-module-breadcrumbs \
-emit-module-path \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.swiftmodule \
-enable-bare-slash-regex \
-DDEBUG \
-Onone \
-Xfrontend \
-no-serialize-debugging-options \
-enable-testing \
-gline-tables-only \
-module-cache-path \
bazel-out-test/aarch64-dbg/bin/_swift_module_cache \
-Xcc \
-iquote. \
-Xcc \
-iquotebazel-out-test/aarch64-dbg/bin \
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

echo "Extracting autolink data for Swift module //Sources/Atomics:Atomics"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-autolink-extract \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o \
-o \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.autolink

# Wrapping Swift module //Sources/Atomics:Atomics for debugging

echo "Wrapping Swift module //Sources/Atomics:Atomics for debugging"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift \
-modulewrap \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.swiftmodule \
-o \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.modulewrap.o

# Compiling Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest

echo "Compiling Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest"

# '-Xwrapped-swift=-debug-prefix-pwd-is-dot' \
# '-Xwrapped-swift=-file-prefix-pwd-is-dot' \

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swiftc \
-emit-object \
-output-file-map \
bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.output_file_map.json \
-Xfrontend \
-no-clang-module-breadcrumbs \
-emit-module-path \
bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.swiftmodule \
-enable-bare-slash-regex \
-DDEBUG \
-Onone \
-Xfrontend \
-no-serialize-debugging-options \
-enable-testing \
-gline-tables-only \
-module-cache-path \
bazel-out-test/aarch64-dbg/bin/_swift_module_cache \
-Ibazel-out-test/aarch64-dbg/bin/Sources/Atomics \
-Xcc \
-iquote. \
-Xcc \
-iquotebazel-out-test/aarch64-dbg/bin \
-Xcc \
-DSWIFT_PACKAGE \
-Xfrontend \
-color-diagnostics \
-enable-batch-mode \
-module-name \
SwiftAtomicsTest \
-DSWIFT_PACKAGE \
-parse-as-library \
Sources/SwiftAtomicsTest/SwiftAtomicsTestMain.swift

# Extracting autolink data for Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest

echo "Extracting autolink data for Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-autolink-extract \
bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest_objs/SwiftAtomicsTestMain.swift.o \
-o \
bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.autolink

# Wrapping Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest for debugging

echo "Wrapping Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest for debugging"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift \
-modulewrap \
bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.swiftmodule \
-o \
bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.modulewrap.o

# Linking Sources/SwiftAtomicsTest/SwiftAtomicsTest

echo "Linking Sources/SwiftAtomicsTest/SwiftAtomicsTest"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/clang-13 \
@bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.autolink \
@bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.autolink \
@bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest-2.params