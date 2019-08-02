//
//  PublicProfileViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/1/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PublicProfileViewController: UIViewController {

    var profile: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let profile = profile{
            navigationItem.titleView = setTitle(profile.name, andImage: profile.profilePicture)
            navigationItem.titleView?.sizeToFit()
        }
    }

}
