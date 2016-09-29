//
//  ServerManager.swift
//  WellsChallenge
//
//  Created by Adrian Roe on 9/28/16.
//  Copyright © 2016 AdrianRoe. All rights reserved.
//

import Foundation

class ServerManager : NSObject{
    static var Instance : ServerManager = ServerManager()
    
    func postLogin(){
        self.getUserTransaction()
    }
    
    func getUserTransaction() {
        
        let ServerUrl = NSURL(string: "http://54.191.35.66:8181/pfchang/api/buy?username=Michael&grandTotal=0")
        let url:NSURL = ServerUrl!
        
        let post:NSString = ""
        
        let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        let postLength:NSString = String( postData.length )
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")
            do {
                if let _ = response as? NSHTTPURLResponse {
                    
                    if(data != nil){
                        let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
                        print("Body: \(strData)")
                        
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! NSDictionary
                        print("YAY")
                    }
                }
            } catch {}
        })
        task.resume()
        
    }
}