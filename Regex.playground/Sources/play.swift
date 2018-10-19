import Foundation

public struct Separator: CustomStringConvertible {
  static let shared = Separator()
  private init() { }

  public var description: String {
    return """
      🐠
      """
  }
}

public func play(_ title: String, body: () -> ()) -> Separator {
  print("\n💡 \(title)\n")
  body()

  return Separator.shared
}

private func echo(_ input: Any, indentLevel: Int = 0) {
  let indentWidth = 2
  let padding = String(repeating: "\u{20}", count: indentLevel * indentWidth + 3)
  let output =
    String(describing: input)
    .split(separator: "\n").map {
      padding + $0
    }
    .joined()
  print(output)
}

public func p(_ input: Any) {
  echo(input)
}

public func p1(_ input: Any) {
  echo(input, indentLevel: 1)
}
