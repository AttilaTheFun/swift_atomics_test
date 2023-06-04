import Atomics

@main
struct SwiftAtomicsTestMain {
  static func main() throws {
    print("before atomic")

    let isOpen = ManagedAtomic(false)
    print(isOpen.load(ordering: .sequentiallyConsistent))

    print("after atomic")
  }
}
