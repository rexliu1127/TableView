//
//  Member.swift
//  TableView
//
//  Created by user on 2015/8/9.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import Foundation
import CoreData

class Member: NSManagedObject {

    @NSManaged var account: String
    @NSManaged var password: String
    

}
