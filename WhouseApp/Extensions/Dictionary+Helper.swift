//
//  Dictionary+Helper.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/23/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    
    func stringForKey (_ key : Key) -> String {
        if let value = self[key] as? String {
            return value
        }
        return ""
    }
    
    func intForKey (_ key : Key) -> Int {
        if let value = self[key] as? NSNumber {
            return value.intValue
        }
        return 0
    }
    
    func int64ForKey (_ key : Key) -> Int64 {
        if let value = self[key] as? NSNumber {
            return value.int64Value
        }
        return 0
    }
    
    func doubleForKey (_ key : Key) -> Double {
        if let value = self[key] as? Double {
            return value
        }
        return 0.0
    }
    
    func boolForKey (_ key : Key) -> Bool {
        if let value = self[key] as? Bool{
            return value
        }
        return false
    }
    
    func arrayForKey (_ key : Key) -> [Any] {
        if let value = self[key] as? [Any] {
            return value
        }
        return []
    }
    
    func dictionaryForKey (_ key : Key) -> [String : Any] {
        if let value = self[key] as? [String : Any] {
            return value
        }
        return [String : Any]()
    }
    
    func dictionaryByRemovingNulls () -> [String : Any] {
        var newDictionary : [String : Any] = [String : Any]()
        
        for (key, value) in self {
            if self[key] != nil {
                if value is [String : Any] {
                    newDictionary[key as! String] = (value as! [String : Any]).dictionaryByRemovingNulls() as Any?
                } else {
                    newDictionary[key as! String] = value
                }
                
            }
        }
        
        return newDictionary
    }
}
