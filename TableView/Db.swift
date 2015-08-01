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
    
//    init(path : String, dbname : String)
//    {
//        Path = path
//        DbName = dbname
//        let filemgr = NSFileManager.defaultManager()
//        var databasePath = Path + DbName
//        self.db = FMDatabase(path: databasePath)
//        self.db.open()
//    }
//    
    
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
                self.DB.executeUpdate(self.Sql, withArgumentsInArray: self.values)
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
    
    func getRs() ->ResultSetMessage
    {
    
        var rsm = ResultSetMessage()
        
        try
            {
                
                if(self.DB.open())
                {
                    //self.DB.executeUpdate(self.Sql, withArgumentsInArray: self.values)
                    if(self.values.count == 0)
                    {
                        println(self.Sql)
                        rsm.ResultSet = self.DB.executeQuery(self.Sql, withArgumentsInArray: nil)
                        print(rsm.ResultSet.columnCount())
                        print(rsm.ResultSet)
                        while rsm.ResultSet.next()
                        {
                            println("rs result method:" + rsm.ResultSet.stringForColumn("account"))
                            println("rs result method:" + rsm.ResultSet.stringForColumn("password"))
                        }
                    }
                    else
                    {
                        println(self.Sql)
                        
                        rsm.ResultSet = self.DB.executeQuery(self.Sql, withArgumentsInArray: self.values)
                    }
                    
                    //bm.result = true
                }
                
            }
            .catch
            {
                e in
                
                //println("  caught \(e)")
                rsm.Message = "exception: \(e)"
            }
            .finally
            {
                //println("  finally")
                self.DB.close()
            }
        
        
        return rsm
    }
    
    func getDb()->FMDatabase{
        

        let filemgr = NSFileManager.defaultManager()
        
//        let dirPaths =
//        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
//            .UserDomainMask, true)
//        
//        let docsDir = dirPaths[0] as! String
        
        
        //var databasePath = docsDir.stringByAppendingPathComponent("feedlog.db")
        var databasePath = Path + DbName //docsDir.stringByAppendingPathComponent(DbName)
        
        if !filemgr.fileExistsAtPath(databasePath) {
            
            let db = FMDatabase(path: databasePath)
            
            if db == nil {
                println("Error: \(db.lastErrorMessage())")
            }
            
//            if db.open() {
//                let sql_stmt = "CREATE TABLE IF NOT EXISTS FEEDLOGS (ID TEXT PRIMARY KEY, COUNT INTEGER, TYPE INTEGER,LOGTIME DATETIME,LOGDAY TEXT, REMARK TEXT)"
//                if !db.executeStatements(sql_stmt) {
//                    println("Error: \(db.lastErrorMessage())")
//                }
//                db.close()
//            } else {
//                println("Error: \(db.lastErrorMessage())")
//            }
        }
        println(databasePath)
        
        let db = FMDatabase(path: databasePath)
        return db
    }
    
}