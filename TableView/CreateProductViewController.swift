//
//  CreateProductViewController.swift
//  TableView
//
//  Created by Rex Liu on 2015/7/12.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit

class CreateProductViewController: UIViewController {

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
