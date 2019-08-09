//
//  PropertyOptionsTableViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/8/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PropertyOptionsTableViewController: UITableViewController {
    
    // MARK: - Static Outlets
    @IBOutlet weak var checkInOutLabel: UILabel!
    @IBOutlet weak var manageChecklistsLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var activeJobsLabel: UILabel!
    @IBOutlet weak var jobRequestsLabel: UILabel!
    
    var property: Property?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStyles()
    }

    func setStyles(){
        checkInOutLabel.style(style: TextStyle.subtitle)
        manageChecklistsLabel.style(style: TextStyle.subtitle)
        detailsLabel.style(style: TextStyle.subtitle)
        activeJobsLabel.style(style: TextStyle.subtitle)
        jobRequestsLabel.style(style: TextStyle.subtitle)
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
