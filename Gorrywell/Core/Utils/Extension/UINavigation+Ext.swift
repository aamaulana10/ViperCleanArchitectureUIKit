//
//  UINavigation+Ext.swift
//  Gorrywell
//
//  Created by aamaulana10 on 07/04/21.
//

import Foundation
import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    
    interactivePopGestureRecognizer?.delegate = self
  }
  
  public func gestureRecognizerShouldBegin(
    _ gestureRecognizer: UIGestureRecognizer)
  -> Bool {
    
    return viewControllers.count > 1
  }
}
