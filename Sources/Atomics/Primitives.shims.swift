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
  /// Atomically loads a word starting at this address with the specified
  /// memory ordering.
  @_semantics("atomics.requires_constant_orderings")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  @usableFromInline
  internal func _atomicLoad(ordering: AtomicLoadOrdering) -> Int8 {
    switch ordering {
    case .relaxed:
      return _sa_load_relaxed_Int8(self)
    case .acquiring:
      return _sa_load_acquire_Int8(self)
    case .sequentiallyConsistent:
      return _sa_load_seq_cst_Int8(self)
    default:
      fatalError("Unsupported ordering")
    }
  }

  /// Atomically stores the specified value starting at the memory referenced by
  /// this pointer, with the specified memory ordering.
  @_semantics("atomics.requires_constant_orderings")
  @_alwaysEmitIntoClient
  @_transparent // Debug performance
  @usableFromInline
  internal func _atomicStore(
    _ desired: Int8,
    ordering: AtomicStoreOrdering
  ) {
    switch ordering {
    case .relaxed:
      _sa_store_relaxed_Int8(self, desired)
    case .releasing:
      _sa_store_release_Int8(self, desired)
    case .sequentiallyConsistent:
      _sa_store_seq_cst_Int8(self, desired)
    default:
      fatalError("Unsupported ordering")
    }
  }

  // @_semantics("atomics.requires_constant_orderings")
  // @_alwaysEmitIntoClient
  // @_transparent // Debug performance
  // @usableFromInline
  // internal
  // func _atomicLoadThenWrappingDecrement(
  //   by operand: Int8,
  //   ordering: AtomicUpdateOrdering
  // ) -> Int8 {
  //   switch ordering {
  //   case .relaxed:
  //     return _sa_fetch_sub_relaxed_Int8(
  //       self, operand)
  //   case .acquiring:
  //     return _sa_fetch_sub_acquire_Int8(
  //       self, operand)
  //   case .releasing:
  //     return _sa_fetch_sub_release_Int8(
  //       self, operand)
  //   case .acquiringAndReleasing:
  //     return _sa_fetch_sub_acq_rel_Int8(
  //       self, operand)
  //   case .sequentiallyConsistent:
  //     return _sa_fetch_sub_seq_cst_Int8(
  //       self, operand)
  //   default:
  //     preconditionFailure("Unsupported ordering")
  //   }
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_alwaysEmitIntoClient
  // @_transparent // Debug performance
  // @usableFromInline
  // internal
  // func _atomicLoadThenBitwiseAnd(
  //   with operand: Int8,
  //   ordering: AtomicUpdateOrdering
  // ) -> Int8 {
  //   switch ordering {
  //   case .relaxed:
  //     return _sa_fetch_and_relaxed_Int8(
  //       self, operand)
  //   case .acquiring:
  //     return _sa_fetch_and_acquire_Int8(
  //       self, operand)
  //   case .releasing:
  //     return _sa_fetch_and_release_Int8(
  //       self, operand)
  //   case .acquiringAndReleasing:
  //     return _sa_fetch_and_acq_rel_Int8(
  //       self, operand)
  //   case .sequentiallyConsistent:
  //     return _sa_fetch_and_seq_cst_Int8(
  //       self, operand)
  //   default:
  //     preconditionFailure("Unsupported ordering")
  //   }
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_alwaysEmitIntoClient
  // @_transparent // Debug performance
  // @usableFromInline
  // internal
  // func _atomicLoadThenBitwiseOr(
  //   with operand: Int8,
  //   ordering: AtomicUpdateOrdering
  // ) -> Int8 {
  //   switch ordering {
  //   case .relaxed:
  //     return _sa_fetch_or_relaxed_Int8(
  //       self, operand)
  //   case .acquiring:
  //     return _sa_fetch_or_acquire_Int8(
  //       self, operand)
  //   case .releasing:
  //     return _sa_fetch_or_release_Int8(
  //       self, operand)
  //   case .acquiringAndReleasing:
  //     return _sa_fetch_or_acq_rel_Int8(
  //       self, operand)
  //   case .sequentiallyConsistent:
  //     return _sa_fetch_or_seq_cst_Int8(
  //       self, operand)
  //   default:
  //     preconditionFailure("Unsupported ordering")
  //   }
  // }

  // @_semantics("atomics.requires_constant_orderings")
  // @_alwaysEmitIntoClient
  // @_transparent // Debug performance
  // @usableFromInline
  // internal
  // func _atomicLoadThenBitwiseXor(
  //   with operand: Int8,
  //   ordering: AtomicUpdateOrdering
  // ) -> Int8 {
  //   switch ordering {
  //   case .relaxed:
  //     return _sa_fetch_xor_relaxed_Int8(
  //       self, operand)
  //   case .acquiring:
  //     return _sa_fetch_xor_acquire_Int8(
  //       self, operand)
  //   case .releasing:
  //     return _sa_fetch_xor_release_Int8(
  //       self, operand)
  //   case .acquiringAndReleasing:
  //     return _sa_fetch_xor_acq_rel_Int8(
  //       self, operand)
  //   case .sequentiallyConsistent:
  //     return _sa_fetch_xor_seq_cst_Int8(
  //       self, operand)
  //   default:
  //     preconditionFailure("Unsupported ordering")
  //   }
  // }
}

#endif // ATOMICS_NATIVE_BUILTINS
