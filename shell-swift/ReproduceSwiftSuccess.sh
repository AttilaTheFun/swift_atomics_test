#!/bin/sh

# Exit when any command fails:
set -e

# Compiling Swift Module Atomics

echo "Compiling Swift Module Atomics"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swiftc \
-module-name \
Atomics \
-incremental \
-emit-dependencies \
-emit-module \
-emit-module-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.swiftmodule \
-output-file-map \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/output-file-map.json \
-parse-as-library \
-whole-module-optimization \
-num-threads \
2 \
-c \
/home/ubuntu/swift_atomics_test/Sources/Atomics/AtomicBool.swift \
/home/ubuntu/swift_atomics_test/Sources/Atomics/AtomicValue.swift \
/home/ubuntu/swift_atomics_test/Sources/Atomics/ManagedAtomic.swift \
-I \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release \
-target \
aarch64-unknown-linux-gnu \
-swift-version \
5 \
-O \
-g \
-j2 \
-DSWIFT_PACKAGE \
-module-cache-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/ModuleCache \
-parseable-output \
-parse-as-library \
-v

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-frontend \
-frontend \
-c \
/home/ubuntu/swift_atomics_test/Sources/Atomics/AtomicBool.swift \
/home/ubuntu/swift_atomics_test/Sources/Atomics/AtomicValue.swift \
/home/ubuntu/swift_atomics_test/Sources/Atomics/ManagedAtomic.swift \
-supplementary-output-file-map \
/tmp/TemporaryDirectory.NXPY08/supplementaryOutputs-1 \
-target \
aarch64-unknown-linux-gnu \
-Xllvm \
-aarch64-use-tbi \
-disable-objc-interop \
-I \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release \
-g \
-module-cache-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/ModuleCache \
-swift-version \
5 \
-O \
-D \
SWIFT_PACKAGE \
-new-driver-path \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-driver \
-empty-abi-descriptor \
-resource-dir \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib/swift \
-module-name \
Atomics \
-enable-default-cmo \
-parse-as-library \
-num-threads \
2 \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/AtomicBool.swift.o \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/AtomicValue.swift.o \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/ManagedAtomic.swift.o

# Extracting autolink data for Atomics

echo "Extracting autolink data for Atomics"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-autolink-extract \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/AtomicBool.swift.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/AtomicValue.swift.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/ManagedAtomic.swift.o \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/Atomics.autolink

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swiftc \
-module-name \
SwiftAtomicsTest \
-incremental \
-emit-dependencies \
-emit-module \
-emit-module-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.swiftmodule \
-output-file-map \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.build/output-file-map.json \
-whole-module-optimization \
-num-threads \
2 \
-c \
/home/ubuntu/swift_atomics_test/Sources/SwiftAtomicsTest/SwiftAtomicsTestMain.swift \
-I \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release \
-target \
aarch64-unknown-linux-gnu \
-swift-version \
5 \
-O \
-g \
-j2 \
-DSWIFT_PACKAGE \
-module-cache-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/ModuleCache \
-parseable-output \
-Xfrontend \
-entry-point-function-name \
-Xfrontend \
SwiftAtomicsTest_main \
-parse-as-library \
-v

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-frontend \
-frontend \
-c \
/home/ubuntu/swift_atomics_test/Sources/SwiftAtomicsTest/SwiftAtomicsTestMain.swift \
-emit-module-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.swiftmodule \
-emit-module-doc-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.swiftdoc \
-emit-module-source-info-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.swiftsourceinfo \
-emit-dependencies-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.build/SwiftAtomicsTest.d \
-target \
aarch64-unknown-linux-gnu \
-Xllvm \
-aarch64-use-tbi \
-disable-objc-interop \
-I \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release \
-g \
-module-cache-path \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/ModuleCache \
-swift-version \
5 \
-O \
-D \
SWIFT_PACKAGE \
-new-driver-path \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-driver \
-entry-point-function-name \
SwiftAtomicsTest_main \
-empty-abi-descriptor \
-resource-dir \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib/swift \
-module-name \
SwiftAtomicsTest \
-enable-default-cmo \
-parse-as-library \
-num-threads \
2 \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.build/SwiftAtomicsTestMain.swift.o

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-autolink-extract \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.build/SwiftAtomicsTestMain.swift.o \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.build/SwiftAtomicsTest.autolink

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swiftc \
-g \
-L \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest \
-module-name \
SwiftAtomicsTest \
-emit-executable \
-Xlinker \
--gc-sections \
-Xlinker \
--defsym \
-Xlinker \
main=SwiftAtomicsTest_main \
-Xlinker \
'-rpath=$ORIGIN' \
@/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.product/Objects.LinkFileList \
-target \
aarch64-unknown-linux-gnu \
-v \
-L \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-autolink-extract \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/AtomicBool.swift.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/AtomicValue.swift.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/ManagedAtomic.swift.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.build/SwiftAtomicsTestMain.swift.o \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/SwiftAtomicsTest.autolink

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/clang \
-fuse-ld=gold \
-pie \
-Xlinker \
-rpath \
-Xlinker \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib/swift/linux \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib/swift/linux/aarch64/swiftrt.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/AtomicBool.swift.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/AtomicValue.swift.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/ManagedAtomic.swift.o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest.build/SwiftAtomicsTestMain.swift.o \
@/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/Atomics.build/SwiftAtomicsTest.autolink \
-L \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib/swift/linux \
-lswiftCore \
--target=aarch64-unknown-linux-gnu \
-v \
-L \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release \
-L \
/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/lib \
-Xlinker \
--gc-sections \
-Xlinker \
--defsym \
-Xlinker \
main=SwiftAtomicsTest_main \
-Xlinker \
'-rpath=$ORIGIN' \
-o \
/home/ubuntu/swift_atomics_test/.build/aarch64-unknown-linux-gnu/release/SwiftAtomicsTest

