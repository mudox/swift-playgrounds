import Foundation

protocol Queue {

  associatedtype Element

  mutating func enqueue(_ element: Element)

  mutating func dequeue() -> Element?

}

/// An efficient variable-size FIFO queue of elements of type `Element`
public struct FIFOQueue<Element>: Queue {

  var left: [Element] = []
  var right: [Element] = []

  /// Add an element to the back of the queue.
  /// - Complexity: O(1).
  public mutating func enqueue(_ newElement: Element) {
    right.append(newElement)
  }

  /// Removes front of the queue.
  /// Returns `nil` in case of an empty queue.
  /// - Complexity: Amortized O(1).
  public mutating func dequeue() -> Element? {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    return left.popLast()
  }

}


