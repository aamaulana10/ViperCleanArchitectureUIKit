//
//  UIView+Ext.swift
//  Gorrywell
//
//  Created by aamaulana10 on 01/04/21.
//

import Foundation
import UIKit

extension UIViewController {
  
  func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}
