//
//  ViewController.swift
//  Permanent Storage
//
//  Created by jim Veneskey on 9/1/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // saving user specified settings
        NSUserDefaults.standardUserDefaults().setObject("Biff", forKey: "name")
        
        // retrieve the user name  NSString or String?
        let userName = NSUserDefaults.standardUserDefaults().objectForKey("name")! as! NSString
        
        print("userName is: \(userName)")
        
        let array = [1, 2, 3, 4]
        NSUserDefaults.standardUserDefaults().setObject(array, forKey: "array")
        // retrieve the array
        let newArray = NSUserDefaults.standardUserDefaults().objectForKey("array")! as! NSArray
        print(newArray)
        
        // Try looping through the returned array
        for x in newArray {
            print(x)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

