//
//  OnboardingSearchViewController.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/26/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class OnboardingSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var serviceTableList: UITableView!
    @IBOutlet weak var nearBtn: UIButton!
    @IBOutlet weak var anotherAddressBtn: UIButton!
    @IBOutlet weak var zipHeight: NSLayoutConstraint!
    
    let list = ["Service 1", "Service 2", "Service 3", "Service 4","Service 5","Service 6","Service 7","Service 8","Service 9","Service 10","Service 11","Service 12","Service 13","Service 14","Service 15","Service 16"]
    var checked = [Bool](repeating: false, count: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func search(_ sender: UIButton){
        self.loadHomeScreen()
    }
    
    func loadHomeScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Navigation", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "navigationRoot") as! UITabBarController
        self.present(homeVC, animated: true, completion: nil)
    }
}
