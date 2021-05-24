//
//  TVideoCell.swift
//  Gorrywell
//
//  Created by aamaulana10 on 06/04/21.
//

import UIKit

class TVideoCell: UICollectionViewCell {
  
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var profileName: UILabel!
  @IBOutlet weak var postingDate: UILabel!
  @IBOutlet weak var postingImage: UIImageView!
  @IBOutlet weak var playContainer: UIView!
  @IBOutlet weak var postingCContainer: UIView!
  @IBOutlet weak var postingCategory: UILabel!
  @IBOutlet weak var postingTitle: UILabel!
  @IBOutlet weak var likeImage: UIImageView!
  @IBOutlet weak var likeCount: UILabel!
  @IBOutlet weak var commentImage: UIImageView!
  @IBOutlet weak var commentCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
      postingImage.layer.cornerRadius = 10
      postingCContainer.layer.cornerRadius = 10
      playContainer.layer.cornerRadius = playContainer.layer.bounds.height / 2
    }

}
