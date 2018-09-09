import Foundation

public enum List<Element> {
  case end
  indirect case node(_: Element, next: List)
}

public extension List {

  func cons(_ element: Element) -> List<Element> {
    return .node(element, next: self)
  }

  mutating func push(_ element: Element) {
    self = cons(element)
  }

  mutating func pop() -> Element? {
    switch self {
    case .end:
      return nil
    case let .node(element, next: nextNode):
      self = nextNode
      return element
    }
  }

}

extension List: ExpressibleByArrayLiteral {

  public init(arrayLiteral elements: Element...) {
    self = elements.reversed().reduce(.end) { partialList, element in
      return partialList.cons(element)
    }
  }

}

extension List: Sequence {

  public struct Iterator: IteratorProtocol {
    var node: List<Element>

    public mutating func next() -> Element? {
      switch node {
      case .end:
        return nil
      case let .node(x, next: nextNode):
        node = nextNode
        return x
      }
    }

  }

  public func makeIterator() -> Iterator {
    return Iterator(node: self)
  }

}
