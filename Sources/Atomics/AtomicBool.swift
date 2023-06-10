
extension Bool: AtomicValue {

  // @frozen
  public struct AtomicRepresentation {
    public typealias Value = Bool

    // @usableFromInline
    internal typealias _Storage = Int8

    // @usableFromInline
    internal var _storage: _Storage

    public init(_ value: Bool) {
      _storage = value ? 1 : 0
    }
  }
}

extension Bool.AtomicRepresentation: AtomicStorage {
}

