//
//  User.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/1/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

class User : Codable{
    
    var name: String
    var rating: Int
    var reviewsAmount: Int
    var isVerified: Bool
    var maxResponseTime: Int
    var jobsAmount: Int
    var clientsAmount: Int
    var distance: Double
    var earned: Double
    var isSuggested: Bool
    var aboutMe: String?
    var aboutServices: String?
 
    init(name: String, rating: Int, reviewsAmount: Int, isVerified: Bool, maxResponseTime: Int, jobsAmount: Int, clientsAmount: Int, distance: Double, earned: Double, isSuggested: Bool, aboutMe: String?, aboutServices: String?) {
        self.name = name
        self.rating = rating
        self.reviewsAmount = reviewsAmount
        self.isVerified = isVerified
        self.maxResponseTime = maxResponseTime
        self.jobsAmount = jobsAmount
        self.clientsAmount = clientsAmount
        self.distance = distance
        self.earned = earned
        self.isSuggested = isSuggested
        self.aboutMe = aboutMe
        self.aboutServices = aboutServices
    }
}

class UserViewModel : User {
    var profilePicture: UIImage?
    var services = [Service?]()
    var images = [ImageViewModel?]()
    var badges = [BadgeViewModel?]()
}
