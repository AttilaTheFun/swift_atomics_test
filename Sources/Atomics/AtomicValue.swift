
public protocol AtomicValue {
  // associatedtype AtomicRepresentation: AtomicStorage
}

public protocol AtomicStorage {

  associatedtype Value

  init(_ value: __owned Value)
}
