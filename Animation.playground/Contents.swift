//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController: UIViewController {

  var box: UIView!
  var boxLayer: CALayer!

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .white
    self.view = view

    let w = 200
    let x = 90

    box = UIView()
    box.frame = CGRect(x: x, y: 200, width: w, height: w)
    box.backgroundColor = .blue
    view.addSubview(box)

    boxLayer = CALayer()
    box.layer.addSublayer(boxLayer)
    boxLayer.bounds = box.layer.bounds.insetBy(dx: 50, dy: 50)
    boxLayer.position = CGPoint(x: box.layer.bounds.midX, y: box.layer.bounds.midY)
    boxLayer.backgroundColor = UIColor.red.cgColor

    let b = UIButton(type: .custom)
    b.frame = CGRect(x: x, y: 20, width: w, height: 30)
    b.layer.borderColor = UIColor.blue.cgColor
    b.layer.borderWidth = 1
    b.layer.cornerRadius = 3
    b.setTitle("Play", for: .normal)
    b.setTitleColor(.blue, for: .normal)
    b.addTarget(self, action: #selector(play), for: .touchUpInside)
    view.addSubview(b)

    addLine(y: 150)
    addLine(y: 200)
    addLine(y: 300)
  }

  func addLine(y: CGFloat) {
    let v = UIView()
    v.frame = CGRect(x: 0, y: y, width: 800, height: 1)
    v.backgroundColor = .blue
    view.addSubview(v)
  }

  @objc func play() {
//    let anim = CABasicAnimation(keyPath: "position.y")
//    anim.duration = 3
//    anim.beginTime = CACurrentMediaTime() + 1
//    anim.fromValue = 150
//    anim.toValue = 500
//    anim.isRemovedOnCompletion = false
//    anim.fillMode = kCAFillModeBoth
//    box.layer.add(anim, forKey: "play")
    CATransaction.begin()
    CATransaction.setAnimationDuration(1)
    let flag = boxLayer.bounds.width == box.bounds.width
    let delta: CGFloat = flag ? 50 : -50
    let color = !flag ? UIColor.green.cgColor : UIColor.red.cgColor
    boxLayer.bounds = boxLayer.bounds.insetBy(dx: delta, dy: delta)
    boxLayer.backgroundColor = color
    CATransaction.commit()
  }

}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
