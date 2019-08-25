//
//  PropertyViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/6/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PropertyViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    // MARK: - Static Outlets
    @IBOutlet weak var jobRequestBtn: DesignableUIButton!
    
    var property: PropertyViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLogoToNavbar()
        setData()
    }
    
    func setStyles() {
        name.style(style: TextStyle.screenTitle)
        jobRequestBtn.style(style: TextStyle.Button.stickyCTA)
    }
    
    func setData() {
        if let property = property{
            name.text = property.name
            picture.image = property.image
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "embeedOptions" {
            let destination = segue.destination as! PropertyOptionsTableViewController
            destination.property = self.property
        }
        
    }
}
