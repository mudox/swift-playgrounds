import Foundation
import UIKit

play("struct with all its stored properties conforming to Hashable") {
  struct Point: Hashable {
    let x: Double
    let y: Double
  }

  let p = Point(x: 0, y: 0)
  p.hashValue
}

play("enum without assocaited values") {
  enum Char {
    case a, b, c
  }

  let a = Char.a
  let b = Char.b

  a == b
  a.hashValue
  b.hashValue
}
