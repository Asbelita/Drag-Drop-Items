//
//  APIServiceProtocol.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/22/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    
    func login(_ completionHandler: @escaping APICompletionHandler, failureHandler: @escaping APIFailureHandler, parameters: [String : String]?)
    
}
