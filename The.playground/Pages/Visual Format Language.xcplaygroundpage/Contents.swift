import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
page.needsIndefiniteExecution = true

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
containerView.backgroundColor = .white
page.liveView = containerView

let box1 = UIView()
let constraints = NSLayoutContraints.constraints()
