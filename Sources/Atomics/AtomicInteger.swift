//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Atomics open source project
//
// Copyright (c) 2020 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

// #if ATOMICS_NATIVE_BUILTINS
// import Swift
// #endif

// public protocol AtomicInteger: AtomicValue, FixedWidthInteger
// where
//   AtomicRepresentation: AtomicIntegerStorage,
//   AtomicRepresentation.Value == Self
// {}

// public protocol AtomicIntegerStorage: AtomicStorage {

//   @_semantics("atomics.requires_constant_orderings")
//   static func atomicLoadThenWrappingDecrement(
//     by operand: Value,
//     at pointer: UnsafeMutablePointer<Self>,
//     ordering: AtomicUpdateOrdering
//   ) -> Value

//   @_semantics("atomics.requires_constant_orderings")
//   static func atomicLoadThenBitwiseAnd(
//     with operand: Value,
//     at pointer: UnsafeMutablePointer<Self>,
//     ordering: AtomicUpdateOrdering
//   ) -> Value

//   @_semantics("atomics.requires_constant_orderings")
//   static func atomicLoadThenBitwiseOr(
//     with operand: Value,
//     at pointer: UnsafeMutablePointer<Self>,
//     ordering: AtomicUpdateOrdering
//   ) -> Value

//   @_semantics("atomics.requires_constant_orderings")
//   static func atomicLoadThenBitwiseXor(
//     with operand: Value,
//     at pointer: UnsafeMutablePointer<Self>,
//     ordering: AtomicUpdateOrdering
//   ) -> Value
// }
