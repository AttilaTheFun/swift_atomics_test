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


// #############################################################################
// #                                                                           #
// #            DO NOT EDIT THIS FILE; IT IS AUTOGENERATED.                    #
// #                                                                           #
// #############################################################################


#if ATOMICS_NATIVE_BUILTINS
import Swift
#else
import _AtomicsShims
#endif

extension Bool: AtomicValue {
  @frozen
  public struct AtomicRepresentation {
    public typealias Value = Bool

#if ATOMICS_NATIVE_BUILTINS
    @usableFromInline
    internal typealias _Storage = Int8
#else
    @usableFromInline
    internal typealias _Storage = _AtomicInt8Storage
#endif

    @usableFromInline
    internal var _storage: _Storage

    @inline(__always) @_alwaysEmitIntoClient
    public init(_ value: Bool) {
#if ATOMICS_NATIVE_BUILTINS
      _storage = value._atomicValue
#else
      _storage = _sa_prepare_Int8(value._atomicValue)
#endif
    }

    @inline(__always) @_alwaysEmitIntoClient
    public func dispose() -> Value {
#if ATOMICS_NATIVE_BUILTINS
      return _storage._atomicBoolValue
#else
      return _sa_dispose_Int8(_storage)._atomicBoolValue
#endif
    }
  }

  @_alwaysEmitIntoClient @inline(__always)
  internal var _atomicValue: Int8 {
    self ? 1 : 0
  }
}

extension Int8 {
  @_alwaysEmitIntoClient @inline(__always)
  internal var _atomicBoolValue: Bool {
    (self & 1) != 0
  }
}

extension UnsafeMutablePointer
where Pointee == Bool.AtomicRepresentation {
  @_transparent @_alwaysEmitIntoClient
  @usableFromInline
  internal var _extract: UnsafeMutablePointer<Pointee._Storage> {
    // `Bool.AtomicRepresentation` is layout-compatible with
    // its only stored property.
    UnsafeMutableRawPointer(self).assumingMemoryBound(to: Pointee._Storage.self)
  }
}

extension Bool.AtomicRepresentation: AtomicStorage {
  @_semantics("atomics.requires_constant_orderings")
  @_transparent @_alwaysEmitIntoClient
  public static func atomicLoad(
    at pointer: UnsafeMutablePointer<Bool.AtomicRepresentation>,
    ordering: AtomicLoadOrdering
  ) -> Bool {
    pointer._extract._atomicLoad(ordering: ordering)._atomicBoolValue
  }

  @_semantics("atomics.requires_constant_orderings")
  @_transparent @_alwaysEmitIntoClient
  public static func atomicStore(
    _ desired: __owned Bool,
    at pointer: UnsafeMutablePointer<Bool.AtomicRepresentation>,
    ordering: AtomicStoreOrdering
  ) {
    pointer._extract._atomicStore(desired._atomicValue, ordering: ordering)
  }

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public static func atomicExchange(
  //   _ desired: __owned Bool,
  //   at pointer: UnsafeMutablePointer<Bool.AtomicRepresentation>,
  //   ordering: AtomicUpdateOrdering
  // ) -> Bool {
  //   pointer._extract._atomicExchange(
  //     desired._atomicValue, ordering: ordering
  //   )._atomicBoolValue
  // }

  @_semantics("atomics.requires_constant_orderings")
  @_transparent @_alwaysEmitIntoClient
  public static func atomicCompareExchange(
    expected: Bool,
    desired: __owned Bool,
    at pointer: UnsafeMutablePointer<Bool.AtomicRepresentation>,
    ordering: AtomicUpdateOrdering
  ) -> (exchanged: Bool, original: Bool) {
    let r = pointer._extract._atomicCompareExchange(
      expected: expected._atomicValue,
      desired: desired._atomicValue,
      ordering: ordering)
    return (r.exchanged, r.original._atomicBoolValue)
  }

  @_semantics("atomics.requires_constant_orderings")
  @_transparent @_alwaysEmitIntoClient
  public static func atomicCompareExchange(
    expected: Bool,
    desired: __owned Bool,
    at pointer: UnsafeMutablePointer<Bool.AtomicRepresentation>,
    successOrdering: AtomicUpdateOrdering,
    failureOrdering: AtomicLoadOrdering
  ) -> (exchanged: Bool, original: Bool) {
    let r = pointer._extract._atomicCompareExchange(
      expected: expected._atomicValue,
      desired: desired._atomicValue,
      successOrdering: successOrdering,
      failureOrdering: failureOrdering)
    return (r.exchanged, r.original._atomicBoolValue)
  }

  @_semantics("atomics.requires_constant_orderings")
  @_transparent @_alwaysEmitIntoClient
  public static func atomicWeakCompareExchange(
    expected: Bool,
    desired: __owned Bool,
    at pointer: UnsafeMutablePointer<Bool.AtomicRepresentation>,
    successOrdering: AtomicUpdateOrdering,
    failureOrdering: AtomicLoadOrdering
  ) -> (exchanged: Bool, original: Bool) {
    let r = pointer._extract._atomicWeakCompareExchange(
      expected: expected._atomicValue,
      desired: desired._atomicValue,
      successOrdering: successOrdering,
      failureOrdering: failureOrdering)
    return (r.exchanged, r.original._atomicBoolValue)
  }
}

