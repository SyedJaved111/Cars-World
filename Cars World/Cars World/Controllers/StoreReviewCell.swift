//
//  StoreReviewCell.swift
//  Cars World
//
//  Created by Apple on 23/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Cosmos

class StoreReviewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userComment: UILabel!
    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var reviewRating: CosmosView!
    @IBOutlet weak var reviewRatingCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
