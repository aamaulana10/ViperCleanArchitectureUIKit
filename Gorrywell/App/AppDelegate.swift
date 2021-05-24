//
//  AppDelegate.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var mainNavigationController: UINavigationController?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool {
    
//    let mainTabbar = MainTabBarController()
    
    if let loginVc = StoryboardHelper.instantiateVC(.authStoryboard, "LoginViewController") as? LoginViewController {
      
      let useCase = AuthInjection.init().provideAuth()
      
      let presenter = LoginPresenter(authUseCase: useCase)
      
      loginVc.presenter = presenter
      
      mainNavigationController = UINavigationController(rootViewController: loginVc)
      mainNavigationController?.isNavigationBarHidden = true
    }
    
//    mainNavigationController = UINavigationController(rootViewController: mainTabbar)
//    mainNavigationController?.isNavigationBarHidden = true
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.makeKeyAndVisible()
    self.window?.rootViewController = mainNavigationController
    
    return true
  }
}
