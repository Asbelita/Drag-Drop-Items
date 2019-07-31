//
//  SearchResultsTableViewCell.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/30/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: RatingControl!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var responseTime: UILabel!
    @IBOutlet weak var jobsAndClients: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var earned: UILabel!
    @IBOutlet weak var verified: UIImageView!
    @IBOutlet weak var flags: UIStackView!
    @IBOutlet weak var isSuggested: DesignableLabel!
    @IBOutlet weak var flagsVerifiedConstraint: NSLayoutConstraint!
    @IBOutlet weak var flagsBottomConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
