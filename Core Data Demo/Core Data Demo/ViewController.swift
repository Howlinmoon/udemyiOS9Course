//
//  ViewController.swift
//  Core Data Demo
//
//  Created by jim Veneskey on 9/16/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        /*
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Jim", forKey: "username")
        newUser.setValue("pass123", forKey: "password")
        
        do {
            try context.save()
        } catch {
            // any errors are caught here
            print("Something went wrong attempting to save the context")
        }
        
        */

        // double check our saved data
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            //print(results)
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    print(result.valueForKey("username")!)
                    print(result.valueForKey("password")!)
                }
            }
        } catch {
            // any errors are caught here
            print("An error attempting to read the data")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

