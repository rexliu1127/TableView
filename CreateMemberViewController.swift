//
//  CreateMemberViewController.swift
//  TableView
//
//  Created by user on 2015/7/25.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit

class CreateMemberViewController: UIViewController {


    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var sex: UISwitch!
    @IBOutlet weak var activity: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCreate(sender: AnyObject) {
        //validate(self.account.text, email: self.email.text)
        
    }
    
    func hardProcessingWithString(input: String, completion: (result: String) -> Void) {
        //
        
            //completion("we finished!")
    }
    
    func validateAccount()->String
    {
        var result = ""
        let urlPath: String = "http://td99api.azurewebsites.net/api/validateAccount"
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        request1.HTTPMethod = "POST"
        var stringPost="=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"rex\"}]"
        
        let data = stringPost.dataUsingEncoding(NSUTF8StringEncoding)
        
        request1.timeoutInterval = 60
        request1.HTTPBody=data
        request1.HTTPShouldHandleCookies=false
        
        let queue:NSOperationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError
            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)!
            
            println("AsSynchronous\(responseString)")
            result = responseString as String
            println("result=\(responseString)")
            
        })
        return ""
    }
    
    @IBAction func btnCheck(sender: AnyObject) {
        
        
        
//        var result = ""
//        let urlPath: String = "http://td99api.azurewebsites.net/api/validateAccount"
//        var url: NSURL = NSURL(string: urlPath)!
//        var request1: NSMutableURLRequest = NSMutableURLRequest(URL: url)
//        
//        request1.HTTPMethod = "POST"
//        var stringPost="=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"rex\"}]"
//        
//        let data = stringPost.dataUsingEncoding(NSUTF8StringEncoding)
//        
//        request1.timeoutInterval = 60
//        request1.HTTPBody=data
//        request1.HTTPShouldHandleCookies=false
//        
//        let queue:NSOperationQueue = NSOperationQueue()
//        
//        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
//            var err: NSError
//            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
//            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)!
//
//            println("AsSynchronous\(responseString)")
//            result = responseString as String
//            println("result=\(responseString)")
//        })
        
        var error_message : String = ""
        
        var validateAccount = Remote()
        validateAccount.post = "=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"\(account.text)\"}]"
        //re.connect("/validateAccount",post:"=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"rex\"}]")
        validateAccount.connect("/ValidateAccount")
        //println(re.result)
        
        var response_account  = PostResponse(JSONString:String(validateAccount.result))
        
        if(response_account.Result == "0")
        {
            error_message = response_account.Message
        }
        
        var validateEmail = Remote()
        validateEmail.post = "=[{\"Token\":\"\(GlobalConstants.token)\",\"Email\":\"\(email.text)\"}]"
        validateEmail.connect("/ValidateEmail")

        
        var response_email  = PostResponse(JSONString:String(validateEmail.result))

        if(response_email.Result == "0")
        {
            error_message = error_message + "\n" + response_email.Message
        }
        
        if(error_message != "")
        {
            let alert = UIAlertView()
            alert.title = "訊息"
            alert.message = error_message
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        
        
//        println(res.Result)
//        println(res.Message)
//        println(res.Source)
        
        
//        var remote = Remote()
//        
//        remote.connect("/validateAccount",post:"=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"rex\"}]")
        
//
        
        
        
        
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        println(connection.description)
    }
    
    func validate(account:String,email:String)
    {
        //var cbm  = BooleanMessage()
        var done1 : Int = 0
        var done2 : Int = 0
        var result : String = ""
        var message : String! = ""
        var source : String! = ""
        
        var error_message : String! = ""
        
        dispatch_async(dispatch_get_main_queue()) {
            
            
            
            let myUrl1 = NSURL(string: "http://td99api.azurewebsites.net/api/validateAccount");
            
            let request1 = NSMutableURLRequest(URL:myUrl1!);
            
            request1.HTTPMethod = "POST";
            
            
            let postString1 = "=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"\(account)\"}]";
            
            //cbm.message = String(postString)
            
            request1.HTTPBody = postString1.dataUsingEncoding(NSUTF8StringEncoding);
            
            NSURLConnection.sendAsynchronousRequest(request1, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
                
                if error != nil
                    
                {
                    
                    //cbm.message = "send api error"
                    //return cbm
                }
                
                
                let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                var err: NSError?
                
                var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
                
                //cbm.message="5"
                
                if let parseJSON = myJSON {
                    
                    
                    result = String(stringInterpolationSegment: parseJSON["Result"]!)
                    
                    message = String(stringInterpolationSegment: parseJSON["Message"]!)
                    
                    source = String(stringInterpolationSegment: parseJSON["Source"]!)
                    
                    
                    if(result != "")
                        
                    {
                        
                        if(result == "1")
                        {

                            
                        }
                        else
                        {
                            error_message = message
                            
                            let alert = UIAlertView()
                            alert.title = "訊息"
                            alert.message = message
                            alert.addButtonWithTitle("OK")
                            alert.show()
                        }
                        
                    }
                    else
                    {
                        
                    }
//                    
//                    done1 = 1
//                    while(done1 == 0)
//                    {
//                        //println("done1=\(done1)")
//                        println("done2=\(done1)")
//                    }

                    
                }
                

            }
            

            
            result = ""
            message = ""
            source = ""
            
            let myUrl2 = NSURL(string: "http://td99api.azurewebsites.net/api/validateEmail");
            
            let request2 = NSMutableURLRequest(URL:myUrl2!);
            
            request2.HTTPMethod = "POST";
            
            
            let postString2 = "=[{\"Token\":\"\(GlobalConstants.token)\",\"Email\":\"\(email)\"}]";
            
            //cbm.message = String(postString)
            
            request2.HTTPBody = postString2.dataUsingEncoding(NSUTF8StringEncoding);
            
            
            
            NSURLConnection.sendAsynchronousRequest(request2, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
                
                if error != nil
                    
                {
                    
                    //cbm.message = "send api error"
                    //return cbm
                }
                
                
                let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                var err: NSError?
                
                var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
                
                //cbm.message="5"
                
                if let parseJSON = myJSON {
                    
                    
                    result = String(stringInterpolationSegment: parseJSON["Result"]!)
                    
                    message = String(stringInterpolationSegment: parseJSON["Message"]!)
                    
                    source = String(stringInterpolationSegment: parseJSON["Source"]!)
                    
                    
                    if(result != "")
                        
                    {
                        
                        if(result == "1")
                        {
                            
                            
                        }
                        else
                        {
                            error_message = error_message + "\n" + message
//                            let alert = UIAlertView()
//                            alert.title = "訊息"
//                            alert.message = message
//                            alert.addButtonWithTitle("OK")
//                            alert.show()

                        }
                        
                    }
                    else
                    {
                        
                    }
                    
                }
                done2 = 1
                while(done2 == 0)
                {
                    //println("done1=\(done1)")
                    println("done2=\(done2)")
                }

            }
            
            
            
        }

//        while(done1 == 0 || done2 == 0)
//        {
//            println("done1=\(done1)")
//            println("done2=\(done2)")
//        }
        
        if(error_message! == "")
        {
            let alert = UIAlertView()
            alert.title = "訊息"
            alert.message = error_message!
            alert.addButtonWithTitle("OK")
            alert.show()
        }
        else
        {
            //            let alert = UIAlertView()
            //            alert.title = "訊息"
            //            alert.message = "驗證失敗"
            //            alert.addButtonWithTitle("OK")
            //            alert.show()
        }

        
        
    }
    
    
/*
    registerMember [{"Token":"inyoung99","Account":"rex0926","Password":"1234","Sex":"1","Activity":"2","Birthday":"1980/11/27","Email":"abc@hinet.net"}]
*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
