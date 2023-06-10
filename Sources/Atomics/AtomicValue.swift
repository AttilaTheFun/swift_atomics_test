
#if ATOMICS_NATIVE_BUILTINS
import Swift
#endif

/// A type that supports atomic operations through a separate atomic storage
/// representation.
public protocol AtomicValue {
  /// The atomic storage representation for this value.
  associatedtype AtomicRepresentation: AtomicStorage
  /* where Self is a subtype of AtomicRepresentation.Value */
}

public protocol AtomicStorage {

  associatedtype Value

  init(_ value: __owned Value)

  __consuming func dispose() -> Value

  @_semantics("atomics.requires_constant_orderings")
  static func atomicLoad(
    at pointer: UnsafeMutablePointer<Self>,
    ordering: AtomicLoadOrdering
  ) -> Value

  @_semantics("atomics.requires_constant_orderings")
  static func atomicStore(
    _ desired: __owned Value,
    at pointer: UnsafeMutablePointer<Self>,
    ordering: AtomicStoreOrdering
  )

  @_semantics("atomics.requires_constant_orderings")
  static func atomicCompareExchange(
    expected: Value,
    desired: __owned Value,
    at pointer: UnsafeMutablePointer<Self>,
    ordering: AtomicUpdateOrdering
  ) -> (exchanged: Bool, original: Value)

  @_semantics("atomics.requires_constant_orderings")
  static func atomicCompareExchange(
    expected: Value,
    desired: __owned Value,
    at pointer: UnsafeMutablePointer<Self>,
    successOrdering: AtomicUpdateOrdering,
    failureOrdering: AtomicLoadOrdering
  ) -> (exchanged: Bool, original: Value)

  // @_semantics("atomics.requires_constant_orderings")
  // static func atomicWeakCompareExchange(
  //   expected: Value,
  //   desired: __owned Value,
  //   at pointer: UnsafeMutablePointer<Self>,
  //   ordering: AtomicUpdateOrdering
  // ) -> (exchanged: Bool, original: Value)

  // @_semantics("atomics.requires_constant_orderings")
  // static func atomicWeakCompareExchange(
  //   expected: Value,
  //   desired: __owned Value,
  //   at pointer: UnsafeMutablePointer<Self>,
  //   successOrdering: AtomicUpdateOrdering,
  //   failureOrdering: AtomicLoadOrdering
  // ) -> (exchanged: Bool, original: Value)
}

extension AtomicStorage {
  @_semantics("atomics.requires_constant_orderings")
  @_transparent @_alwaysEmitIntoClient
  public static func atomicCompareExchange(
    expected: Value,
    desired: __owned Value,
    at pointer: UnsafeMutablePointer<Self>,
    ordering: AtomicUpdateOrdering
  ) -> (exchanged: Bool, original: Value) {
    atomicCompareExchange(
      expected: expected,
      desired: desired,
      at: pointer,
      successOrdering: ordering,
      failureOrdering: ._failureOrdering(for: ordering))
  }

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public static func atomicWeakCompareExchange(
  //   expected: Value,
  //   desired: __owned Value,
  //   at pointer: UnsafeMutablePointer<Self>,
  //   ordering: AtomicUpdateOrdering
  // ) -> (exchanged: Bool, original: Value) {
  //   atomicWeakCompareExchange(
  //     expected: expected,
  //     desired: desired,
  //     at: pointer,
  //     successOrdering: ordering,
  //     failureOrdering: ._failureOrdering(for: ordering))
  // }
}
