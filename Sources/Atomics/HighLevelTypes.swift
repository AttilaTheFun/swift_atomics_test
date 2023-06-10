#if ATOMICS_NATIVE_BUILTINS
import Swift
#endif

@_fixed_layout
public class ManagedAtomic<Value: AtomicValue>
where Value.AtomicRepresentation.Value == Value {

  @usableFromInline
  internal typealias _Storage = Value.AtomicRepresentation

  @usableFromInline
  internal var _storage: _Storage

  @inline(__always) @_alwaysEmitIntoClient
  public init(_ value: Value) {
    _storage = _Storage(value)
  }

  deinit {
    _ = _ptr.pointee.dispose()
  }

  @_alwaysEmitIntoClient @inline(__always)
  internal var _ptr: UnsafeMutablePointer<_Storage> {
    _getUnsafePointerToStoredProperties(self)
      .assumingMemoryBound(to: _Storage.self)
  }
}

extension ManagedAtomic: @unchecked Sendable where Value: Sendable {}


extension ManagedAtomic {

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public func load(
  //   ordering: AtomicLoadOrdering
  // ) -> Value {
  //   _Storage.atomicLoad(at: _ptr, ordering: ordering)
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public func store(
  //   _ desired: __owned Value,
  //   ordering: AtomicStoreOrdering
  // ) {
  //   _Storage.atomicStore(desired, at: _ptr, ordering: ordering)
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public func exchange(
  //   _ desired: __owned Value,
  //   ordering: AtomicUpdateOrdering
  // ) -> Value {
  //   _Storage.atomicExchange(desired, at: _ptr, ordering: ordering)
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public func compareExchange(
  //   expected: Value,
  //   desired: __owned Value,
  //   ordering: AtomicUpdateOrdering
  // ) -> (exchanged: Bool, original: Value) {
  //   _Storage.atomicCompareExchange(
  //     expected: expected,
  //     desired: desired,
  //     at: _ptr,
  //     ordering: ordering)
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public func compareExchange(
  //   expected: Value,
  //   desired: __owned Value,
  //   successOrdering: AtomicUpdateOrdering,
  //   failureOrdering: AtomicLoadOrdering
  // ) -> (exchanged: Bool, original: Value) {
  //   _Storage.atomicCompareExchange(
  //     expected: expected,
  //     desired: desired,
  //     at: _ptr,
  //     successOrdering: successOrdering,
  //     failureOrdering: failureOrdering)
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public func weakCompareExchange(
  //   expected: Value,
  //   desired: __owned Value,
  //   ordering: AtomicUpdateOrdering
  // ) -> (exchanged: Bool, original: Value) {
  //   _Storage.atomicWeakCompareExchange(
  //     expected: expected,
  //     desired: desired,
  //     at: _ptr,
  //     ordering: ordering)
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_transparent @_alwaysEmitIntoClient
  // public func weakCompareExchange(
  //   expected: Value,
  //   desired: __owned Value,
  //   successOrdering: AtomicUpdateOrdering,
  //   failureOrdering: AtomicLoadOrdering
  // ) -> (exchanged: Bool, original: Value) {
  //   _Storage.atomicWeakCompareExchange(
  //     expected: expected,
  //     desired: desired,
  //     at: _ptr,
  //     successOrdering: successOrdering,
  //     failureOrdering: failureOrdering)
  // }
}
