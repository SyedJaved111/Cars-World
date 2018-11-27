//
//  File.swift
//  Cars World
//
//  Created by Apple on 23/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

class StoreTabCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.8784313725, blue: 0.8823529412, alpha: 1)
    }
}
