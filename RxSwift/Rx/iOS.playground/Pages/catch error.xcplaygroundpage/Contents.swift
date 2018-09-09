//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var disposeBag = DisposeBag()

let sb1 = PublishSubject<Int>()
let sb2 = PublishSubject<Int>()


let os = Observable.catchError([sb1, sb2])

os
  .subscribe(
    onNext: {
      print($0)
    },
    onCompleted: {
      print("completed")
    },
    onDisposed: {
      print("bye")
    }
  )
  .disposed(by: disposeBag)

sb2.onNext(2)

sb1.onNext(1)
sb1.onNext(1983)
sb1.onError(RxError.unknown)
sb1.onNext(2018)

sb2.onNext(4)

//  .asObservable()
//  .subscribe(
//    onNext: { value in
//      print(value)
//    }
//  )
//  .disposed(by: disposeBag)

