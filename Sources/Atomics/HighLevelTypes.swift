
@_fixed_layout
public class ManagedAtomic<Value: AtomicValue>
where Value.AtomicRepresentation.Value == Value {

  @usableFromInline
  internal typealias _Storage = Value.AtomicRepresentation

  @usableFromInline
  internal var _storage: _Storage

  @inline(__always) @_alwaysEmitIntoClient
  public init(_ value: Value) {
    _storage = _Storage(value)
  }

  @_alwaysEmitIntoClient @inline(__always)
  internal var _ptr: UnsafeMutablePointer<_Storage> {
    _getUnsafePointerToStoredProperties(self)
      .assumingMemoryBound(to: _Storage.self)
  }
}

// extension ManagedAtomic: @unchecked Sendable where Value: Sendable {}
