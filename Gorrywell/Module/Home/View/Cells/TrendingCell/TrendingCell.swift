//
//  TrendingCell.swift
//  Gorrywell
//
//  Created by aamaulana10 on 30/03/21.
//

import UIKit
import SDWebImage

class TrendingCell: UICollectionViewCell {

  @IBOutlet weak var trendingImage: UIImageView!
  
  func setupCell(trending: TrendingModel) {
    
    if let url = URL(string: trending.urls.regular) {
      
      self.trendingImage.sd_setImage(with: url, placeholderImage:
                                      UIImage(named: "GW_splash_screen.png"))

    }
  }

}
