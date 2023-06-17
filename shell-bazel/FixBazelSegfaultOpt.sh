#!/bin/sh

# Exit when any command fails:
set -e

# Creating Directories

echo "Creating Directories"

mkdir -p bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs
mkdir -p bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest_objs

# Creating Files

echo "Creating Files"

touch bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics.output_file_map.json
touch bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.ast
touch bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o
touch bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.ast
touch bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o
touch bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.ast
touch bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o
touch bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.output_file_map.json
touch bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest_objs/SwiftAtomicsTestMain.swift.ast
touch bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest_objs/SwiftAtomicsTestMain.swift.o
touch bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.autolink
touch bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.swiftmodule

# Copying Output File Maps

echo "Creating Output File Maps"

cp shell-bazel/Atomics.output_file_map.json bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics.output_file_map.json

cp shell-bazel/SwiftAtomicsTest.output_file_map.json bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.output_file_map.json

# Compiling Swift module //Sources/Atomics:Atomics

echo "Compiling Swift module //Sources/Atomics:Atomics"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swiftc \
-emit-object \
-output-file-map \
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics.output_file_map.json \
-Xfrontend \
-no-clang-module-breadcrumbs \
-emit-module-path \
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics.swiftmodule \
-enable-bare-slash-regex \
-DNDEBUG \
-O \
-whole-module-optimization \
-Xfrontend \
-no-serialize-debugging-options \
-module-cache-path \
bazel-out-test/aarch64-opt/bin/_swift_module_cache \
-Xcc \
-iquote. \
-Xcc \
-iquotebazel-out-test/aarch64-opt/bin \
-Xfrontend \
-color-diagnostics \
-num-threads \
12 \
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
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o \
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o \
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o \
-o \
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics.autolink

# Compiling Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest

echo "Compiling Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swiftc \
-emit-object \
-output-file-map \
bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.output_file_map.json \
-Xfrontend \
-no-clang-module-breadcrumbs \
-emit-module-path \
bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.swiftmodule \
-enable-bare-slash-regex \
-DNDEBUG \
-O \
-whole-module-optimization \
-Xfrontend \
-no-serialize-debugging-options \
-module-cache-path \
bazel-out-test/aarch64-opt/bin/_swift_module_cache \
-Ibazel-out-test/aarch64-opt/bin/Sources/Atomics \
-Xcc \
-iquote. \
-Xcc \
-iquotebazel-out-test/aarch64-opt/bin \
-Xcc \
-DSWIFT_PACKAGE \
-Xfrontend \
-color-diagnostics \
-num-threads \
12 \
-module-name \
SwiftAtomicsTest \
-DSWIFT_PACKAGE \
-parse-as-library \
Sources/SwiftAtomicsTest/SwiftAtomicsTestMain.swift

# Extracting autolink data for Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest

echo "Extracting autolink data for Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-autolink-extract \
bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest_objs/SwiftAtomicsTestMain.swift.o \
-o \
bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.autolink

# Linking Sources/SwiftAtomicsTest/SwiftAtomicsTest

echo "Linking Sources/SwiftAtomicsTest/SwiftAtomicsTest"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/clang-13 \
@bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics.autolink \
@bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.autolink \
-o \
bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest \
-fuse-ld=/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/ld.lld \
-Wl,-no-as-needed \
-Wl,-z,relro,-z,now \
-B/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin \
-Wl,--gc-sections \
-Wl,-whole-archive \
bazel-out-test/aarch64-opt/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest_objs/SwiftAtomicsTestMain.swift.o \
-Wl,-no-whole-archive \
-Wl,--start-lib \
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o \
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o \
bazel-out-test/aarch64-opt/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o \
-Wl,--end-lib \
-Wl,-z,nostart-stop-gc \
-Wl,-z,nostart-stop-gc \
-pie \
-L/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib/swift/linux \
-Wl,-rpath,/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib/swift/linux \
-lm \
# -lstdc++ \
# -lrt \
-ldl \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib/swift/linux/aarch64/swiftrt.o \
-static-libgcc \
# -lstdc++ \
-lm