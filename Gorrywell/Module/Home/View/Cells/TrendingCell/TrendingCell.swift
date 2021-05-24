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
  @IBOutlet weak var trendingType: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    trendingImage.clipsToBounds = true
    trendingImage.layer.cornerRadius = 10
  }
  
  func setupCell(trending: TrendingModel) {
    
    if let url = URL(string: trending.urls.regular) {
      
      self.trendingImage.sd_setImage(with: url, completed: nil)

    }
  }

}
