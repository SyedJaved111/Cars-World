//
//  SellerDeliveredOrderVC.swift
//  Cars World
//
//  Created by Apple on 27/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SellerDeliveredOrderVC: UIViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "Delivered")
    }
}

extension SellerDeliveredOrderVC: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SellerOrderCell")  as! SellerOrderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SellerOrderDetailVC") as! SellerOrderDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

