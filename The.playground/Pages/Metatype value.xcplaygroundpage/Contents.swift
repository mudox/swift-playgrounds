import Foundation

class A {
  var name = "Class A"
  required init() {}
  required init(name: String) {
    self.name = name
  }

  static func hi1() -> String { return "hi1" }
  class func hi2() -> String { return "hi2" }
}

struct B {
  var name = "Struct B"
  init(name: String) {
    self.name = name
  }
}

let t = A.self
let a = t.init(name: "heihei")
a.name
t.hi2()
t.hi1()

let t1 = B.self
let b = t1.init(name: "haha")
b.name

print(type(of: A.self))
print(type(of: a))
print(type(of: B.self))
print(type(of: b))

