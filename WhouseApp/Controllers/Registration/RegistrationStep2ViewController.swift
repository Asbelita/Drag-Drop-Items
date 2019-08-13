//
//  RegistrationStep2ViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/24/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class RegistrationStep2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var serviceTableList: UITableView!

    let list = ["Service 1", "Service 2", "Service 3", "Service 4","Service 5","Service 6","Service 7","Service 8","Service 9","Service 10","Service 11","Service 12","Service 13","Service 14","Service 15","Service 16"]
    var checked = [Bool](repeating: false, count: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as! CustomCellTableViewCell
        cell.txtLabel.text = list[indexPath.row]
        if checked[indexPath.row] {
            cell.checkIcon.image = UIImage.appImage(.circleChecked)
        }else{
            cell.checkIcon.image = UIImage.appImage(.circleUnchecked)
        }
        cell.icon.tintColor = UIColor.white
        cell.checkIcon.tintColor = UIColor.white

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checked[indexPath.row] = !checked[indexPath.row]
        serviceTableList.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
