#!/bin/sh

echo "Creating Directories"

mkdir -p bazel-out-test/aarch64-dbg/bin/Sources/Atomics

echo "Creating Files"

OUTPUT_FILE_MAP=$(cat << END
{
"Sources/Atomics/AtomicBool.swift":{
"ast-dump":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.ast",
"object":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o"
},
"Sources/Atomics/AtomicValue.swift":{
"ast-dump":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.ast",
"object":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o"
},
"Sources/Atomics/ManagedAtomic.swift":{
"ast-dump":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.ast",
"object":"bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o"
}
}
END
)

touch bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.output_file_map.json
echo -e $OUTPUT_FILE_MAP > bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.output_file_map.json

echo "Compiling Swift module //Sources/Atomics:Atomics"

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
-g \
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

echo "Extracting autolink data for Swift module //Sources/Atomics:Atomics"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift-autolink-extract \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicBool.swift.o \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/AtomicValue.swift.o \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics_objs/ManagedAtomic.swift.o \
-o \
bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.autolink

echo "Wrapping Swift module //Sources/SwiftAtomicsTest:SwiftAtomicsTest for debugging"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/swift \
-modulewrap \
bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.swiftmodule \
-o \
bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.modulewrap.o

echo "Linking Sources/SwiftAtomicsTest/SwiftAtomicsTest"

/home/ubuntu/swift-5.8-RELEASE-ubuntu20.04-aarch64/usr/bin/clang-13 \
@bazel-out-test/aarch64-dbg/bin/Sources/Atomics/Atomics.autolink \
@bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest.autolink \
@bazel-out-test/aarch64-dbg/bin/Sources/SwiftAtomicsTest/SwiftAtomicsTest-2.params