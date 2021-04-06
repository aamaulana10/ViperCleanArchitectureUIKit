//
//  TCategoryCell.swift
//  Gorrywell
//
//  Created by aamaulana10 on 01/04/21.
//

import UIKit

class TCategoryCell: UICollectionViewCell {

  @IBOutlet weak var container: UIView!
  @IBOutlet weak var category: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        
    }
  
  func setupCell(categoryData: String) {
    
    category.text = categoryData
  }

}
