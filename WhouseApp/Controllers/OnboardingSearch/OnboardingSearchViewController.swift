//
//  OnboardingSearchViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/26/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class OnboardingSearchViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var serviceTableList: UITableView!
    @IBOutlet weak var nearBtn: UIButton!
    @IBOutlet weak var anotherAddressBtn: UIButton!
    @IBOutlet weak var zipHeight: NSLayoutConstraint!
    
    let list = ["Service 1", "Service 2", "Service 3", "Service 4","Service 5","Service 6","Service 7","Service 8","Service 9","Service 10","Service 11","Service 12","Service 13","Service 14","Service 15","Service 16"]
    var checked = [Bool](repeating: false, count: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceTableList.dataSource = self
        zipHeight.constant = 0
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
    
    @IBAction func lookNear(_ sender: UIButton) {
        nearBtn.isSelected = true
        anotherAddressBtn.isSelected = false
        zipHeight.constant = 0
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    @IBAction func lookAnother(_ sender: UIButton) {
        nearBtn.isSelected = false
        anotherAddressBtn.isSelected = true
        zipHeight.constant = 40
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
        

    }
}
