
import UIKit

protocol HomeProtocol {
    func tapOnViewAll(cell:HomeTableViewCell)
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var CollecView: UICollectionView!
    @IBOutlet weak var btnViewAll: UIButton!
    @IBOutlet weak var lblCategoryName: UILabel!
    var delegate:HomeProtocol?

    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        CollecView.delegate = dataSourceDelegate
        CollecView.dataSource = dataSourceDelegate
        CollecView.tag = row
        CollecView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.btnViewAll.setTitle("View All", for: .normal)
    }
    
    @IBAction func viewAll(_ sender:UIButton){
        delegate?.tapOnViewAll(cell: self)
    }
}
