//
//  HomeViewController.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var trendingCollection: UICollectionView!
  @IBOutlet weak var trendingCategoryCollection: UICollectionView!
  @IBOutlet weak var gmCategory: UIView!
  @IBOutlet weak var martCategory: UIView!
  @IBOutlet weak var consultationCategory: UIView!
  @IBOutlet weak var promotionCategory: UIView!
  
  var screenSize = UIScreen.main.bounds
  
  var presenter: HomePresenter? {
    
    didSet {
      
      if let p = presenter {
        
        p.presenter = self
        p.getTrending()
      }
    }
  }
  
  var trending = [TrendingModel]()
  var category = ["All", "Event", "Media"]
  var selectedCategory = "All"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    trendingCollection.delegate = self
    trendingCollection.dataSource = self
    trendingCategoryCollection.delegate = self
    trendingCategoryCollection.dataSource = self
    
    trendingCollection.register(UINib.init(
                                  nibName: "TrendingCell", bundle: nil),
                                forCellWithReuseIdentifier: "TrendingCell")
    
    trendingCategoryCollection.register(UINib.init(
                                          nibName: "TCategoryCell", bundle: nil),
                                        forCellWithReuseIdentifier: "TCategoryCell")
    
    hideKeyboardWhenTappedAround()
  }
  
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if collectionView == trendingCollection {
      
      return trending.count
      
    } else if collectionView == trendingCategoryCollection {
      
      return category.count
    }
    
    return trending.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if collectionView == trendingCollection {
      
      if let trendingCell = collectionView.dequeueReusableCell(
          withReuseIdentifier: "TrendingCell", for: indexPath)
          as? TrendingCell {
        
        trendingCell.setupCell(trending: trending[indexPath.row])
        
        return trendingCell
      }
    } else if collectionView == trendingCategoryCollection {
      
      if let cell = collectionView.dequeueReusableCell(
          withReuseIdentifier: "TCategoryCell", for: indexPath)
          as? TCategoryCell {
        
        cell.setupCell(categoryData: category[indexPath.row])
        
        if selectedCategory == category[indexPath.row] {
          
          cell.container.backgroundColor = UIColor.trendingSelected
          cell.container.layer.borderWidth = 0.0
          
        } else {
          
          cell.container.backgroundColor = .white
          cell.container.layer.borderWidth = 0.1
        }
        
        cell.container.layer.cornerRadius = 10
                
        return cell
      }
    }
    
    return UICollectionViewCell()
    
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if collectionView == trendingCollection {
      
      if indexPath.row == 0 {
        
        return CGSize(width: screenSize.width, height: screenSize.height / 3)
      }
      
    } else if collectionView == trendingCategoryCollection {
      
      return CGSize(width: 100, height: 40)
    }
    
    return CGSize(width: screenSize.width / 3 - 1, height: screenSize.height / 8)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    if collectionView == trendingCollection {
            
    } else if collectionView == trendingCategoryCollection {
      
      selectedCategory = category[indexPath.row]
      
      DispatchQueue.main.async {
        
        self.trendingCategoryCollection.reloadData()
      }
    }
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
    if collectionView == trendingCategoryCollection {
      
      return 5.0
    }
    
    return 1.0
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
    if collectionView == trendingCategoryCollection {
      
      return 5.0
    }
    
    return 1.0
  }
  
}

extension HomeViewController: HomePresenterProtocol {
  
  func getTrending(trending: [TrendingModel]) {
    
    self.trending = trending
    
//    self.trending.removeFirst()
    
    DispatchQueue.main.async {
      
      self.trendingCollection.reloadData()
    }
  }
}
