//
//  APIManager.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/22/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import Foundation

typealias APIManager = BaseAPIManager

extension BaseAPIManager {
    
    func login(_ completionHandler: @escaping APICompletionHandler, failureHandler: @escaping APIFailureHandler, parameters: [String : String]?) {
        
        callURLService("login", method: .Post, parameters: parameters, success: completionHandler, failure: failureHandler)
        
    }
}

