//
//  SearchResultsViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/30/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    @IBOutlet weak var searchResultsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogoToNavbar()
    }
    
    func addLogoToNavbar(){
        let logo = UIImage(named: "appNameBlack")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
    }
}
