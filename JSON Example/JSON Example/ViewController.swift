//
//  ViewController.swift
//  JSON Example
//
//  Created by jim Veneskey on 9/17/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // using HTTPS version, no need for modifying plist
        let url = NSURL(string: "https://www.telize.com/geoip")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            if let urlContent = data {
                print(urlContent)
                // convert it to something useful
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    // result is an optional
                    print(jsonResult["city"])
                } catch {
                    print("Something happened attempting to handle the JSON serialization")
                }
            }
        }
        
        task.resume()
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

