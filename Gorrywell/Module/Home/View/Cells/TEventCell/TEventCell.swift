//
//  TEventCell.swift
//  Gorrywell
//
//  Created by aamaulana10 on 06/04/21.
//

import UIKit

class TEventCell: UICollectionViewCell {

  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var profileName: UILabel!
  @IBOutlet weak var postingDate: UILabel!
  @IBOutlet weak var eventImage: UIImageView!
  @IBOutlet weak var eventCContainer: UIView!
  @IBOutlet weak var eventCategory: UILabel!
  @IBOutlet weak var eventTitle: UILabel!
  @IBOutlet weak var eventTime: UILabel!
  @IBOutlet weak var eventPrice: UILabel!
  @IBOutlet weak var likeImage: UIImageView!
  @IBOutlet weak var likeCount: UILabel!
  @IBOutlet weak var commentImage: UIImageView!
  @IBOutlet weak var commentCount: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    eventImage.layer.cornerRadius = 10
    eventCContainer.layer.cornerRadius = 10
    }

}
