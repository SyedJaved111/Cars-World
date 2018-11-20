
import UIKit
import DropDown

class HomeVC: BaseController{
    
    @IBOutlet weak var tablView: UITableView!{
        didSet{
            self.tablView.delegate = self
            self.tablView.dataSource = self
            self.tablView.alwaysBounceVertical = true
            self.tablView.addSubview(refreshControl)
        }
    }
    
    @IBOutlet weak var searchBarField:UITextField!
    @IBOutlet weak var categoryField:UITextField!
    @IBOutlet weak var sucategoryField:UITextField!
    let categorydropDown = DropDown()
    let subcategorydropDown = DropDown()

    let lang = UserDefaults.standard.string(forKey: "i18n_language")
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(refreshTableView),for: UIControlEvents.valueChanged)
        refreshControl.tintColor = #colorLiteral(red: 0.1183428243, green: 0.7272036672, blue: 0.3827357888, alpha: 1)
        return refreshControl
    }()
    
    var categoryList = ["Car Categories","Spare Parts","Services","Used Cars","Car Brands"]
    var carDivisionList = ["Sports Car","Convertible","Sports Car","Convertible"]
    var sparePartsDivisionList = ["Tyres","Headlines","Battery","Engine","Absorber"]
    var carBrandsDivisionList = ["BMW","Volkswagen","Mercedes"]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.searchBarField.attributedPlaceholder = NSAttributedString(string: "Keyword", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.3529411765, green: 0.3490196078, blue: 0.3568627451, alpha: 1),NSAttributedStringKey.font : UIFont(name: "Raleway-Regular", size: 12)!])
        self.categoryField.attributedPlaceholder = NSAttributedString(string: "Category",
            attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.3529411765, green: 0.3490196078, blue: 0.3568627451, alpha: 1),NSAttributedStringKey.font : UIFont(name: "Raleway-Regular", size: 12)!])
        self.sucategoryField.attributedPlaceholder = NSAttributedString(string: "Subcategory",
            attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.3529411765, green: 0.3490196078, blue: 0.3568627451, alpha: 1),NSAttributedStringKey.font : UIFont(name: "Raleway-Regular", size: 12)!])
        setupDelegates()
        self.tablView.tableFooterView = UIView()
        
        subcategorydropDown.anchorView = sucategoryField
        subcategorydropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        subcategorydropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        subcategorydropDown.dataSource = ["hello","hello","hello","hello","hello"]
        subcategorydropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            
        }
        
        categorydropDown.anchorView = categoryField
        categorydropDown.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        categorydropDown.selectionBackgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        categorydropDown.dataSource = ["hello","hello","hello","hello","hello"]
        categorydropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            
        }
    }
    
    @IBAction func categoryDropDown(_ sender: Any){
        categorydropDown.show()
    }
    
    @IBAction func subcategoryDropDown(_ sender: Any){
        subcategorydropDown.show()
    }
    
    @objc func refreshTableView(){
        
    }
    
    fileprivate func setupDelegates(){
        self.tablView.reloadData()
    }
    
    @IBAction func ViewMoreClick(_ sender: Any){
        
    }
}

extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1{
            return 150
        }
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        cell.lblCategoryName.text = categoryList[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? HomeTableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
           return sparePartsDivisionList.count
        }else if collectionView.tag == 4{
           return carBrandsDivisionList.count
        }
        return carDivisionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath) as! DataCollectionViewCell
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SparepartsCell", for: indexPath) as! SparepartsCell
            cell.lblProducts.text = sparePartsDivisionList[indexPath.row]
            cell.imgProducts.image = UIImage(named:sparePartsDivisionList[indexPath.row])
            return cell
        }else if collectionView.tag == 4{
            cell.lblProducts.text = carBrandsDivisionList[indexPath.row]
        }else{
            cell.lblProducts.text = carDivisionList[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1{
           return CGSize(width: 65, height: 80)
        }
         return CGSize(width: 153, height: 132)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!){
        
    }
}

extension HomeVC: HomeProtocol{
    
    func tapOnViewAll(cell:HomeTableViewCell){
       
    }
}





