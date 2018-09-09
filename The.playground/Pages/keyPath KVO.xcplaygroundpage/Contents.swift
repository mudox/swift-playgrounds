import Foundation
import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true

struct A {
  var value = 0
}

class B: NSObject {
  @objc dynamic var value = "a"
  
  override var debugDescription: String {
    return "B"
  }
}

var a = A()
a[keyPath: \A.value]

let b = B()
b[keyPath: \B.value]

b.observe(\B.value, options: [.new, .old, .prior, .initial]) { object, change in
  change.kind == .setting
  dump(object)
  dump(change)
  print()
}

b.value = "x"
