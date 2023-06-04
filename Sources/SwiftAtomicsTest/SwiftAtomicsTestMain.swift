import Atomics
import _AtomicsShims

// extension Bool {
//   struct TestAtomicRepresentation {
//     @usableFromInline
//     internal typealias _Storage = _AtomicInt8Storage

//     @usableFromInline
//     internal var _storage: _Storage

//     @inline(__always) @_alwaysEmitIntoClient
//     public init(_ value: Bool) {
//       _storage = _sa_prepare_Int8(value._atomicValue)
//     }
//   }

//   @_alwaysEmitIntoClient @inline(__always)
//   internal var _atomicValue: Int8 {
//     self ? 1 : 0
//   }
// }

@_fixed_layout
public class TestManagedAtomic<Value: AtomicValue>
where Value.AtomicRepresentation.Value == Value {
  // Note: the Value.AtomicRepresentation.Value == Value requirement could be relaxed,
  // at the cost of adding a bunch of potentially ambiguous overloads.
  // (We'd need one set of implementations for the type equality condition,
  // and another for `Value: AtomicReference`.)

  @usableFromInline
  internal typealias _Storage = Value.AtomicRepresentation

  /// The atomic representation of the value stored inside.
  ///
  /// Warning: This ivar must only ever be accessed via `_ptr` after
  /// its initialization.
  @usableFromInline
  internal var _storage: _Storage

  /// Initialize a new managed atomic instance holding the specified initial
  /// value.
  @inline(__always) @_alwaysEmitIntoClient
  public init(_ value: Value) {
    _storage = _Storage(value)
  }

  deinit {
    _ = _ptr.pointee.dispose()
  }

  @_alwaysEmitIntoClient @inline(__always)
  internal var _ptr: UnsafeMutablePointer<_Storage> {
    _getUnsafePointerToStoredProperties(self)
      .assumingMemoryBound(to: _Storage.self)
  }
}

@main
struct SwiftAtomicsTestMain {
  static func main() throws {
    print("before atomic")

    // let bool = true
    // let storage = Bool.AtomicRepresentation(bool)
    let managedAtomic = TestManagedAtomic(false)

    print("after atomic")
  }
}
