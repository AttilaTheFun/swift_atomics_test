

public class ManagedAtomic<Value: AtomicValue>
where Value.AtomicRepresentation.Value == Value {

  // internal typealias _Storage = 

  internal var _storage: Value.AtomicRepresentation

  public init(_ value: Value) {
    _storage = Value.AtomicRepresentation(value)
  }
}
