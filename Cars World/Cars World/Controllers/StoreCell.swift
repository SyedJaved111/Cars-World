//
//  StoreCell.swift
//  Cars World
//
//  Created by Apple on 23/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import Cosmos

class StoreCell: UICollectionViewCell {
    
    @IBOutlet weak var lblStoreAddress: UILabel!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var storeImage: UIImageView!
    
    override func awakeFromNib() {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.8784313725, blue: 0.8823529412, alpha: 1)
    }
}
