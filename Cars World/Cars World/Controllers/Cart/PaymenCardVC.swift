//
//  PaymenCardVC.swift
//  Cars World
//
//  Created by Apple on 26/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class PaymenCardVC: UIViewController {
    
    @IBOutlet weak var checkBox:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func OnClickCheckBox(_ sender: Any) {
        if(self.checkBox.image == #imageLiteral(resourceName: "Check-Active")){
            self.checkBox.image = #imageLiteral(resourceName: "Check")
        }else{
            self.checkBox.image = #imageLiteral(resourceName: "Check-Active")
        }
    }
}
