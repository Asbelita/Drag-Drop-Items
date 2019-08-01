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
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var earned: UILabel!
    @IBOutlet weak var verified: UIImageView!
    @IBOutlet weak var flags: UIStackView!
    @IBOutlet weak var isSuggested: DesignableLabel!
    
    @IBOutlet weak var verifiedConstraint: NSLayoutConstraint!
    @IBOutlet weak var unverifiedConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var responseTimeStack: UIStackView!
    @IBOutlet weak var jobsAndClientsStack: UIStackView!
    @IBOutlet weak var distanceStack: UIStackView!
    @IBOutlet weak var earnedStack: UIStackView!
    
    @IBOutlet weak var ratingStack: UIView!
    @IBOutlet weak var jobsAmount: UILabel!
    @IBOutlet weak var clientsAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
