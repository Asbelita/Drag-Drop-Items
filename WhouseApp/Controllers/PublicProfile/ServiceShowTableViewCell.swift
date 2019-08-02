//
//  ServiceShowTableViewCell.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/2/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class ServiceShowTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var listIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
