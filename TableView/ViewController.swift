//
//  ViewController.swift
//  TableView
//
//  Created by Rex Liu on 2015/7/12.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
                
//        let entityDescription =
//        NSEntityDescription.entityForName("Member",
//            inManagedObjectContext: managedObjectContext!)
//        
//        
//        let member = Member(entity: entityDescription!,
//            insertIntoManagedObjectContext: managedObjectContext)
////
//        member.account = "jay"
//        member.password = String("1234")
        
        
        
////        contact.name = name.text
////        contact.address = address.text
////        contact.phone = phone.text
//        
        let entity = NSEntityDescription.entityForName("Member", inManagedObjectContext: managedObjectContext!)
        let member = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedObjectContext!)
        
        
        var formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTimePrefix: String = formatter.stringFromDate(NSDate())
        
        println(dateTimePrefix)
        
        //return
        
        member.setValue("test", forKey: "account")
        member.setValue("aaa", forKey: "password")
        
        //insert save
        
        var error: NSError?
//        if !managedObjectContext!.save(&error){
//            println("Could not save \(error), \(error?.userInfo)")
//        }
//        else
//        {
//            println("saved")
//        }
        
        
        var error1: NSError?
        let fetchRequest = NSFetchRequest(entityName: "Member")
        let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: &error1) as? [Member]
        
        //println(fetchResults)
        
        if let fmembers = fetchResults
        {
            
            for fmember in fmembers
            {
                println("account=\(fmember.account),password=\(fmember.password)")
                
            }
            
        }
        else
        {
            println("Could not fetch \(error), \(error?.userInfo)")
        }
        
        
        
        
//
//
        //println(members)
        
//        let imageName = "/Users/user/desktop/joystick128x128.png"
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image!)
//        imageView.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
//        view.addSubview(imageView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

