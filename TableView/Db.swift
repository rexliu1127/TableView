//
//  db.swift
//  TableView
//
//  Created by user on 2015/7/28.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import Foundation


class Db
{
    
    var Path : String = ""
    var DbName : String = ""
    var DB = FMDatabase()
    var Sql : String = ""
    var values = [String]()

    
    func isOpen()->BooleanMessage
    {
        var cbm = BooleanMessage()
        let filemgr = NSFileManager.defaultManager()
        var databasePath = Path + DbName
        self.DB = FMDatabase(path: databasePath)
        self.DB.open()
        
        if(DB.goodConnection())
        {
            cbm.Result = true
            
        }

        return cbm
    }
    
    func isExecuteNonQuery()->BooleanMessage
    {
        
        var bm = BooleanMessage()
        
        try
        {
            
            if(self.DB.open())
            {
                if(self.values.count == 0)
                {
                    
                    self.DB.executeUpdate(self.Sql, withArgumentsInArray: nil)
                }
                else
                {
                    
                    self.DB.executeUpdate(self.Sql, withArgumentsInArray: self.values)
                }
   
                
                bm.Result = true
            }
        
        }
        .catch
        {
            e in
            println("  caught \(e)")
            bm.Message = "exception: \(e)"
        }
        .finally
        {
            println("  finally")
            self.DB.close()
        }
        
        
        return bm
        
    }
    
    
    func getArrayResultMessage() -> NSMutableArrayMessage
    {
        var rs = FMResultSet()
        var am = NSMutableArrayMessage()

        try
            {
                
                if(self.DB.open())
                {

                    if(self.values.count == 0)
                    {
                        rs = self.DB.executeQuery(self.Sql, withArgumentsInArray: nil)
                    }
                    else
                    {
                        rs = self.DB.executeQuery(self.Sql, withArgumentsInArray: self.values)
                    }

                    while rs.next()
                    {
                        am.NSMArray.addObject(rs.resultDictionary())
                    }

                }
                
            }
            .catch
            {
                e in

                am.Message = "exception: \(e)"
            }
            .finally
            {
                self.DB.close()
        }
        
        return am

    }
    
//    func getRs() ->ResultSetMessage
//    {
//    
//        var rsm = ResultSetMessage()
//        var ary = NSMutableArray()
//        try
//            {
//                
//                if(self.DB.open())
//                {
//                    if(self.values.count == 0)
//                    {
//                        rsm.ResultSet = self.DB.executeQuery(self.Sql, withArgumentsInArray: nil)
//                    }
//                    else
//                    {
//                        println(self.Sql)
//                        
//                        rsm.ResultSet = self.DB.executeQuery(self.Sql, withArgumentsInArray: self.values)
//                    }
//                }
//                
//            }
//            .catch
//            {
//                e in
//                
//                //println("  caught \(e)")
//                rsm.Message = "exception: \(e)"
//            }
//            .finally
//            {
//                //println("  finally")
//                self.DB.close()
//            }
//       
//        return rsm
//    }
    
    func getDb()->FMDatabase{
        

        let filemgr = NSFileManager.defaultManager()

        var databasePath = Path + DbName //docsDir.stringByAppendingPathComponent(DbName)
        
        if !filemgr.fileExistsAtPath(databasePath) {
            
            let db = FMDatabase(path: databasePath)
            
            if db == nil {
                println("Error: \(db.lastErrorMessage())")
            }

        }
        println(databasePath)
        
        let db = FMDatabase(path: databasePath)
        return db
    }
    
}