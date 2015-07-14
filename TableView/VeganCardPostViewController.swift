//
//  VeganCardPostViewController.swift
//  TableView
//
//  Created by Rex Liu on 2015/7/15.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit

class VeganCardPostViewController: UIViewController {

    @IBOutlet weak var lblCardSerial: UILabel!
    @IBOutlet weak var lblPoint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnGet(sender: AnyObject) {
        var str:String! = ""
        
        var con : String! = ""
        
        
        
        //let url = NSURL(string: "http://192.168.1.205:1111/api/User/read?pageNumber=1&pageSize=10")
        
        let url = NSURL(string: "http://220.130.10.50:1234/Login.cshtml")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            //println(NSString(data: data, encoding: NSUTF8StringEncoding))
            
            
            
            //var s : NSString = "Hello world";
            
            //var con : String = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
            
            con = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
            
            
            
            dispatch_async(dispatch_get_main_queue()) {
                
                println(con)
                
                //self.lblContent.numberOfLines = 0;
                
                //self.lblContent.text = con
                
                
                
            }
            
            
            
            //self.lblContent.val(NSString(data: data, encoding: NSUTF8StringEncoding))
            
        }
        
        
        
        
        
        
        
        task.resume()
        
        //self.tvContent.text = con
        
        //self.tvContent.text = str
        
        
    }
    @IBAction func btnPost(sender: AnyObject) {
        
        
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = "Here's a message"
        alert.addButtonWithTitle("Understod")
        alert.show()
        
        print("hello")
        
        let myUrl = NSURL(string: "http://220.130.10.50:1888/api/VeganDiscount/Read/");
        
        let request = NSMutableURLRequest(URL:myUrl!);
        
        request.HTTPMethod = "POST";
        
        
        
        var c:String? = ""
        
        var p:String? = ""
        
        
        
        // Compose a query string
        
        let postString = "={'CardSerial':'5543453960000002','Token':'ivegan'}";
        
        
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            
            data, response, error in
            
            
            
            if error != nil
                
            {
                
                println("error=\(error)")
                
                return
                
            }
            
            
            
            // You can print out response object
            
            println("response = \(response)")
            
            
            
            // Print out response body
            
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            println("responseString = \(responseString)")
            
            
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            
            
            var err: NSError?
            
            var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
            
            
            
            if let parseJSON = myJSON {
                
                // Now we can access value of First Name by its key
                
                var CardSerial = parseJSON["CardSerial"] as? String
                
                var Point = parseJSON["Point"] as? String
                
                
                
                
                
                
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    if(CardSerial != nil)
                        
                    {
                        
                        c = CardSerial
                        
                        self.lblCardSerial.text = c
                        
                    }
                        
                    else
                        
                    {
                        
                        self.lblCardSerial.text = ""
                        
                    }
                    
                    
                    
                    if(Point != nil)
                        
                    {
                        
                        p = Point
                        
                        self.lblPoint.text = p
                        
                    }
                        
                    else
                        
                    {
                        
                        self.lblPoint.text = ""
                        
                    }
                    
                }
                
                
                
                println("CardSerial: \(CardSerial)")
                
                println("Point: \(Point)")
                
            }
            
            
        
        }

    }

}