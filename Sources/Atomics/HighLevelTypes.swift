
public class ManagedAtomic<Value> { // <Value: AtomicValue> {

  internal var _storage: Value

  public init(_ value: Value) {
    _storage = value
  }
}
