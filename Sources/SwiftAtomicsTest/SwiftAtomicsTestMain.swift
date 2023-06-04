// import Atomics
import _AtomicsShims

@main
struct SwiftAtomicsTestMain {
  static func main() throws {
    print("before atomic")

    let atomicValue: Int8 = 1
    let storage = _sa_prepare_Int8(atomicValue)

    print("after atomic")
  }
}
