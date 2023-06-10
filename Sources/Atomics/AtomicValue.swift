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
}
