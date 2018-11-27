//
//  StoreInfoVC.swift
//  Cars World
//
//  Created by Apple on 23/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class StoreInfoVC: UIViewController,IndicatorInfoProvider{
    
    @IBOutlet weak var storeInfoHeaderView: UIView!
    @IBOutlet weak var commentView: UICustomTextView!
    @IBOutlet weak var tableViewReviews: UITableView!
    @IBOutlet weak var storeTableViewHeight: NSLayoutConstraint!
    var itemInfo = IndicatorInfo(title: "Store Info")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeInfoHeaderView.layer.borderWidth = 1
        storeInfoHeaderView.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.8784313725, blue: 0.8823529412, alpha: 1)
        commentView.layer.borderWidth = 1
        commentView.layer.borderColor = #colorLiteral(red: 0.8745098039, green: 0.8784313725, blue: 0.8823529412, alpha: 1)
        tableViewReviews.reloadData()
        setViewHeight()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    private func setViewHeight(){
        var tableViewHeight:CGFloat = 0
        for i in 0..<self.tableViewReviews.numberOfRows(inSection: 0){
            tableViewHeight = tableViewHeight + tableView(self.tableViewReviews, heightForRowAt: IndexPath(row: i, section: 0))
        }
        storeTableViewHeight.constant = tableViewHeight + 20
        self.tableViewReviews.setNeedsDisplay()
    }
}

extension StoreInfoVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "StoreReviewCell", for: indexPath) as! StoreReviewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
