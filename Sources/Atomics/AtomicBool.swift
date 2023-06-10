
extension Bool: AtomicValue {

  @frozen
  public struct AtomicRepresentation {
    public typealias Value = Bool

    @usableFromInline
    internal typealias _Storage = Int8

    @usableFromInline
    internal var _storage: _Storage

    // @inline(__always) @_alwaysEmitIntoClient
    public init(_ value: Bool) {
      _storage = value._atomicValue
    }
  }

  // @_alwaysEmitIntoClient @inline(__always)
  internal var _atomicValue: Int8 {
    self ? 1 : 0
  }
}

extension Bool.AtomicRepresentation: AtomicStorage {
}

