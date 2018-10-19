import Foundation

play("external label must be specified explicitly") {
  struct A {
    subscript(arg1 position: Int, arg2 name: String) -> Int {
      print("subscripting #\(position)")
      return position
    }
  }

  let a = A()
  a[arg1: 2, arg2: "mudox"]
}

// 2 or 3 spans
