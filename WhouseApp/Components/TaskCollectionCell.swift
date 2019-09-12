

import UIKit

class TaskCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(name: String){
        imageCell.image = UIImage(named: name)
    }

}
