
import Foundation
import XLPagerTabStrip
import SocketIO

class OrderVC: ButtonBarPagerTabStripViewController {
    
    @IBOutlet var collectionViewPager: ButtonBarView!
   
    override func viewDidLoad(){
        settings.style.buttonBarBackgroundColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        
        settings.style.buttonBarItemFont = UIFont(name: "Raleway-Regular", size: 15)!
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarMinimumLineSpacing = 0.6
        settings.style.buttonBarItemTitleColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        settings.style.selectedBarBackgroundColor = #colorLiteral(red: 0.2783434391, green: 0.5138511062, blue: 0.2375174463, alpha: 1)
        settings.style.buttonBarBackgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1);
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
            newCell?.label.textColor = #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
        }
        
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.addBackButton()
        self.setNavigationBar()
        self.title = "Orders"
    }
   
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
//        let child_1 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "BuyerAllOrdersVC") as! BuyerAllOrdersVC
//        let child_2 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "BuyerPendingOrdersVC") as! BuyerPendingOrdersVC
//        let child_3 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "BuyerShippedOrdersVC") as! BuyerShippedOrdersVC
//        let child_4 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "BuyerDeliveredOrdersVC") as! BuyerDeliveredOrdersVC
        
        let child_1 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SellerAllOrderVC") as! SellerAllOrderVC
        let child_2 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SellerPendingOrderVC") as! SellerPendingOrderVC
        let child_3 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SellerShippedOrderVC") as! SellerShippedOrderVC
        let child_4 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SellerDeliveredOrderVC") as! SellerDeliveredOrderVC
        return [child_1,child_2,child_3,child_4]
    }
}

