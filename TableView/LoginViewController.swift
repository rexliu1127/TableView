//
//  LoginViewController.swift
//  TableView
//
//  Created by user on 2015/7/22.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var txtAccount: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtResult: UITextField!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var cbm=BooleanMessage()
    
    @IBAction func btnLogin(sender: AnyObject) {
        
        //loading.startAnimating()
        
        login(self.txtAccount.text, password: self.txtPassword.text)
        
        println(cbm.Result)
        println(cbm.Message)
        
        
    }
    
    func switchToViewController(identifier: String) {
        
        let storyboard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
        
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! UIViewController
        //self.storyboard?.instantiateViewControllerWithIdentifier(identifier)
        //self.navigationController?.setViewControllers([viewController], animated: false)
        //let vc = self.storyboard?.instantiateViewControllerWithIdentifier(identifier) as! ViewController

        
        //let dummy = vc.view // force loading subviews and setting outlets
        
        viewController.viewDidLoad()
    }
    
    @IBAction func btnForget(sender: AnyObject) {
        
//        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        
//        var s : UIStoryboard
        
        //var v : UIViewController =
        //self.storyboard!.instantiateViewControllerWithIdentifier("viewForget")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("viewForget") as! UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
        //switchToViewController("viewForget")
        
//        MasterDetailTestDetailViewController *viewController =
//            [self.storyboard instantiateViewControllerWithIdentifier:@"Poem"];

        
    }
    
    @IBAction func btnCreate(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("viewCreate") as! UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func login(account:String,password:String)
    {
        //var cbm  = BooleanMessage()
        var result : String = ""
        var message : String! = ""
        var source : String! = ""
        
        dispatch_async(dispatch_get_main_queue()) {
            
            
            
            let myUrl = NSURL(string: "http://td99api.azurewebsites.net/api/validateMember");
            
            let request = NSMutableURLRequest(URL:myUrl!);
            
            request.HTTPMethod = "POST";
            
            
            let postString = "=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"\(account)\",\"Password\":\"\(password)\"}]";
            
            //cbm.Message = String(postString)
            
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);

            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
                
                if error != nil
                    
                {
                    
                    //cbm.Message = "send api error"
                    //return cbm
                }

                
                let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)

                var err: NSError?
                
                var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
                
                //cbm.Message="5"
                
                if let parseJSON = myJSON {
                    
                    
                    result = String(stringInterpolationSegment: parseJSON["Result"]!)
                    
                    message = String(stringInterpolationSegment: parseJSON["Message"]!)
                    
                    source = String(stringInterpolationSegment: parseJSON["Source"]!)
                    
 
                    if(result != "")
                        
                    {
                        
                        if(result == "1")
                        {
                            //cbm.result = true
                            let alert = UIAlertView()
                            alert.title = "登入訊息"
                            alert.message = "登入成功"
                            alert.addButtonWithTitle("OK")
                            alert.show()
                            
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewControllerWithIdentifier("viewMain") as! UIViewController
                            self.presentViewController(vc, animated: true, completion: nil)

                            
                        }
                        else
                        {
                            let alert = UIAlertView()
                            alert.title = "登入訊息"
                            alert.message = "帳號或密碼錯誤"
                            alert.addButtonWithTitle("OK")
                            alert.show()
                            
                        }
                        
                    }
                    else
                    {
                        
                    }

                }

                
            }
            
            
        }

    }
    
    func isLogin(account:String,password:String)->BooleanMessage
    {
        var cbm = BooleanMessage()
        
        
        var result : String = ""
        var message : String! = ""
        var source : String! = ""

        
        dispatch_async(dispatch_get_main_queue()) {
            
            
            
            let myUrl = NSURL(string: "http://td99api.azurewebsites.net/api/validateMember");
            
            let request = NSMutableURLRequest(URL:myUrl!);
            
            request.HTTPMethod = "POST";
            
            
            let postString = "=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"\(account)\",\"Password\":\"\(password)\"}]";
            
            cbm.Message = String(postString)
            
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
            
            cbm.Message="1234"
            
            
            //let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.currentQueue()) {(response, data, error) in
                
                if error != nil
                    
                {
                    
                    cbm.Message = "send api error"
                    //return cbm
                }
                
                
                
                // You can print out response object
                
                //print("response = \(response)")
                
                
                
                // Print out response body
                
                let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                //print("responseString = \(responseString)")
                
                cbm.Message=String(responseString!)
                cbm.Message="1234"
                println(responseString)

                //Let's convert response sent from a server side script to a NSDictionary object:
                
                
                
                
                
                
                var err: NSError?
                
                var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
                
                cbm.Message="5"
                
                if let parseJSON = myJSON {
                    
                    
                    result = String(stringInterpolationSegment: parseJSON["Result"]!)

                    message = String(stringInterpolationSegment: parseJSON["Message"]!)

                    source = String(stringInterpolationSegment: parseJSON["Source"]!)
                
                    
                    
                    println("RES:\(result)")
                    println("MSG:\(message)")
                    //println("Source=\(source!)")
                    
//                    if(result == "Optional(1)")
//                    {
//                        cbm.result = true
//                    }
//                    else
//                    {
//                        cbm.result=false
//                    }
                    
                    
                    //println("CBM RESULT = \(cbm.result)")
                    
                    
                    
                    if(result != "")
                        
                    {
                        
                        if(result == "1")
                        {
                            cbm.Result  = true
                            let alert = UIAlertView()
                            alert.title = "登入訊息"
                            alert.message = "登入成功"
                            alert.addButtonWithTitle("OK")
                            alert.show()
                            
                        }
                        else
                        {
                            let alert = UIAlertView()
                            alert.title = "登入訊息"
                            alert.message = "帳號或密碼錯誤"
                            alert.addButtonWithTitle("OK")
                            alert.show()

                        }
                        
                    }
                    else
                    {
                        
                    }
                    
                    cbm.Message = message
                    
                    //self.txtResult.text = result
                    
                    
                }
                
                
                
                
                
                //dispatch_group_wait(dispatch_get_main_queue(), DISPATCH_TIME_FOREVER)
                
                
            }
            
            
        }
        
        //txtResult.text = String(stringInterpolationSegment: cbm.result)
        //cbm.result=result
        cbm.Message=message
        println("wait return cbm.result=\(cbm.Result)")
        println("wait return cbm.Message=\(cbm.Message)")
        return cbm

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
