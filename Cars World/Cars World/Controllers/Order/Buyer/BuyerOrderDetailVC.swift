//
//  BuyerOrderDetailVC.swift
//  Cars World
//
//  Created by Apple on 27/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class BuyerOrderDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        addBackButton()
        self.title = "Orders"
    }
}

extension BuyerOrderDetailVC: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BuyerOrderDetailCell")  as! BuyerOrderDetailCell
        return cell
    }
}
