//
//  TableResultsViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/31/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class TableResultsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var searchResults: UITableView!
    let list = ["John Doe", "Morgan Freeman", "John Stewart", "Bill Barfield","Timothy Richardson","Davin Johansen","Mike Goodman","Michael Iacoletti","Richard McCain","Robert Stevenson","Jonathan Macklemore"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResults.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResults.dequeueReusableCell(withIdentifier: "SearchResultTableCell", for: indexPath) as! SearchResultsTableViewCell
        cell.name.text = list[indexPath.row]
        cell.rating.rating = Int.random(in: 0...5)
        cell.reviews.text = "(\(String(Int.random(in: 1...17))))"
        if(Bool.random()){
            cell.verified.isHidden = true
            cell.flagsVerifiedConstraint.priority = UILayoutPriority.defaultLow
            cell.flagsBottomConstraint.priority = UILayoutPriority.defaultHigh
        }
        if(!Bool.random())
        {
            cell.isSuggested.isHidden = true
        }
        return cell
    }

}
