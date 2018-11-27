//
//  StoresVC.swift
//  Cars World
//
//  Created by Apple on 20/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class StoreVC: BaseController{
    
    @IBOutlet var groupCollectionView: UICollectionView!{
        didSet{
            self.groupCollectionView.delegate = self
            self.groupCollectionView.dataSource = self
            self.groupCollectionView.alwaysBounceVertical = true
            self.groupCollectionView.addSubview(refreshControl)
        }
    }
    
    var storeList = ["Seef Store","Bond Store","Tester","Auto Parts","Seef Store","Bond Store"]
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
        self.title = "Car World Stores"
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

extension StoreVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCell
        cell.lblStoreName.text = storeList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
        let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StoreTabVC") as! StoreTabVC
        vc.storeName = storeList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!){
        
    }
}

