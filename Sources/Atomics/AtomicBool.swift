// #if ATOMICS_NATIVE_BUILTINS
// import Swift
// #else
import _AtomicsShims
// #endif

extension Bool: AtomicValue {
  @frozen
  public struct AtomicRepresentation {
    public typealias Value = Bool

// #if ATOMICS_NATIVE_BUILTINS
//     @usableFromInline
//     internal typealias _Storage = Int8
// #else
    @usableFromInline
    internal typealias _Storage = _AtomicInt8Storage
// #endif

    @usableFromInline
    internal var _storage: _Storage

    @inline(__always) @_alwaysEmitIntoClient
    public init(_ value: Bool) {
// #if ATOMICS_NATIVE_BUILTINS
//       _storage = value._atomicValue
// #else
      _storage = _sa_prepare_Int8(value._atomicValue)
// #endif
    }

    @inline(__always) @_alwaysEmitIntoClient
    public func dispose() -> Value {
// #if ATOMICS_NATIVE_BUILTINS
//       return _storage._atomicBoolValue
// #else
      return _sa_dispose_Int8(_storage)._atomicBoolValue
// #endif
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

extension UnsafeMutablePointer
where Pointee == Bool.AtomicRepresentation {
  @_transparent @_alwaysEmitIntoClient
  @usableFromInline
  internal var _extract: UnsafeMutablePointer<Pointee._Storage> {
    // `Bool.AtomicRepresentation` is layout-compatible with
    // its only stored property.
    UnsafeMutableRawPointer(self).assumingMemoryBound(to: Pointee._Storage.self)
  }
}

extension Bool.AtomicRepresentation: AtomicStorage {
}

