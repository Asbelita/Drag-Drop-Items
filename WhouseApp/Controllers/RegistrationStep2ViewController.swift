//
//  RegistrationStep2ViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/24/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class RegistrationStep2ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var serviceTableList: UITableView!

    let list = ["Service 1", "Service 2", "Service 3", "Service 4","Service 5","Service 6","Service 7","Service 8","Service 9","Service 10","Service 11","Service 12","Service 13","Service 14","Service 15","Service 16"]
    var checked = [Bool](repeating: false, count: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceTableList.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as! CustomCellTableViewCell
        cell.checkBtn.addTarget(self, action: #selector(checkboxClicked(_:)), for: .touchUpInside)
        cell.checkBtn.tag = indexPath.row
        let service = checked[indexPath.row]
        if service{
            cell.checkBtn.setImage(#imageLiteral(resourceName: "circleChecked"), for: .normal)
        }else{
            cell.checkBtn.setImage(#imageLiteral(resourceName: "circleUnchecked"), for: .normal)
        }
        cell.txtLabel.text = list[indexPath.row]
        
        return cell
    }
    
    @objc func checkboxClicked(_ sender: UIButton) {
        checked[sender.tag] = !checked[sender.tag]
        serviceTableList.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
