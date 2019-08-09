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
    var results = [User]()
    let list = ["John Doe", "Morgan Freeman", "John Stewart", "Bill Barfield","Timothy Richardson","Davin Johansen","Mike Goodman","Michael Iacoletti","Richard McCain","Robert Stevenson","Jonathan Macklemore", "John Doe", "Morgan Freeman", "John Stewart", "Bill Barfield","Timothy Richardson","Davin Johansen","Mike Goodman","Michael Iacoletti","Richard McCain","Robert Stevenson","Jonathan Macklemore"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResults.dataSource = self
        prepareData()
    }
    
    func prepareData(){
        for item in list {
            let user = User(
                name: item,
                profilePicture: UIImage(named: "profilePic")!,
                rating: Int.random(in: 0...5),
                reviewsAmount: Int.random(in: 0...20),
                isVerified: Bool.random(),
                maxResponseTime: Int.random(in: 0...60),
                jobsAmount: Int.random(in: 1...500),
                clientsAmount: Int.random(in: 1...100),
                distance: Double.random(in: 0.0...5.0),
                earned: Double.random(in: 1.0...1000.0),
                isSuggested: Bool.random(),
                aboutMe: "Etiam et nisl et ex faucibus congue porttitor eu lorem. Fusce condimentum cursus nibh, non faucibus tellus imperdiet ut. Curabitur lobortis velit id mi tincidunt.",
                aboutServices: "Etiam et nisl et ex faucibus congue porttitor eu lorem. Fusce condimentum cursus nibh, non faucibus tellus imperdiet ut. Curabitur lobortis velit id mi tincidunt.",
                services: [
                    Service(id: 1, name: "Housekeeping"),
                    Service(id: 2, name: "Laundry"),
                    Service(id: 3, name: "House Manager")
                ],
                images: [],
                badges: [
                    Badge(id: 1,
                          name: "Fusce condimentum cursus nibh",
                          description: "Fusce condimentum cursus nibh, non faucibus tellus imperdiet ut. Curabitur lobortis velit id mi tincidunt.",
                          image: Image(id: 1, name: "popularBadge", url: "", image: UIImage.appImage(.popularBadge))
                    ),
                    Badge(id: 2,
                          name: "Curabitur lobortis velit id mi tincidunt",
                          description: "Fusce condimentum cursus nibh, non faucibus tellus imperdiet ut. Curabitur lobortis velit id mi tincidunt.",
                          image: Image(id: 1, name: "popularBadge", url: "", image: UIImage.appImage(.quickResponseBadge))
                    ),
                    Badge(id: 1,
                          name: "Curabitur lobortis velit id mi tincidunt",
                          description: "Fusce condimentum cursus nibh, non faucibus tellus imperdiet ut. Curabitur lobortis velit id mi tincidunt.",
                          image: Image(id: 1, name: "popularBadge", url: "", image: UIImage.appImage(.popularBadge))
                    ),
                    Badge(id: 2,
                          name: "Curabitur lobortis",
                          description: "Fusce condimentum cursus nibh, non faucibus tellus imperdiet ut. Curabitur lobortis velit id mi tincidunt.",
                          image: Image(id: 1, name: "popularBadge", url: "", image: UIImage.appImage(.quickResponseBadge))
                    ),
                    Badge(id: 1,
                          name: "Curabitur lobortis velit id",
                          description: "Fusce condimentum cursus nibh, non faucibus tellus imperdiet ut. Curabitur lobortis velit id mi tincidunt.",
                          image: Image(id: 1, name: "popularBadge", url: "", image: UIImage.appImage(.popularBadge))
                    ),
                ]
            )
            results += [user]
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResults.dequeueReusableCell(withIdentifier: "SearchResultTableCell", for: indexPath) as! SearchResultsTableViewCell
        cell.name.text = results[indexPath.row].name
        cell.jobsAmount.text = String(results[indexPath.row].jobsAmount)
        cell.clientsAmount.text = String(results[indexPath.row].clientsAmount)
        cell.distance.text = String(format: "%.1f", results[indexPath.row].distance)
        cell.earned.text = String(format: "%.1f", results[indexPath.row].earned)
        cell.profilePicture.image = results[indexPath.row].profilePicture
        cell.responseTime.text = String(results[indexPath.row].maxResponseTime)
        cell.rating.rating = results[indexPath.row].rating
        cell.reviews.text = "(\(results[indexPath.row].reviewsAmount))"
        
        if(!results[indexPath.row].isVerified){
            cell.verified.isHidden = true
            cell.verifiedConstraint.priority = UILayoutPriority.defaultLow
            cell.unverifiedConstraint.priority = UILayoutPriority.defaultHigh
        }else{
            cell.verified.isHidden = false
            cell.verifiedConstraint.priority = UILayoutPriority.defaultHigh
            cell.unverifiedConstraint.priority = UILayoutPriority.defaultLow
        }
        cell.ratingStack.isHidden = results[indexPath.row].reviewsAmount == 0
        cell.isSuggested.isHidden = !results[indexPath.row].isSuggested
        cell.responseTimeStack.isHidden = results[indexPath.row].maxResponseTime == 0
        cell.earnedStack.isHidden = true

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "showProfile":
            let publicProfileViewController = segue.destination as! PublicProfileViewController
            let selectedCell = sender as! SearchResultsTableViewCell
            let indexPath = searchResults.indexPath(for: selectedCell)
            let selectedProfile = results[indexPath!.row]
            publicProfileViewController.profile = selectedProfile
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

}
