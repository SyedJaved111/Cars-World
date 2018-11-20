//
//  SubSubCategoryCell.swift
//  Cars World
//
//  Created by Apple on 20/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class SubSubCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var imageName:UIImageView!
    @IBOutlet weak var lblCompanyName:UILabel!
    @IBOutlet weak var lblItemName:UILabel!
    @IBOutlet weak var lblPrice:UILabel!
    
    override func awakeFromNib() {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.8784313725, blue: 0.8823529412, alpha: 1)
        let boldText  = "$95000"
        
        let attrs = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.1183428243, green: 0.7272036672, blue: 0.3827357888, alpha: 1),
                     NSAttributedStringKey.font : UIFont(name: "OpenSans-Semibold", size: 12)!] as [NSAttributedStringKey : Any]
        
        let normalText = "Price: "
        let attributedString = NSMutableAttributedString(string:normalText)
        attributedString.append((NSMutableAttributedString(string:boldText, attributes:attrs)))
        lblPrice.attributedText = attributedString
    }
}
