import Foundation
import UIKit

let s = "mudox" as NSMutableString

s.observe(\NSMutableString.length) { _, change in
  print(change)
}

s.append("is me")
print(s.length)
print(s)

struct A {
  let name = "a"
  var level = 0
}

let keyPath = \A.name
var a = A()
a[keyPath: keyPath]
a[keyPath: \A.level] = 12
dump(a)
