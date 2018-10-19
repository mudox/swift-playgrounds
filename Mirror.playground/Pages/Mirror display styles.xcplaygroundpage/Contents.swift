import Foundation

/*
 *
 * 1 - classs
 *
 */

class ClassA: CustomDebugStringConvertible {
  let name: String = "Class A"
  var age: Int = 928

  var debugDescription: String {
    return "\(type(of: self))"
  }
}

let a = ClassA()
print("\n\n--- Class Style\n")
dump(a)

/*
 *
 * 2 - struct
 *
 */

class StructB: CustomDebugStringConvertible {
  let name: String = "Struct B"
  var age: Int = 928

  var debugDescription: String {
    return "\(type(of: self))"
  }
}

let b = StructB()
print("\n\n--- Struct Style\n")
dump(b)

/*
 *
 * 3 - enum
 *
 */

enum EnumC: CustomDebugStringConvertible {
  case c(name: String, age: Int)

  var debugDescription: String {
    return "\(type(of: self))"
  }
}

let c = EnumC.c(name: "Enum C", age: 3)
print("\n\n--- Enum Style\n")
dump(c)

enum EnumD: String {
  case d
}

let d = EnumD.d
print()
dump(d)

/*
 *
 * 4 - tuple
 *
 */

let e = (name: "Tuple E", age: 4)
print("\n\n--- Tuple Style\n")
dump(e)

/*
 *
 * 5 - optional
 *
 */

let f: StructB? = StructB()
print("\n\n--- Optional Style\n")
dump(f)

let g: StructB? = nil
print()
dump(g)

/*
 *
 * 6 - array
 *
 */

let h = [1, 2, 3]
print("\n\n--- Array Style\n")
dump(h)
/*
 *
 * 7 - set
 *
 */

let i: Set<Int> = [1, 2, 3]
print("\n\n--- Set Style\n")
dump(i)

/*
 *
 * 8 - ditionary
 *
 */

let j: [String: Int] = ["a": 1, "b": 2]
print("\n\n--- Dictionary Style\n")
dump(j)
