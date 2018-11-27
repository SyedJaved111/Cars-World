//
//  CartVC.swift
//  Cars World
//
//  Created by Apple on 26/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class CartVC: UIViewController {
    
    @IBOutlet weak var tableheightconstraint: NSLayoutConstraint!
    @IBOutlet weak var myTbleView: UITableView!{
        didSet{
            myTbleView.delegate = self
            myTbleView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        setNavigationBar()
        addBackButton()
        setViewHeight()
    }
    
    private func setViewHeight(){
        var tableViewHeight:CGFloat = 0;
        for i in 0..<self.myTbleView.numberOfRows(inSection: 0){
            tableViewHeight = tableViewHeight + tableView(self.myTbleView, heightForRowAt: IndexPath(row: i, section: 0))
        }
        tableheightconstraint.constant = tableViewHeight
        self.myTbleView.setNeedsDisplay()
    }
    
    @IBAction func addToCart(_ sender:UIButtonMain){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartFormVC") as! CartFormVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CartVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartFormVC") as! CartFormVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


