// When matching against tuple or enum case with labels, labels can be omitted.

play("pttern matching tuple with labels") {
  let a = (name: "mudox", age: 36)
  
  let (name, age) = a
  name
  age
  
  switch a {
  case let (name, age):
    name
    age
  }
}


play("pattern matching enum case with assocated value") {
  
  enum E {
    case a(name: String, age: Int)
  }
  
  let e = E.a(name: "mudox", age: 35)
  
  if case let E.a(name, age) = e {
    name
    age
  } else {
    print("oops")
  }
  
}

play("function returning tuple with labels") {
  func foo() -> (name: String, age: Int) {
    return ("mudox", 32)
  }
  
  let r = foo()
  r.name
  r.age
}
