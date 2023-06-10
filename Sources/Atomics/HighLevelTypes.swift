
public class ManagedAtomic<Value: AtomicValue> {

  internal var _storage: Value

  public init(_ value: Value) {
    _storage = value
  }
}
