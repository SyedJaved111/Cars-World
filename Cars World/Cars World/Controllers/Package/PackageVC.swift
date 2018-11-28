//
//  PackageVC.swift
//  Cars World
//
//  Created by Apple on 28/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class PackageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        addBackButton()
        self.title = "Featured Packages"
    }
}

extension PackageVC: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PackageCell")  as! PackageCell
        return cell
    }
}
