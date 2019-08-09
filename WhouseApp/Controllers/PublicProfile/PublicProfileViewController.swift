//
//  PublicProfileViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/1/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PublicProfileViewController: UIViewController, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Mark: - Static Outlets
    @IBOutlet weak var responseTimeLabel: UILabel!
    @IBOutlet weak var jobsAmountLabel: UILabel!
    @IBOutlet weak var clientsAmountLabel: UILabel!
    @IBOutlet weak var earnedLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var aboutMeSectionTitle: UILabel!
    @IBOutlet weak var aboutServicesSectionTitle: UILabel!
    @IBOutlet weak var servicesSectionTitle: UILabel!
    @IBOutlet weak var scheduleSectionTitle: UILabel!
    @IBOutlet weak var languagesSectionTitle: UILabel!
    @IBOutlet weak var badgesSectionTitle: UILabel!
    @IBOutlet weak var photosSectionTitle: UILabel!
    @IBOutlet weak var reviewsSectionTitle: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    // Mark: - Outlets
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
    @IBOutlet weak var imageCollectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var earnedStack: UIStackView!
    
    
    // Mark: - Properties
    var profile: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        servicesTable.dataSource = self
        self.setStyles()
        self.addLogoToNavbar()
        self.setData()
    }
    
    func setStyles(){
        
        responseTimeLabel.style(style: TextStyle.subLabel)
        responseTime.style(style: TextStyle.subLabel)
        jobsAmountLabel.style(style: TextStyle.subLabel)
        jobsAmount.style(style: TextStyle.subLabel)
        clientsAmountLabel.style(style: TextStyle.subLabel)
        clientsAmount.style(style: TextStyle.subLabel)
        earnedLabel.style(style: TextStyle.subLabel)
        earned.style(style: TextStyle.subLabel)
        currencyLabel.style(style: TextStyle.subLabel)
        aboutMeSectionTitle.style(style: TextStyle.sectionTitle)
        aboutMe.style(style: TextStyle.bodySmall)
        aboutServicesSectionTitle.style(style: TextStyle.sectionTitle)
        aboutServices.style(style: TextStyle.bodySmall)
        servicesSectionTitle.style(style: TextStyle.sectionTitle)
        scheduleSectionTitle.style(style: TextStyle.sectionTitle)
        languagesSectionTitle.style(style: TextStyle.sectionTitle)
        badgesSectionTitle.style(style: TextStyle.sectionTitle)
        photosSectionTitle.style(style: TextStyle.sectionTitle)
        reviewsSectionTitle.style(style: TextStyle.sectionTitle)
        
    }
    func setData(){
        if let profile = profile{
            
//            navigationItem.titleView = setTitle(profile.name, andImage: profile.profilePicture)
//            navigationItem.titleView?.sizeToFit()
            
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
            
            earnedStack.isHidden = true
            ratingStack.isHidden = profile.reviewsAmount == 0
            isSuggested.isHidden = !profile.isSuggested
            responseTimeStack.isHidden = profile.maxResponseTime == 0
            aboutMe.text = profile.aboutMe
            aboutServices.text = profile.aboutServices
            servicesTable.reloadData()
            tableHeightConstraint.constant = CGFloat(44 * profile.services.count)
            
            profile.images = [
                Image(id: 1, name: "image1", url: "", image: UIImage(named: "cleanedHouse")),
                Image(id: 2, name: "image2", url: "", image: UIImage(named: "cleanedHouse")),
                Image(id: 3, name: "image3", url: "", image: UIImage(named: "cleanedHouse")),
                Image(id: 4, name: "image4", url: "", image: UIImage(named: "cleanedHouse")),
                Image(id: 5, name: "image5", url: "", image: UIImage(named: "cleanedHouse")),
            ]
            let rows = CGFloat(profile.images.count) / 3.0
            imageCollectionHeightConstraint.constant = 102.0 * rows.rounded(.up)
        }
    }
    
    // Mark: - TableViewDataSource protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile?.services.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = servicesTable.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! ServiceShowTableViewCell
        cell.nameLabel.text = profile?.services[indexPath.row].name
        return cell
    }
    
     // MARK: - UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profile?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath as IndexPath) as! ImageCollectionViewCell
        
        cell.Image.image = profile?.images[indexPath.item]?.image
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    

}
