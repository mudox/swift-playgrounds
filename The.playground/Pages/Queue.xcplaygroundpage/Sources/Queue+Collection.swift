import Foundation

extension FIFOQueue: MutableCollection {

  public var startIndex: Int { return 0 }
  public var endIndex: Int { return left.count + right.count }

  public func index(after i: Int) -> Int {
    precondition(i < endIndex)
    return i + 1
  }
  
  public func index(before i: Int) -> Int {
    precondition(i > startIndex)
    return i - 1
  }

  public subscript(position: Int) -> Element {
    get {
      precondition((0..<endIndex).contains(position), "Index out of bounds")
      
      if position < left.endIndex {
        return left[left.count - 1 - position]
      } else {
        return right[position - left.count]
      }
    }

    set {
      precondition((0..<endIndex).contains(position), "Index out of bounds")
      
      if position < left.endIndex {
        left[left.count - 1 - position] = newValue
      } else {
        right[position - left.count] = newValue
      }
    }
    
  } // subscript

}

extension FIFOQueue: ExpressibleByArrayLiteral {

  public init(arrayLiteral elements: Element...) {
    left = elements.reversed()
    right = []
  }

}

extension FIFOQueue {

  /// optimizied Indices type implementation
  public typealias Indices = CountableRange<Int>

  public var indices: CountableRange<Int> {
    return startIndex..<endIndex
  }

}
