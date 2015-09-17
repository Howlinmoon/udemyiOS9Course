//
//  ViewController.swift
//  WebViews
//
//  Created by jim Veneskey on 9/17/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://www.google.com")
        
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
        // or you can use raw html
        
        let html = "<html><body><h1>My Page</h1><p>This is a lame web page</p></body></html>"
        
        webView.loadHTMLString(html, baseURL: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

