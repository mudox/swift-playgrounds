//: [Previous](@previous)

import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
view.backgroundColor = .white

let button = UIButton(type: .system)
button.setTitle("Tap", for: .normal)
button.sizeToFit()
view.addSubview(button)
button.translatesAutoresizingMaskIntoConstraints = false
button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

let start = Date()
var index = 0
button.rx.tap
  .take(3, scheduler: MainScheduler.instance)
  .subscribe(
    onNext: {
      let time = Date().timeIntervalSince(start)
      index += 1
      print("\(time) - #\(index)")
    },
    onError: { error in
      print(error)
    },
    onCompleted: {
      print("Completed")
    },
    onDisposed: {
      print("Disposed")
    }
  )

PlaygroundPage.current.liveView = view
