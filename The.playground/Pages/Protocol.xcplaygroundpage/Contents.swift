import Foundation
import UIKit
import PlaygroundSupport

protocol A {
  associatedtype Item
  func foo() -> Item
}

play("protocol associated type can be inferred from other requirement implementation") {

  struct AA: A {
    // no need to alias explicitly `Int` to `Item`
    func foo() -> Int {
      return 1
    }
  }

  _ = AA()
}
