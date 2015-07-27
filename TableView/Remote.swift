//
//  Remote.swift
//  TableView
//
//  Created by user on 2015/7/27.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//

import Foundation

class Remote: NSObject {
    
    var data = NSMutableData()
    var result = NSString()
    
    func connect(query:NSString) {
//        let urlPath: String = "http://td99api.azurewebsites.net/api"
//        var url: NSURL = NSURL(string: urlPath)!
//        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
//        request.HTTPMethod = "POST"
//        
//        let postdata = post.dataUsingEncoding(NSUTF8StringEncoding)
//        
//        request.timeoutInterval = 60
//        request.HTTPBody=postdata
//        request.HTTPShouldHandleCookies=false
//             var conn = NSURLConnection(request: request, delegate: self, startImmediately: true)
//
//        println("q=\(query),p=\(post)")
//        println(request)

//        let urlPath: String = "http://www.google.com"
//        var url: NSURL = NSURL(string: urlPath)!
//        var request = NSURLRequest(URL: url)
        
        let urlPath: String = "http://td99api.azurewebsites.net/api/validateAccount"
        var url: NSURL = NSURL(string: urlPath)!
        var request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        
        var stringPost="=[{\"Token\":\"\(GlobalConstants.token)\",\"Account\":\"rex\"}]"
        
        let postdata = stringPost.dataUsingEncoding(NSUTF8StringEncoding)
        
        //println(postdata)
        
        request.timeoutInterval = 20
        request.HTTPBody=postdata
        request.HTTPShouldHandleCookies=false
        request.HTTPMethod = "POST"
        
        var conn = NSURLConnection(request: request, delegate: self, startImmediately: true)
        
        var response: NSURLResponse?
        var error: NSError?
        let urlData = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
        
        let responseString = NSString(data: urlData! , encoding: NSUTF8StringEncoding)!
        //println("here is result=\(responseString)")
        
//        if let httpResponse = response as? NSHTTPURLResponse {
//            println(httpResponse.statusCode)
//            
//        }
        //println("done")
        result = responseString
    }
    
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        //println(response)
        
        //let responseString = NSString(data : data, encoding: NSUTF8StringEncoding)
        
        //println("RES:\(responseString)")
    }
    
    func connection(connection: NSURLConnection!, didReceiveData conData: NSData!) {
        self.data.appendData(conData)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        
        
        
        var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:nil) as? NSDictionary
        
        //cbm.message="5"
        //println("AAAAAAAAAAAAAAAAA")
        //println(myJSON)
//        if let parseJSON = myJSON {
//            
//            
//            
//            println(String(stringInterpolationSegment: parseJSON["Result"]!))
//            
//            println(String(stringInterpolationSegment: parseJSON["Message"]!))
//            
//            println(String(stringInterpolationSegment: parseJSON["Source"]!))
//            
//
//        }
        
        //println("self.data=\(self.data)")
        
        //let responseString = NSString(data: self.data, encoding: NSUTF8StringEncoding)!
        //println(responseString)
        

        
        
        //NSURLConnection.sendSynchronousRequest(, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            
        //}
        
        //println(self.result)
        
        
    }
    
    
    deinit {
        //println("deiniting")
    }
}