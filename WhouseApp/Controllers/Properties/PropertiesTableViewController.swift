//
//  PropertiesTableViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/31/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class PropertiesTableViewController: UITableViewController {
    var properties = [Property]()
    @IBOutlet var propertiesTable: UITableView!
    var list = ["Home", "Ian's House", "Mr Richarson's House", "Phill's House","Sample Home Name"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData(){
        for item in list {
            let property = Property(
                id: nil,
                name: item,
                image: UIImage(named: "house"),
                address: "4069 Chain Bridge Rd\nFairfax, Va 22032\nUSA"
            )
            properties += [property]
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyTableCell", for: indexPath) as! PropertyTableViewCell

        cell.name.text = properties[indexPath.row].name
        cell.address.text = properties[indexPath.row].address
        cell.picture.image = properties[indexPath.row].image

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "show":
            let publicProfileViewController = segue.destination as! PropertyViewController
            let selectedCell = sender as! PropertyTableViewCell
            let indexPath = propertiesTable.indexPath(for: selectedCell)
            let selectedProperty = properties[indexPath!.row]
            publicProfileViewController.property = selectedProperty
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

}
