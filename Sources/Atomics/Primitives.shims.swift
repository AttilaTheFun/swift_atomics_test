#if !ATOMICS_NATIVE_BUILTINS
import _AtomicsShims

@_alwaysEmitIntoClient
@_transparent
internal func _atomicMemoryFence(
  ordering: AtomicUpdateOrdering
) {
  switch ordering {
    case .relaxed:
      break
  case .acquiring:
      _sa_thread_fence_acquire()
  case .releasing:
      _sa_thread_fence_release()
  case .acquiringAndReleasing:
      _sa_thread_fence_acq_rel()
  case .sequentiallyConsistent:
      _sa_thread_fence_seq_cst()
    default:
      fatalError("Unsupported ordering")
  }
}

extension UnsafeMutablePointer where Pointee == _AtomicInt8Storage {
  // @_semantics("atomics.requires_constant_orderings")
  // @_alwaysEmitIntoClient
  // @_transparent // Debug performance
  // @usableFromInline
  // internal func _atomicLoad(ordering: AtomicLoadOrdering) -> Int8 {
  //   switch ordering {
  //   case .relaxed:
  //     return _sa_load_relaxed_Int8(self)
  //   case .acquiring:
  //     return _sa_load_acquire_Int8(self)
  //   case .sequentiallyConsistent:
  //     return _sa_load_seq_cst_Int8(self)
  //   default:
  //     fatalError("Unsupported ordering")
  //   }
  // }
}

#endif // ATOMICS_NATIVE_BUILTINS
