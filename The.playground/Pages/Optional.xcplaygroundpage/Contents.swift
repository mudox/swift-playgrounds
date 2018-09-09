import UIKit

play("for/while case let value? in") {
  let numberStrings = ["1", "0", "-0", "ab", "- 33"]

  p("plain `for` does not filter out nil elements")
  for i in numberStrings.map(Int.init) {
    p1(i)
  }


  p("`for case let i? in ...` filters out nil elements before iteration")
  for case let i? in numberStrings.map(Int.init) {
    p1("type of i: \(type(of: i)), value: \(i)")
  }


  p("using boolean clause after `where` does filter but does not remove the Optional type")
  for i in numberStrings.map(Int.init) where i != nil {
    p1("type of i: \(type(of: i)), value: \(i)")
  }


  p("use compactMap to achieve the same effect")
  let numbers = numberStrings.map(Int.init).compactMap { $0 }
  p1(numbers)
}

play("assigning through optional chain") {
  struct Person {
    var age: Int = 0
  }

  var someone: Person? = Person()

  // bad way #1
  if someone != nil {
    someone!.age += 1
  }
  p1(someone?.age)

  // warong way
  if var p = someone { // someone is a value type, a copy created here
    p.age += 1
  }
  p1(someone?.age)

  // right way
  someone?.age += 1
  p1(someone?.age)
}

play("use Optional.flatMap to simplify code") {

  func cumbersomeCode() -> UIImageView? {
    let urlString = "https://www.objc.io/logo.png"

    guard let url = URL(string: urlString) else {
      return nil
    }

    guard let data = try? Data(contentsOf: url) else {
      return nil
    }

    guard let image = UIImage(data: data) else {
      return nil
    }

    return UIImageView(image: image)
  }

  func goodCode() -> UIImageView? {
    let urlString = "https://www.objc.io/logo.png"
    return URL(string: urlString)
      .flatMap { try? Data(contentsOf: $0) }
      .flatMap { UIImage(data: $0) }
      .map { UIImageView(image: $0) }
  }

  goodCode()
}
