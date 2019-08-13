//
//  CustomCellTableViewCell.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/27/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var checkIcon: UIImageView!
    @IBOutlet weak var txtLabel: UILabel!
    
    var checked: Bool = false
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        self.backgroundColor = Color.transparent
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted{
            self.backgroundColor = Color.secundary
        }else{
            self.backgroundColor = Color.transparent
        }
    }
}
