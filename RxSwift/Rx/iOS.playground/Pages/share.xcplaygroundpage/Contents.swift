//: [Previous](@previous)

import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let seq = Observable.just(1)
  .do(
    onNext: { _ in
      print("do #1")
    }
  )
  .share(replay: 1, scope: .forever)
  .do(
    onNext: { _ in
      print("do #2")
    }
  )

_ = seq.subscribe(
  onNext: { _ in
    print("subscriber #1")
  }
)

_ = seq.subscribe(
  onNext: { _ in
    print("subscriber #2")
  }
)

