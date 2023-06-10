
public class ManagedAtomic<Value: AtomicValue> { // where Value.AtomicRepresentation.Value == Value

  internal var _storage: Value // Value.AtomicRepresentation

  public init(_ value: Value) {
    _storage = value //Value.AtomicRepresentation(value)
  }
}
