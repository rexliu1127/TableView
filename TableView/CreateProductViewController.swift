//
//  CreateProductViewController.swift
//  TableView
//
//  Created by Rex Liu on 2015/7/12.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit

class CreateProductViewController: UIViewController {

    @IBOutlet weak var txtProductID: UITextField!
    @IBOutlet weak var txtProductName: UITextField!
    //var tmpString : String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func save(sender: AnyObject) {

        
        var pid : String="1234"
        var pname : String="PS4"

        print("hello this is a test\n")
        print("pid=\(pid)\npname=\(pname)")
        
        //self.performSegueWithIdentifier("toBviewController", sender: self)
        //self.tmpString = "通過segue進行的值傳遞方式1"
        self.performSegueWithIdentifier("save", sender: nil)
        
    }
    
    @IBAction func btnVegan(sender: AnyObject) {
        self.performSegueWithIdentifier("vegan", sender: nil)
        
    }
    
    
    
    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "toBviewController"){
            var bVc:ProductTableViewController = segue.destinationViewController as! ProductTableViewController
            bVc.tempString =  txtProductID.text //textField.text
            //bVc.delegate = self
        }
    }
*/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print("seque:\(segue.identifier)")
        
        if(segue.identifier == "save"){
            
            var obj = segue.destinationViewController as! ProductTableViewController
            
            obj.tempString = txtProductID.text
            //bVc.delegate = self
        }
        
        if(segue.identifier == "vegan"){
            var obj = segue.destinationViewController as! VeganCardPostViewController
            //var p : NSIndexPath = obj..indexPathForSelectedRow
            //self.navigationController?.popToRootViewControllerAnimated(true)
            obj.tempString = txtProductID.text
            //bVc.delegate = self
        }
        
    }

}
