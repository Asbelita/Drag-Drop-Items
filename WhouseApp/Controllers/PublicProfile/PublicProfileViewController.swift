//
//  PublicProfileViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/1/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PublicProfileViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var servicesTable: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: RatingControl!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var picture: DesignableImageView!
    @IBOutlet weak var isVerified: UIImageView!
    @IBOutlet weak var isSuggested: DesignableLabel!
    @IBOutlet weak var ratingStack: UIStackView!
    @IBOutlet weak var unverifiedConstraint: NSLayoutConstraint!
    @IBOutlet weak var verifiedConstraint: NSLayoutConstraint!
    @IBOutlet weak var jobsAmount: UILabel!
    @IBOutlet weak var clientsAmount: UILabel!
    @IBOutlet weak var responseTime: UILabel!
    @IBOutlet weak var responseTimeStack: UIStackView!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var earned: UILabel!
    @IBOutlet weak var aboutMe: UITextView!
    @IBOutlet weak var aboutServices: UITextView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    var profile: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        servicesTable.dataSource = self
        setData()
    }
    
    
    func setData(){
        if let profile = profile{
            
            navigationItem.titleView = setTitle(profile.name, andImage: profile.profilePicture)
            navigationItem.titleView?.sizeToFit()
            
            name.text = profile.name
            rating.rating = profile.rating
            reviews.text = "(\(profile.reviewsAmount))"
            picture.image = profile.profilePicture
            jobsAmount.text = String(profile.jobsAmount)
            clientsAmount.text = String(profile.clientsAmount)
            distance.text = String(format: "%.1f", profile.distance)
            earned.text = String(format: "%.1f", profile.earned)
            responseTime.text = "\(profile.maxResponseTime)'"
            
            if (!profile.isVerified){
                isVerified.isHidden = true
                verifiedConstraint.priority = UILayoutPriority.defaultLow
                unverifiedConstraint.priority = UILayoutPriority.defaultHigh
            }
            
            ratingStack.isHidden = profile.reviewsAmount == 0
            isSuggested.isHidden = !profile.isSuggested
            responseTimeStack.isHidden = profile.maxResponseTime == 0
            aboutMe.text = profile.aboutMe
            aboutServices.text = profile.aboutServices
            servicesTable.reloadData()
            tableHeightConstraint.constant = CGFloat(44 * profile.services.count)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile?.services.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = servicesTable.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! ServiceShowTableViewCell
        cell.nameLabel.text = profile?.services[indexPath.row].name
        return cell
    }

}
