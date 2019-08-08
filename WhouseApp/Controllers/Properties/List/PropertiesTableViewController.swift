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
        self.addLogoToNavbar()
        setData()
    }
    
    func setData(){
        for item in list {
            let property = Property(name: item,
                                    id: nil,
                                    image: UIImage(named: "houseFull"),
                                    thumbnail: UIImage(named: "house"),
                                    address: "4069 Chain Bridge Rd\nFairfax, Va 22032\nUSA",
                                    ownerName: "John Doe",
                                    ownerPhone: "+1 23 7682425",
                                    ownerEmail: "john.doe@mail.com",
                                    notes: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt molli.",
                                    type: "House",
                                    bedsAmount: "5",
                                    bedroomsAmount: "4",
                                    bathroomsAmount: "4",
                                    area: "120",
                                    isAirnbnb: true,
                                    isBooking: false)
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
        cell.picture.image = properties[indexPath.row].thumbnail

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "show" {
            let destination = segue.destination as! PropertyViewController
            let selectedCell = sender as! PropertyTableViewCell
            let indexPath = propertiesTable.indexPath(for: selectedCell)
            let selectedProperty = properties[indexPath!.row]
            destination.property = selectedProperty
        }
        
    }

}
