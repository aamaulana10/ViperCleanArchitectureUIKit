//
//  CustomTabbar.swift
//  Gorrywell
//
//  Created by aamaulana10 on 06/04/21.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
  
  var trending: UINavigationController!
  var interest: UINavigationController!
  var posting: UINavigationController!
  var myActivity: UINavigationController!
  var myProfile: UINavigationController!
  
  var centerButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupTabbarAppearance()
    
    setupViewController()
    
    setupTabbarItem()
    
    self.delegate = self
  }

  func riseCenterButtonSetup() {
    
    centerButton.setImage(UIImage(named: "posting"), for: .normal)
    centerButton.sizeToFit()
    centerButton.isUserInteractionEnabled = true
    centerButton.layer.masksToBounds = true
    centerButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 5)
    
    tabBar.addSubview(centerButton)
    self.view.layoutIfNeeded()
  }
  
  func setupViewController() {
    
    if let trendingVC = StoryboardHelper.instantiateVC(.mainStoryboard, "HomeViewController") as? HomeViewController {
      
      let useCase = HomeInjection.init().provideHome()
      
      let presenter = HomePresenter(homeUseCase: useCase)
      
      trendingVC.presenter = presenter
      
      trending = UINavigationController(rootViewController: trendingVC)
      trending.isNavigationBarHidden = true
    }
    
    if let interestVC = StoryboardHelper.instantiateVC(
        .interestStoryboard, "InterestViewController")
        as? InterestViewController {
      
      interest = UINavigationController(rootViewController: interestVC)
    }
    
    if let postingVC = StoryboardHelper.instantiateVC(
        .interestStoryboard, "InterestViewController")
        as? InterestViewController {
      
      posting = UINavigationController(rootViewController: postingVC)
    }
    
    if let activityVC = StoryboardHelper.instantiateVC(
        .interestStoryboard, "InterestViewController")
        as? InterestViewController {
      
      myActivity = UINavigationController(rootViewController: activityVC)
    }
    
    if let profileVC = StoryboardHelper.instantiateVC(
        .interestStoryboard, "InterestViewController")
        as? InterestViewController {
      
      myProfile = UINavigationController(rootViewController: profileVC)
    }
    
    viewControllers = [trending, interest, posting, myActivity, myProfile]
  }
  
  func setupTabbarItem() {
    
    let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)]
    tabBar.items?[0].image = UIImage(named: "trending")?
      .withRenderingMode(.automatic)
    tabBar.items?[0].title = "Home"
    tabBar.items?[0].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
    tabBar.items?[0].setTitleTextAttributes(attributes, for: .normal)
    
    tabBar.items?[1].image = UIImage(named: "interest")?
      .withRenderingMode(.alwaysTemplate)
    tabBar.items?[1].title = "Interest"
    tabBar.items?[1].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
    tabBar.items?[1].setTitleTextAttributes(attributes, for: .normal)
 
    tabBar.items?[2].image = UIImage(named: "posting")?
      .withRenderingMode(.alwaysOriginal)
    tabBar.items?[2].title = ""
    tabBar.items?[2].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
    
    tabBar.items?[3].image = UIImage(named: "myActivity")?
      .withRenderingMode(.alwaysTemplate)
    tabBar.items?[3].title = "My Activity"
    tabBar.items?[3].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
    tabBar.items?[3].setTitleTextAttributes(attributes, for: .normal)
    
    tabBar.items?[4].image = UIImage(named: "myProfile")?
      .withRenderingMode(.alwaysTemplate)
    tabBar.items?[4].title = "My Profile"
    tabBar.items?[4].titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
    tabBar.items?[4].setTitleTextAttributes(attributes, for: .normal)
    
    setupTabbarInsets()
    
    trending.tabBarItem   =  tabBar.items?[0]
    interest.tabBarItem   =  tabBar.items?[1]
    posting.tabBarItem    =  tabBar.items?[2]
    myActivity.tabBarItem =  tabBar.items?[3]
    myProfile.tabBarItem  =  tabBar.items?[4]

    self.tabBar.isTranslucent = false
  }
  
  func setupTabbarInsets() {
    
    self.tabBar.items?[0].imageInsets = UIEdgeInsets( top: -3, left: 0,
                                                       bottom: 3, right: 0)
    self.tabBar.items?[1].imageInsets = UIEdgeInsets( top: -3, left: 0,
                                                       bottom: 3, right: 0)
    self.tabBar.items?[2].imageInsets = UIEdgeInsets( top: 0, left: 0,
                                                       bottom: 0, right: 0)
    self.tabBar.items?[3].imageInsets = UIEdgeInsets( top: -3, left: 0,
                                                       bottom: 3, right: 0)
    self.tabBar.items?[4].imageInsets = UIEdgeInsets( top: -3, left: 0,
                                                       bottom: 3, right: 0)
  }
    
  func setupTabbarAppearance() {
    
    if #available(iOS 13.0, *) {
        let appearance = tabBar.standardAppearance
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundEffect = nil
        appearance.backgroundColor = .white
        tabBar.standardAppearance = appearance
    } else {
        let image = UIImage()
        tabBar.shadowImage = image
        tabBar.backgroundImage = image
        tabBar.backgroundColor = .white
        
    }
    
    tabBar.tintColor = .tabSelected
    tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
    tabBar.layer.shadowRadius = 2
    tabBar.layer.shadowColor = UIColor.black.cgColor
    tabBar.layer.shadowOpacity = 0.3
  }
}
