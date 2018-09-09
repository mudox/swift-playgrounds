import Foundation
import UIKit

// Functions are all closures.
// They capture external values.
// Captured values are shared by all closures.

var i = 0

let a = { () -> Void in
  print("before: \(i)")
  i += 1
  print("after: \(i)")
}

let b = a

func foo() {
  i += 10
  print(i)
}

let f = foo

b()
a()
foo()
f()

print(i)

