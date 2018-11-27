//
//  BuyerShippedOrdersVC.swift
//  Cars World
//
//  Created by Apple on 27/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class BuyerShippedOrdersVC: UIViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "Shipped")
    }
}

extension BuyerShippedOrdersVC: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell")  as! OrderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BuyerOrderDetailVC") as! BuyerOrderDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
