//
//  ClassLibrary.swift
//  TableView
//
//  Created by user on 2015/7/22.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import Foundation


class BooleanMessage {
    
    init() {
        Result = false
        Message = ""
    }
    
    var Result: Bool = false
    var Message: String = ""
    
}

class ResultSetMessage {
    
    init() {
        ResultSet = FMResultSet()
        Message = ""
    }
    
    var ResultSet : FMResultSet
    var Message: String = ""
    
}

class NSMutableArrayMessage {
    
    init() {
        NSMArray = NSMutableArray()
        Message = ""
    }
    
    var NSMArray : NSMutableArray
    var Message: String = ""
    
}