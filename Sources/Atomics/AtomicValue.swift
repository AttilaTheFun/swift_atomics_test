
// public protocol AtomicValue {
// }

public protocol AtomicStorage {

  associatedtype Value

  init(_ value: __owned Value)
}
