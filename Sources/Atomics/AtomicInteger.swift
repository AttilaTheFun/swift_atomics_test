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

#if ATOMICS_NATIVE_BUILTINS
import Swift
#endif

public protocol AtomicInteger: AtomicValue, FixedWidthInteger
where
  AtomicRepresentation: AtomicIntegerStorage,
  AtomicRepresentation.Value == Self
{}

public protocol AtomicIntegerStorage: AtomicStorage {

  @_semantics("atomics.requires_constant_orderings")
  static func atomicLoadThenWrappingDecrement(
    by operand: Value,
    at pointer: UnsafeMutablePointer<Self>,
    ordering: AtomicUpdateOrdering
  ) -> Value

  /// Perform an atomic bitwise AND operation on the value referenced by
  /// `pointer` and return the original value, applying the specified memory
  /// ordering.
  ///
  /// - Parameter operand: An integer value.
  /// - Parameter pointer: A memory location previously initialized with a value
  ///   returned by `prepareAtomicRepresentation(for:)`.
  /// - Parameter ordering: The memory ordering to apply on this operation.
  /// - Returns: The original value before the operation.
  @_semantics("atomics.requires_constant_orderings")
  static func atomicLoadThenBitwiseAnd(
    with operand: Value,
    at pointer: UnsafeMutablePointer<Self>,
    ordering: AtomicUpdateOrdering
  ) -> Value

  /// Perform an atomic bitwise OR operation on the value referenced by
  /// `pointer` and return the original value, applying the specified memory
  /// ordering.
  ///
  /// - Parameter operand: An integer value.
  /// - Parameter pointer: A memory location previously initialized with a value
  ///   returned by `prepareAtomicRepresentation(for:)`.
  /// - Parameter ordering: The memory ordering to apply on this operation.
  /// - Returns: The original value before the operation.
  @_semantics("atomics.requires_constant_orderings")
  static func atomicLoadThenBitwiseOr(
    with operand: Value,
    at pointer: UnsafeMutablePointer<Self>,
    ordering: AtomicUpdateOrdering
  ) -> Value

  /// Perform an atomic bitwise XOR operation on the value referenced by
  /// `pointer` and return the original value, applying the specified memory
  /// ordering.
  ///
  /// - Parameter operand: An integer value.
  /// - Parameter pointer: A memory location previously initialized with a value
  ///   returned by `prepareAtomicRepresentation(for:)`.
  /// - Parameter ordering: The memory ordering to apply on this operation.
  /// - Returns: The original value before the operation.
  @_semantics("atomics.requires_constant_orderings")
  static func atomicLoadThenBitwiseXor(
    with operand: Value,
    at pointer: UnsafeMutablePointer<Self>,
    ordering: AtomicUpdateOrdering
  ) -> Value
}
