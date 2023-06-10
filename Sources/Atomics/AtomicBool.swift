
extension Bool: AtomicValue {

  public struct AtomicRepresentation {
    // public typealias Value = Bool

    // internal typealias _Storage = Int8

    internal var _storage: Int8

    public init(_ value: Bool) {
      _storage = value ? 1 : 0
    }
  }
}

extension Bool.AtomicRepresentation: AtomicStorage {
}

