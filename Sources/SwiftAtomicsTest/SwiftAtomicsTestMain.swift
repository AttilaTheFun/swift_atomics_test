// import Atomics

@main
struct SwiftAtomicsTestMain {
  static func main() throws {
    print("before atomic")

    // let bool = true
    // let storage = Bool.AtomicRepresentation(bool)
    let managedAtomic = ManagedAtomic(false)

    print("after atomic")
  }
}
