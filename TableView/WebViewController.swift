//
//  WebViewController.swift
//  TableView
//
//  Created by user on 2015/7/20.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://220.130.10.50:1234/Login.cshtml")!
        let request = NSURLRequest(URL: url)
        
        //webView.sizeThatFits(CGSizeZero)  //.sizeThatFits = CGSizeZero
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func doBack(sender: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func doRefresh(sender: AnyObject) {
        webView.reload()
    }
    
    @IBAction func doForward(sender: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func doStop(sender: AnyObject) {
        webView.stopLoading()
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
