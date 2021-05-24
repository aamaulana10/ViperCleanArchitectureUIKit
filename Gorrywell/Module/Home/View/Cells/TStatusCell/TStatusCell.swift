//
//  TStatusCell.swift
//  Gorrywell
//
//  Created by aamaulana10 on 06/04/21.
//

import UIKit

class TStatusCell: UICollectionViewCell {

  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var profileName: UILabel!
  @IBOutlet weak var postingDate: UILabel!
  @IBOutlet weak var postingContent: UILabel!
  @IBOutlet weak var likeImage: UIImageView!
  @IBOutlet weak var likeCount: UILabel!
  @IBOutlet weak var commentImage: UIImageView!
  @IBOutlet weak var commentCount: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
