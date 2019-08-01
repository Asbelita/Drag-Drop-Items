//
//  PropertiesTableViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/31/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PropertiesTableViewController: UITableViewController {

    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list += ["Home", "Ian's House", "Mr Richarson's House", "Phill's House","Sample Home Name"]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyTableCell", for: indexPath) as! PropertyTableViewCell

        cell.name.text = list[indexPath.row]

        return cell
    }

}
