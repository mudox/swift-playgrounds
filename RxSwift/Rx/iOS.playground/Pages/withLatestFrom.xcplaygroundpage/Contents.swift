//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import RxSwift

PlaygroundPage.current.needsIndefiniteExecution = true

let seq1 = Observable<Int>.interval(2, scheduler: MainScheduler.instance)
let seq2 = Observable<Int>.interval(0.5, scheduler: MainScheduler.instance).map { $0 * 10 }.delay(0.5, scheduler: MainScheduler.instance)

_ = seq1.withLatestFrom(seq2) { "\($0) - \($1)" }
  .subscribe(
    onNext: { value in
      print(value)
    }
  )
