
import UIKit
import MBProgressHUD
import DZNEmptyDataSet
import SocketIO
import SwiftyJSON
import MIBadgeButton_Swift
import XLPagerTabStrip

class BaseController: UIViewController {
    
    var Notificationbtn: MIBadgeButton?
    var Cartbtn: MIBadgeButton?
    var Count = ""
    var manager:SocketManager!
    var socket:SocketIOClient!
    let lang = UserDefaults.standard.string(forKey: "i18n_language")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        self.rightBarButton()
    }
    
    @objc func btnCardClick (_ sender: Any){
    //  let storyboard = UIStoryboard(name: "HomeTabs", bundle: nil)
    //  let vc = storyboard.instantiateViewController(withIdentifier: "VCCart") as! VCCart
    //  self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnSearchClick (_ sender: Any){
    //   let storyboard = UIStoryboard(name: "HomeTabs", bundle: nil)
    //   let vc = storyboard.instantiateViewController(withIdentifier: "VCProductFilter") as! VCProductFilter
    //   isFromHome = false
    //   self.navigationController?.pushViewController(vc, animated: true)
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
    
    @objc func setting_btn(_ sender: Any){
        
    }
    
    @objc func notification_message(_ sender: Any){
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    func showAlert(_ message: String, tryAgainClouser:@escaping (UIAlertAction)->Void){
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Try Again!", style: UIAlertActionStyle.default, handler: tryAgainClouser)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func getControllerRef(controller toPush:String,storyboard:String) -> UIViewController{
        return UIStoryboard(name: storyboard, bundle:nil).instantiateViewController(withIdentifier: toPush)
    }
}

extension UIViewController{
    
    func finishLoading(){
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func startLoading(_ message:String){
        let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = message
        loadingNotification.animationType = .zoom
    }
    
    func alertMessage(message:String,completionHandler:(()->())?) {
        let alert = UIAlertController(title:"", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
            completionHandler?()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension BaseController: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Sorry there is no data available"
        let attribs = [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 19),
            NSAttributedStringKey.foregroundColor: UIColor.darkGray
        ]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        let text = "Try Again!"
        let attribs = [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.8874343038, green: 0.3020061255, blue: 0.4127213061, alpha: 1)
            ] as [NSAttributedStringKey : Any] as [NSAttributedStringKey : Any]
        
        return NSAttributedString(string: text, attributes: attribs)
    }
}
