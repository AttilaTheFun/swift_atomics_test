#if ATOMICS_NATIVE_BUILTINS
import Swift
#endif


public protocol AtomicValue {
  associatedtype AtomicRepresentation: AtomicStorage
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

  // @_semantics("atomics.requires_constant_orderings")
  // static func atomicStore(
  //   _ desired: __owned Value,
  //   at pointer: UnsafeMutablePointer<Self>,
  //   ordering: AtomicStoreOrdering
  // )
}
