//
//  PropertyOptionsTableViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/8/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PropertyOptionsTableViewController: UITableViewController {

    var property: Property?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "showDetails":
            let destination = segue.destination as! PropertyShowDetailsViewController
            destination.property = property
            
        default: break
        }
    }

}
