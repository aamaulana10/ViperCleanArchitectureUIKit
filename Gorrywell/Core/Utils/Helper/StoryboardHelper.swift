//
//  Storyboard+Ext.swift
//  Gorrywell
//
//  Created by aamaulana10 on 06/04/21.
//

import Foundation
import UIKit

class StoryboardHelper {
  
  static func instantiateVC(_ storyboard: UIStoryboard, _ id: String) -> UIViewController? {
    if #available(iOS 13.0, *) {
      
      return storyboard.instantiateViewController(identifier: id)
    } else {
      return storyboard.instantiateViewController(withIdentifier: id)
    }
  }
}
