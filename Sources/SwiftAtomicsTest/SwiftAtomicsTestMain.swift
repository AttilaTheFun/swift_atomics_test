import Atomics

@main
struct SwiftAtomicsTestMain {
  static func main() throws {
    print("before atomic")

    let managedAtomic = ManagedAtomic(false)

    print("after atomic")
  }
}
