//
//  PassingAViewController.swift
//  TableView
//
//  Created by Rex Liu on 2015/7/16.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit

class PassingAViewController: UIViewController {

    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func btnPassVegan(sender: AnyObject) {
        self.performSegueWithIdentifier("passvegan", sender: nil)
    }
    
    @IBAction func btnPassB(sender: AnyObject) {
        self.performSegueWithIdentifier("pass", sender: nil)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "pass"){
            var obj = segue.destinationViewController as! PassingBViewController
            //var p : NSIndexPath = obj..indexPathForSelectedRow
            //self.navigationController?.popToRootViewControllerAnimated(true)
            obj.tempString = txtPass.text
            //bVc.delegate = self
        }
        
        if(segue.identifier == "passvegan"){
            var obj = segue.destinationViewController as! VeganCardPostViewController
            //var p : NSIndexPath = obj..indexPathForSelectedRow
            //self.navigationController?.popToRootViewControllerAnimated(true)
            obj.tempString = txtPass.text
            //bVc.delegate = self
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
