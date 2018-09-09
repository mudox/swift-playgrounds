//
//  ViewController.swift
//  Rx
//
//  Created by Mudox on 22/02/2018.
//  Copyright © 2018 Mudox. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

  var disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    self
      .alert(title: "Test", text: "UIViewController.alert as RxSwift.Completable")
      .asObservable()
      .take(3.0, scheduler: MainScheduler.instance)
      .subscribe(
        onDisposed: {
          print("alert view disposed")
        }
      )
      .disposed(by: disposeBag)
  }

}

extension UIViewController {

  func alert(title: String, text: String?) -> Completable {

    return Completable.create { [weak self] completable in
      let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
      let closeButton = UIAlertAction(title: "Close", style: .default) { _ in completable(.completed) }
      alertVC.addAction(closeButton)

      DispatchQueue.main.async {
        self?.present(alertVC, animated: true, completion: nil)
      }

      return Disposables.create {
        // In case for disposition not initiated by user input
        // E.g. timer triggered automatic disposition
        self?.dismiss(animated: true, completion: nil)
      }
    } // Completable.create

  }

}
