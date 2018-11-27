//
//  SellerStoreInfoVC.swift
//  Cars World
//
//  Created by Apple on 27/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SellerStoreInfoVC: UIViewController,IndicatorInfoProvider {

    @IBOutlet weak var storeInfoHeaderView: UIView!
    var itemInfo = IndicatorInfo(title: "Store Info")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeInfoHeaderView.layer.borderWidth = 1
        storeInfoHeaderView.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.8784313725, blue: 0.8823529412, alpha: 1)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
