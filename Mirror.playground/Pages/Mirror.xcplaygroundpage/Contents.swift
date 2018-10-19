import Foundation

class Base {
  let level = 1
  let name = "base"
}

class A: Base {
  let age = 12
  var active = false
}

extension A: CustomDebugStringConvertible {
  var debugDescription: String {
    return "A"
  }
}

extension A: CustomReflectable {
  var customMirror: Mirror {
    return Mirror(
      A.self,
      children: [
        "Name": name,
        "Age": age,
      ],
      displayStyle: .struct,
      ancestorRepresentation: .generated
    )
  }
}

let a = A()
dump(a)

let c = [1, 2, 3, 5]
print()
dump(c)

enum E {
  case a, b, c, e
}

let e = E.e

print()
debugPrint(e)
dump(e)
