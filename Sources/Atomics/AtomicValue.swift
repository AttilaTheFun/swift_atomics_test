
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
}
