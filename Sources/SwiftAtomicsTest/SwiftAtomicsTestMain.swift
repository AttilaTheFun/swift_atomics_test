// import Atomics
import _AtomicsShims

public protocol AtomicValue {
  associatedtype AtomicRepresentation: AtomicStorage
}

public protocol AtomicStorage {
  associatedtype Value

  init(_ value: __owned Value)
}

extension Bool: AtomicValue {
  @frozen
  public struct AtomicRepresentation: AtomicStorage {
    public typealias Value = Bool

    @usableFromInline
    internal typealias _Storage = _AtomicInt8Storage

    @usableFromInline
    internal var _storage: _Storage

    @inline(__always) @_alwaysEmitIntoClient
    public init(_ value: Bool) {
      _storage = _sa_prepare_Int8(value._atomicValue)
    }

    @inline(__always) @_alwaysEmitIntoClient
    public func dispose() -> Value {
      return _sa_dispose_Int8(_storage)._atomicBoolValue
    }
  }

  @_alwaysEmitIntoClient @inline(__always)
  internal var _atomicValue: Int8 {
    self ? 1 : 0
  }
}

extension Int8 {
  @_alwaysEmitIntoClient @inline(__always)
  internal var _atomicBoolValue: Bool {
    (self & 1) != 0
  }
}

// @_fixed_layout
// public class ManagedAtomic<Value: AtomicValue>
// where Value.AtomicRepresentation.Value == Value {

//   @usableFromInline
//   internal typealias _Storage = Value.AtomicRepresentation

//   @usableFromInline
//   internal var _storage: _Storage

//   @inline(__always) @_alwaysEmitIntoClient
//   public init(_ value: Value) {
//     _storage = _Storage(value)
//   }
// }

@main
struct SwiftAtomicsTestMain {
  static func main() throws {
    print("before atomic")

    let bool = true
    let storage = Bool.AtomicRepresentation(bool)
    // let managedAtomic = ManagedAtomic(false)

    print("after atomic")
  }
}
