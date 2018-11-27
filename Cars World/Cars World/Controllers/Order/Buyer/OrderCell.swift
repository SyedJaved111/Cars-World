//
//  OrderCell.swift
//  Cars World
//
//  Created by Apple on 27/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

protocol OrderDelegate {
    func eyeTapped(cell:OrderCell)
}

class OrderCell: UITableViewCell {
    
    @IBOutlet weak var txtCarName:UILabel!
    @IBOutlet weak var txtCarPriceName:UILabel!
    @IBOutlet weak var txtQuantity:UILabel!
    @IBOutlet weak var txtModel:UILabel!
    @IBOutlet weak var txtBrand:UILabel!
    @IBOutlet weak var txtCondition:UILabel!
    @IBOutlet weak var txtStatus:UILabel!
    @IBOutlet weak var carImage:UIImageView!
    var delegate:OrderDelegate?
    
    @IBAction func eyeClicked(_ sender:UIButton){
        
    }
}
