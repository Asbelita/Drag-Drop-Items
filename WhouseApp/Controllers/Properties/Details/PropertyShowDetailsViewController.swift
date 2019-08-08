//
//  PropertyShowDetailsViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/7/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit
import MapKit

class PropertyShowDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    
    // Mark: - Outlets
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var addressMap: MKMapView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var ownerPhone: UILabel!
    @IBOutlet weak var ownerEmail: UILabel!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var photosCollectionHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var bedroomsAmount: UILabel!
    @IBOutlet weak var bedsAmount: UILabel!
    @IBOutlet weak var bathroomsAmount: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var isAirbnb: UIImageView!
    @IBOutlet weak var isBooking: UIImageView!
    @IBOutlet weak var airbnb: UILabel!
    @IBOutlet weak var booking: UILabel!
    @IBOutlet weak var imageCollectionHeightConstraint: NSLayoutConstraint!

    
    
    // Mark: - Static Outlets
    
    @IBOutlet weak var addressSectionTitle: UILabel!
    @IBOutlet weak var ownerSectionTitle: UILabel!
    @IBOutlet weak var notesSectionTitle: UILabel!
    @IBOutlet weak var photosSectionTitle: UILabel!
    @IBOutlet weak var detailsSectionTitle: UILabel!
    
    
    var property: Property?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyles()
        self.addLogoToNavbar()
        self.setData()
    }
    
    func setStyles(){
        addressSectionTitle.style(style: TextStyle.sectionTitle)
        ownerSectionTitle.style(style: TextStyle.sectionTitle)
        notesSectionTitle.style(style: TextStyle.sectionTitle)
        photosSectionTitle.style(style: TextStyle.sectionTitle)
        detailsSectionTitle.style(style: TextStyle.sectionTitle)
        
        name.style(style: TextStyle.screenTitle)
        address.style(style: TextStyle.body)
        ownerName.style(style: TextStyle.body)
        ownerPhone.style(style: TextStyle.body)
        ownerEmail.style(style: TextStyle.body)
        notes.style(style: TextStyle.bodySmall)
        type.style(style: TextStyle.body)
        bedsAmount.style(style: TextStyle.body)
        bedroomsAmount.style(style: TextStyle.body)
        bathroomsAmount.style(style: TextStyle.body)
        area.style(style: TextStyle.body)
        airbnb.style(style: TextStyle.body)
        booking.style(style: TextStyle.body)
    }
    
    func setData(){
        if let property = property {
            name.text = property.name
            picture.image = property.image
            address.text = property.address
            ownerName.text = property.ownerName
            ownerPhone.text = property.ownerPhone
            ownerEmail.text = property.ownerEmail
            notes.text = property.notes
            type.text = property.type
            bedsAmount.text = (property.bedsAmount ?? "No") + " Beds"
            bedroomsAmount.text = (property.bedroomsAmount ?? "No") + " Bedrooms"
            bathroomsAmount.text = (property.bathroomsAmount ?? "No") + " Restrooms"
            area.text = (property.area ?? "0") + " m²"
            isAirbnb.image = property.isAirnbnb ? UIImage.appImage(appImages.circleCheckedMd) : UIImage.appImage(appImages.circleUncheckedMd)
            isBooking.image = property.isBooking ? UIImage.appImage(appImages.circleCheckedMd) : UIImage.appImage(appImages.circleUncheckedMd)
            
            property.images = [
                Image(id: 1, name: "image1", url: "", image: UIImage(named: "cleanedHouse")),
                Image(id: 2, name: "image2", url: "", image: UIImage(named: "cleanedHouse")),
                Image(id: 3, name: "image3", url: "", image: UIImage(named: "cleanedHouse")),
                Image(id: 4, name: "image4", url: "", image: UIImage(named: "cleanedHouse")),
                Image(id: 5, name: "image5", url: "", image: UIImage(named: "cleanedHouse")),
            ]
            let rows = CGFloat(property.images.count) / 3.0
            imageCollectionHeightConstraint.constant = 102.0 * rows.rounded(.up)
        }
        
    }

    // MARK: - UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return property?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath as IndexPath) as! ImageCollectionViewCell
        
        cell.Image.image = property?.images[indexPath.item]?.image
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}
