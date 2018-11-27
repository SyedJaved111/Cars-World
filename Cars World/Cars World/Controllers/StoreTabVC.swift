//
//  StoreTabVC.swift
//  Cars World
//
//  Created by Apple on 23/11/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class StoreTabVC: BaseButtonBarPagerTabStripViewController<StoreTabCell> {

    @IBOutlet var collectionViewPager: ButtonBarView!
    var storeName = ""
   
    override func viewDidLoad() {
        settings.style.buttonBarBackgroundColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        
        settings.style.buttonBarItemFont = UIFont(name: "Raleway-Regular", size: 15)!
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = -1
        settings.style.buttonBarItemTitleColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        settings.style.selectedBarBackgroundColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        settings.style.buttonBarBackgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1);
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: StoreTabCell?, newCell: StoreTabCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.iconImage.tintColor = #colorLiteral(red: 0.3528747559, green: 0.3528174758, blue: 0.3610559404, alpha: 1)
            oldCell?.iconLabel.textColor = #colorLiteral(red: 0.3528747559, green: 0.3528174758, blue: 0.3610559404, alpha: 1)
            newCell?.iconImage.tintColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
            newCell?.iconLabel.textColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        }
        super.viewDidLoad()
        setNavigationBar()
        addBackButton()
        self.title = storeName
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: "StoreTabView", bundle: Bundle(for: StoreTabCell.self), width: { _ in
            return 70.0
        })
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
//        let child_1 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "StoreInfoVC") as!  StoreInfoVC
//        child_1.itemInfo = IndicatorInfo(title: "Store Info", image: UIImage(named: "Info"))
//
//        let child_2 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "StoreProductVC") as! StoreProductVC
//        child_2.itemInfo = IndicatorInfo(title: "Products", image: UIImage(named: "Product-green"))
        
        let child_1 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SellerStoreInfoVC") as!  SellerStoreInfoVC
        child_1.itemInfo = IndicatorInfo(title: "Store Info", image: UIImage(named: "Info"))
        
        let child_2 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SellerStoreProductVC") as! SellerStoreProductVC
        child_2.itemInfo = IndicatorInfo(title: "Products", image: UIImage(named: "Product-green"))
        
        return [child_1, child_2]
    }
    
    override func configure(cell: StoreTabCell, for indicatorInfo: IndicatorInfo) {
        cell.iconImage.image = indicatorInfo.image?.withRenderingMode(.alwaysTemplate)
        cell.iconLabel.text = indicatorInfo.title?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
        if indexWasChanged && toIndex > -1 && toIndex < viewControllers.count {
            let child = viewControllers[toIndex] as! IndicatorInfoProvider // swiftlint:disable:this force_cast
            UIView.performWithoutAnimation({ [weak self] () -> Void in
                guard let me = self else { return }
                me.navigationItem.leftBarButtonItem?.title =  child.indicatorInfo(for: me).title
            })
        }
    }
}
