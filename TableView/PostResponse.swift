//
//  PostResponse.swift
//  TableView
//
//  Created by user on 2015/7/27.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import Foundation

class PostResponse : NSObject {
    var Result : String = ""
    var Message : String = ""
    var Source : String = ""
    
    init(JSONString: String) {
        super.init()
        
        //var error : NSError?
        let JSONData = JSONString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        
        if let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(JSONData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            for (key, value) in json {
                let keyName = key as! String
                let keyValue: String = value as! String

                // If property exists
                if (self.respondsToSelector(NSSelectorFromString(keyName))) {
                    self.setValue(keyValue, forKey: keyName)
                }
            }
        }
        
//        var JSONDictionary: Dictionary = NSJSONSerialization.JSONObjectWithData(JSONData!, options: nil, error: &error) as NSDictionary
//        
//        // Loop
//        for (key, value) in JSONDictionary {
//            let keyName = key as String
//            let keyValue: String = value as String
//            
//            // If property exists
//            if (self.respondsToSelector(NSSelectorFromString(keyName))) {
//                self.setValue(keyValue, forKey: keyName)
//            }
//        }
        // Or you can do it with using
        // self.setValuesForKeysWithDictionary(JSONDictionary)
        // instead of loop method above
    }
}