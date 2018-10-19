import Foundation

public protocol A {
  func foo()
}

internal struct AA: A {
  public func foo() {
    print("hi")
  }
}


let aa = AA()
aa.foo()
