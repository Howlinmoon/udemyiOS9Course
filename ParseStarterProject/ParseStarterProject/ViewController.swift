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
        
        let operation = "UPDATE"
        
        if operation == "STORE" {
        
            // Storing the Data
            let product = PFObject(className: "Products")
            product["name"] = "Pumpkin Pie"
            product["description"] = "Traditional Fall Treat"
            product["price"] = 4.99
            product.saveInBackgroundWithBlock { (success, error) -> Void in
                if success == true {
                    print("Success saving product with ID: \(product.objectId)")
                
                } else {
                    print("Failed saving product")
                    print(error)
                }
            }
        } else if operation == "RETRIEVE" {
            let query = PFQuery(className: "Products")
            query.getObjectInBackgroundWithId("KAdsZaAGwx", block: { (object: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let product = object {
                    
                    let productName = product.objectForKey("name")
                    print("The name is: \(productName)")
                    
                    
                    let description = product.objectForKey("description")
                    print("The description is: \(description)")
                    
                    let price = product.objectForKey("price")
                    print("The price is: \(price)")
                }
            })
        } else if operation == "UPDATE" {
            let query = PFQuery(className: "Products")
            query.getObjectInBackgroundWithId("KAdsZaAGwx", block: { (object: PFObject?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                } else if let product = object {
                    
                    product["name"] = "Fruit Cake"
                    product["description"] = "Dreaded Holiday Treat"
                    product["price"] = 999.99
                    
                    product.saveInBackground()
                    
                }
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

