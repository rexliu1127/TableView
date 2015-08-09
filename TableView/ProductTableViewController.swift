//
//  ProductTableViewController.swift
//  TableView
//
//  Created by Rex Liu on 2015/7/12.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit

//protocol SendMessageDelegate{
//    func sendWord(message : String)
//}

class ProductTableViewController: UITableViewController {

    @IBOutlet var tv: UITableView!
    var tempString:String = ""
    //var delegate : SendMessageDelegate?
    
    var list1: NSArray = ["hello1","hello2","hello3","don't do that"]
    var am = NSMutableArrayMessage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv.dataSource=self
        tv.delegate=self
        
        var values = [String]()
        var fmdb = Db()
        fmdb.Path = "/Users/user/desktop/"
        fmdb.DbName  = "feedlog.db"
        var bm = BooleanMessage()
        bm = fmdb.isOpen()
        fmdb.Sql = "SELECT * FROM login"
        values = []
        fmdb.values = values
        am = fmdb.getArrayResultMessage()
        println(am.NSMArray)
        
        //print(tempString)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//         #warning Potentially incomplete method implementation.
//         Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return am.NSMArray.count //list1.count
    }
    
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: (NSIndexPath!)) -> UITableViewCell {
        
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        //cell.textLabel?.text = "this is row \(indexPath.row):\(list1.objectAtIndex(indexPath.row))"
        
        //print("\n")
        //print("\(indexPath.row) : \(list1.objectAtIndex(indexPath.row))\n")
        
        //self.array2[indexPath.row] as NSString
        //cell.textLabel?.text = am.NSMArray.objectAtIndex(indexPath.row) as! String
//        for (NSString key in am.NSMArray.objectAtIndex(indexPath.row)) {
//            //id object = [dict objectForKey:key];
//            cell.textLabel?.text = String(key)
//        }
//        for(key,value) in am.NSMArray.objectAtIndex(indexPath.row)
//        {
//            
//        }
        
        var dict = NSDictionary()
        
        dict = am.NSMArray.objectAtIndex(indexPath.row) as! NSDictionary

        var content = String()
        content = ""
        
        for (key, value) in dict {
            if(content == "")
            {
                content = "\(key):\(value)"
            }
            else
            {
                content  = content + ";\(key):\(value)"
            }
            
        }
        
        /*
        let imageName = "/Users/user/desktop/joystick128x128.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 128, height: 128)

*/
        
        //var iv = UIIMageView()
        //var imageView = UIImageView()
        
        let imageName = "/Users/user/desktop/joystick128x128.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        cell.imageView?.image = imageView.image
        
        cell.textLabel?.text = content


        return cell
        
    }

    
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
//
//        cell.textLabel?.text = "\(list1.objectAtIndex(indexPath.row))"
// 
//        return cell
//    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditringStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
