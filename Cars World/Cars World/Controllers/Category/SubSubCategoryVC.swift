//
//  CategoryVC.swift
//  Cars World
//
//  Created by Apple on 20/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class SubSubCategoryVC: BaseController{
    
    @IBOutlet var groupCollectionView: UICollectionView!{
        didSet{
            self.groupCollectionView.delegate = self
            self.groupCollectionView.dataSource = self
            self.groupCollectionView.alwaysBounceVertical = true
            self.groupCollectionView.addSubview(refreshControl)
        }
    }
    
    var subSubCategoryList = ["Chevrolet Corvette","BMW G15 8 Series","Mercedes S-Class","Chervolet Corvette"]

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(refreshTableView),for: UIControlEvents.valueChanged)
        refreshControl.tintColor = #colorLiteral(red: 0.1183428243, green: 0.7272036672, blue: 0.3827357888, alpha: 1)
        return refreshControl
    }()
    
    fileprivate var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 20.0, left: 10.0, bottom: 30.0, right: 10.0)
    }
    
    fileprivate var itemsPerRow: CGFloat {
        return 2
    }
    
    fileprivate var interitemSpace: CGFloat {
        return 5.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sport Cars"
        setNavigationBar()
        addBackButton()
        groupCollectionView.adjustDesign(width: ((view.frame.size.width+20)/2.3))
    }
    
    fileprivate func setupDelegates(){
        self.groupCollectionView.emptyDataSetSource = self
        self.groupCollectionView.emptyDataSetDelegate = self
        self.groupCollectionView.reloadData()
    }
    
    @objc func refreshTableView() {
        
    }
}

extension SubSubCategoryVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subSubCategoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubSubCategoryCell", for: indexPath) as! SubSubCategoryCell
        cell.lblItemName.text = subSubCategoryList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
        let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 228)
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!){
        
    }
}
