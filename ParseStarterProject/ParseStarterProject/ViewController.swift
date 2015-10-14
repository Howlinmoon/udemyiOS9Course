//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let product = PFObject(className: "Products")
        product["name"] = "Pizza"
        product["description"] = "Tasty Good Food"
        product["price"] = 9.99
        product.saveInBackgroundWithBlock { (success, error) -> Void in
            if success == true {
                print("Success saving product")
            } else {
                print("Failed saving product")
                print(error)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

