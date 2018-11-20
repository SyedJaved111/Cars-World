
import UIKit
import SocketIO
import SwiftyJSON
import MIBadgeButton_Swift
var cartCount = ""

class HomeTabsVC: UITabBarController {
    
    var Notificationbtn: MIBadgeButton?
    var Cartbtn: MIBadgeButton?
    var Count = ""
    var manager:SocketManager!
    var socket:SocketIOClient!
    let lang = UserDefaults.standard.string(forKey: "i18n_language")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.title = "Cars World"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.rightBarButton()
    }

    @objc func btnCardClick (_ sender: Any){
//        let storyboard = UIStoryboard(name: "HomeTabs", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCCart") as! VCCart
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnSearchClick (_ sender: Any){
//        let storyboard = UIStoryboard(name: "HomeTabs", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "VCProductFilter") as! VCProductFilter
//        isFromHome = false
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func rightBarButton() {
       
            Cartbtn = MIBadgeButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
            Cartbtn?.badgeBackgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            Cartbtn!.setImage(UIImage(named: "Cart"), for: .normal)
            if(cartCount == ""){
                Cartbtn?.badgeString = nil
            }
            else if (cartCount == "0"){
                Cartbtn?.badgeString = nil
            }
            else{
                Cartbtn?.badgeString = cartCount
            }
            
            Cartbtn?.addTarget(self, action:#selector(btnCardClick(_:)), for: UIControlEvents.touchUpInside)
        

        Notificationbtn = MIBadgeButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        Notificationbtn?.badgeBackgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        Notificationbtn!.setImage(#imageLiteral(resourceName: "Notification"), for: .normal)
    
        if(Count == ""){
            Notificationbtn?.badgeString = nil
        }
        else if (Count == "0"){
            Notificationbtn?.badgeString = nil
        }
        else{
            Notificationbtn?.badgeString = Count
        }
        
        Notificationbtn?.addTarget(self, action:#selector(HomeTabsVC.notification_message), for: UIControlEvents.touchUpInside)
        let notificationItem = UIBarButtonItem(customView: Notificationbtn!)
        Notificationbtn!.badgeEdgeInsets = UIEdgeInsetsMake(4, 0, 0, 0)
        let cartItem = UIBarButtonItem(customView:Cartbtn!)
        Cartbtn!.badgeEdgeInsets = UIEdgeInsetsMake(4, 0, 0, 0)
        self.navigationItem.setRightBarButtonItems([cartItem,notificationItem], animated: true)
    }
    
    @objc func notification_message(_ sender: Any){
    
    }
}
