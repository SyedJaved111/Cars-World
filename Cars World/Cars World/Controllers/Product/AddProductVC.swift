//
//  AddProductVC.swift
//  Cars World
//
//  Created by Apple on 27/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import DLRadioButton

class AddProductVC: UIViewController {

    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtSubCategory: UITextField!
    @IBOutlet weak var txtProductName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtBrand: UITextField!
    @IBOutlet weak var txtModel: UITextField!
    @IBOutlet weak var txtMilage: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var newBtn: DLRadioButton!
    @IBOutlet weak var usedBtn: DLRadioButton!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var txtComment: UICustomTextView!
    @IBOutlet weak var productCollectionHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        addBackButton()
        setCollectionViewHeight()
        self.title = "Add Product"
        txtComment.layer.borderWidth = 1
        txtComment.layer.borderColor = #colorLiteral(red: 0.925272584, green: 0.9294125438, blue: 0.9334286451, alpha: 1)
    }
    
    private func setCollectionViewHeight(){
        productCollectionHeight.constant = productCollectionView.collectionViewLayout.collectionViewContentSize.height + 10
        self.productCollectionView.setNeedsDisplay()
    }
    
    @IBAction func submitProduct(_ sender: UIButtonMain){
        
    }
}

extension AddProductVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
