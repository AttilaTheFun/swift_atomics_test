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

@frozen
public struct AtomicLoadOrdering {

  @usableFromInline
  internal var _rawValue: Int

  @_semantics("constant_evaluable")
  @inlinable @_transparent // Debug performance
  internal init(_rawValue: Int) {
    self._rawValue = _rawValue
  }
}

extension AtomicLoadOrdering {

  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var relaxed: Self {
    Self(_rawValue: 0)
  }

  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var acquiring: Self {
    Self(_rawValue: 2)
  }

  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var sequentiallyConsistent: Self {
    Self(_rawValue: 5)
  }
}

extension AtomicLoadOrdering: Equatable {
  @_transparent // Debug performance
  public static func ==(left: Self, right: Self) -> Bool {
    return left._rawValue == right._rawValue
  }
}

extension AtomicLoadOrdering: Hashable {
  @inlinable
  public func hash(into hasher: inout Hasher) {
    hasher.combine(_rawValue)
  }
}

extension AtomicLoadOrdering: CustomStringConvertible {
  public var description: String {
    switch self {
    case .relaxed: return "relaxed"
    case .acquiring: return "acquiring"
    case .sequentiallyConsistent: return "sequentiallyConsistent"
    default: return "AtomicLoadOrdering(\(_rawValue))"
    }
  }
}

//------------------------------------------------------------------------------

/// Specifies the memory ordering semantics of an atomic store operation.
@frozen
public struct AtomicStoreOrdering {
  // This struct works like a non-frozen enum whose cases aren't reorderable.

  @usableFromInline
  internal var _rawValue: Int

  @_semantics("constant_evaluable")
  @inlinable @_transparent // Debug performance
  internal init(_rawValue: Int) {
    self._rawValue = _rawValue
  }
}

extension AtomicStoreOrdering {
  // FIXME: Explain these ordering levels in more detail.

  /// Guarantees the atomicity of the specific operation on which it is applied,
  /// but imposes no ordering constraints on any other variable accesses.
  ///
  /// This value corresponds to `std::memory_order_relaxed` in C++.
  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var relaxed: Self {
    Self(_rawValue: 0)
  }

  /// A releasing store synchronizes with acquiring operations that
  /// read the value it stores. It ensures that the releasing and
  /// acquiring threads agree that all preceding variable accesses on
  /// the releasing thread happen before the atomic operation itself.
  ///
  /// This value corresponds to `std::memory_order_release` in C++.
  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var releasing: Self {
    Self(_rawValue: 3)
  }

  /// A sequentially consistent store performs a releasing store and
  /// also guarantees that it and all other sequentially consistent
  /// atomic operations (loads, stores, updates) appear to be executed
  /// in a single, total sequential ordering.
  ///
  /// This value corresponds to `std::memory_order_seq_cst` in C++.
  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var sequentiallyConsistent: Self {
    Self(_rawValue: 5)
  }
}

extension AtomicStoreOrdering: Equatable {
  @_transparent // Debug performance
  public static func ==(left: Self, right: Self) -> Bool {
    return left._rawValue == right._rawValue
  }
}

extension AtomicStoreOrdering: Hashable {
  @inlinable
  public func hash(into hasher: inout Hasher) {
    hasher.combine(_rawValue)
  }
}

extension AtomicStoreOrdering: CustomStringConvertible {
  public var description: String {
    switch self {
    case .relaxed: return "relaxed"
    case .releasing: return "releasing"
    case .sequentiallyConsistent: return "sequentiallyConsistent"
    default: return "AtomicStoreOrdering(\(_rawValue))"
    }
  }
}

//------------------------------------------------------------------------------

/// Specifies the memory ordering semantics of an atomic read-modify-write
/// operation.
@frozen
public struct AtomicUpdateOrdering {
  // This struct works like a non-frozen enum whose cases aren't reorderable.

  @usableFromInline
  internal var _rawValue: Int

  @_semantics("constant_evaluable")
  @inlinable @_transparent // Debug performance
  internal init(_rawValue: Int) {
    self._rawValue = _rawValue
  }
}

extension AtomicUpdateOrdering {
  // FIXME: Explain these ordering levels in more detail.

  /// Guarantees the atomicity of the specific operation on which it is applied,
  /// but imposes no ordering constraints on any other variable accesses.
  ///
  /// This value corresponds to `std::memory_order_relaxed` in C++.
  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var relaxed: Self {
    Self(_rawValue: 0)
  }

  /// An acquiring update synchronizes with a releasing operation
  /// whose value its reads. It ensures that the releasing and
  /// acquiring threads agree that all subsequent variable accesses on
  /// the acquring thread happen after the atomic operation itself.
  ///
  /// This value corresponds to `std::memory_order_acquire` in C++.
  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var acquiring: Self {
    Self(_rawValue: 2)
  }

  /// A releasing update synchronizes with acquiring operations that
  /// read the value it stores. It ensures that the releasing and
  /// acquiring threads agree that all preceding variable accesses on
  /// the releasing thread happen before the atomic operation itself.
  ///
  /// This value corresponds to `std::memory_order_release` in C++.
  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var releasing: Self {
    Self(_rawValue: 3)
  }

  /// An acquiring-and-releasing operation is a combination of
  /// `.acquiring` and `.releasing` operation on the same variable.
  ///
  /// This value corresponds to `std::memory_order_acq_rel` in C++.
  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var acquiringAndReleasing: Self {
    Self(_rawValue: 4)
  }

  /// A sequentially consistent update performs an
  /// acquiring-and-releasing update and also guarantees that it and
  /// all other sequentially consistent atomic operations (loads, stores,
  /// updates) appear to be executed in a single, total sequential
  /// ordering.
  ///
  /// This value corresponds to `std::memory_order_seq_cst` in C++.
  @_semantics("constant_evaluable")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  public static var sequentiallyConsistent: Self {
    Self(_rawValue: 5)
  }
}

extension AtomicUpdateOrdering: Equatable {
  @_transparent // Debug performance
  public static func ==(left: Self, right: Self) -> Bool {
    return left._rawValue == right._rawValue
  }
}

extension AtomicUpdateOrdering: Hashable {
  @inlinable
  public func hash(into hasher: inout Hasher) {
    hasher.combine(_rawValue)
  }
}

extension AtomicUpdateOrdering: CustomStringConvertible {
  public var description: String {
    switch self {
    case .relaxed: return "relaxed"
    case .acquiring: return "acquiring"
    case .releasing: return "releasing"
    case .acquiringAndReleasing: return "acquiringAndReleasing"
    case .sequentiallyConsistent: return "sequentiallyConsistent"
    default: return "AtomicUpdateOrdering(\(_rawValue))"
    }
  }
}

extension AtomicLoadOrdering {
  @_semantics("constant_evaluable")
  @_semantics("atomics.requires_constant_orderings")
  @_transparent @_alwaysEmitIntoClient
  static func _failureOrdering(
    for ordering: AtomicUpdateOrdering
  ) -> AtomicLoadOrdering {
    switch ordering {
    case .relaxed: return .relaxed
    case .acquiring: return .acquiring
    case .releasing: return .relaxed
    case .acquiringAndReleasing: return .acquiring
    case .sequentiallyConsistent: return .sequentiallyConsistent
    default: fatalError("Unsupported ordering")
    }
  }
}
