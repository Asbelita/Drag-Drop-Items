//
//  PropertyViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/6/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PropertyViewController: UIViewController {

    var property: Property?
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLogoToNavbar()
        setData()
    }
    
    func setData(){
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
