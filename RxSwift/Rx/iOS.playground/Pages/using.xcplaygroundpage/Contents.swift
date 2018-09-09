import Foundation
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Trash: Disposable {
  init() {
    print("Subscribed")
  }
  func dispose() {
    print("Disposed")
  }
}

let seq = Observable<Int>.using(
  { return Trash() },
  observableFactory: { res -> Observable<Int> in
    return Observable<Int>
      .interval(1, scheduler: MainScheduler.instance)
      .take(3)
    .debug()
  }
)

_ = seq.subscribe { print($0) }
