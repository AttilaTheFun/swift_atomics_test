#if !ATOMICS_NATIVE_BUILTINS
import _AtomicsShims

// @_alwaysEmitIntoClient
// @_transparent
// internal func _atomicMemoryFence(
//   ordering: AtomicUpdateOrdering
// ) {
//   switch ordering {
//     case .relaxed:
//       break
//   case .acquiring:
//       _sa_thread_fence_acquire()
//   case .releasing:
//       _sa_thread_fence_release()
//   case .acquiringAndReleasing:
//       _sa_thread_fence_acq_rel()
//   case .sequentiallyConsistent:
//       _sa_thread_fence_seq_cst()
//     default:
//       fatalError("Unsupported ordering")
//   }
// }

extension UnsafeMutablePointer where Pointee == _AtomicInt8Storage {
}

#endif // ATOMICS_NATIVE_BUILTINS
