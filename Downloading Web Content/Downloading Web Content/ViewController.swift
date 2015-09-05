//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by jim Veneskey on 9/3/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        // super simple method that does the same job as the code below
        // webView.loadRequest(NSURLRequest(URL: url))
        
        
        // launching a virtual browser
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            // code executed when the task completes - closure
            
            if let urlContent = data {
                // checking to see if var data exists
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                    print("data returned via the http session: \(webContent)")
                
                    self.webView.loadHTMLString(String(webContent!), baseURL: nil)
                })
                
            } else {
                
                // some error message
            }
            
            print("the response code from the sessions: \(response)")
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

