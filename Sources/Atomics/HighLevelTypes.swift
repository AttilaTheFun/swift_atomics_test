

public class ManagedAtomic<Value: AtomicValue>
where Value.AtomicRepresentation.Value == Value {

  // @usableFromInline
  internal typealias _Storage = Value.AtomicRepresentation

  // @usableFromInline
  internal var _storage: _Storage

  public init(_ value: Value) {
    _storage = _Storage(value)
  }
}
