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
    
    let mainStoryboard = UIStoryboard(name: "Home", bundle: nil)
    
    if let vc = mainStoryboard.instantiateViewController(
        withIdentifier: "HomeViewController") as? HomeViewController {
      
      let useCase = HomeInjection.init().provideHome()
      
      let presenter = HomePresenter(homeUseCase: useCase)
      
      vc.presenter = presenter
      
      mainNavigationController = UINavigationController(rootViewController: vc)
      mainNavigationController?.isNavigationBarHidden = true
    }
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.makeKeyAndVisible()
    self.window?.rootViewController = mainNavigationController
    
    return true
  }
}
