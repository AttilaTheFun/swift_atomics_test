// import Atomics
import _AtomicsShims

extension Bool {
  struct TestAtomicRepresentation {
    @usableFromInline
    internal typealias _Storage = _AtomicInt8Storage

    @usableFromInline
    internal var _storage: _Storage

    @inline(__always) @_alwaysEmitIntoClient
    public init(_ value: Bool) {
      _storage = _sa_prepare_Int8(value._atomicValue)
    }
  }

  @_alwaysEmitIntoClient @inline(__always)
  internal var _atomicValue: Int8 {
    self ? 1 : 0
  }
}

@main
struct SwiftAtomicsTestMain {
  static func main() throws {
    print("before atomic")

    let bool = true
    let storage = Bool.TestAtomicRepresentation(bool)

    print("after atomic")
  }
}
