//
//  Loading.swift
//  Gorrywell
//
//  Created by aamaulana10 on 08/04/21.
//

import Foundation
import Lottie
import UIKit

public class Loading {
  
  static let loadingInstance = Loading()
  
  public func showLoading(sender: UIViewController,
                          asset: String,
                          speed: CGFloat,
                          play: Bool) {
    
    let screenSize = sender.view.frame
    
    var animationView: AnimationView?
    animationView = .init(name: asset)
    animationView?.frame = CGRect(x: (screenSize.width / 2) - 50,
                                  y: (screenSize.height / 2) - 50,
                                  width: screenSize.width / 4,
                                  height: screenSize.width / 4)
    animationView?.contentMode = .scaleAspectFit
    animationView?.loopMode = .loop
    animationView?.animationSpeed = speed
    sender.view.addSubview(animationView!)
    
    if play == true {
      
      animationView?.play()
      
    } else {
      
      animationView?.stop()
      
      animationView?.isHidden = true
      
    }
  }
}
