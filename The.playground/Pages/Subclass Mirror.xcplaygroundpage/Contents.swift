import Foundation

class A: CustomReflectable {
  let id = 1

  var customMirror: Mirror {
    return Mirror(
      self, children: [
        "id": id
      ],
      displayStyle: .class,
      ancestorRepresentation: .generated
    )
  }
}

class B: A {
  let name = "mudox"
  override var customMirror: Mirror {
    return Mirror(
      self, children: [
        "name": name
      ],
      displayStyle: .class,
      ancestorRepresentation: .customized { super.customMirror }
    )
  }
}

let a = A()
let b = B()

dump(a)
dump(b)
