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
        
        newUser.setValue("Klondike", forKey: "username")
        newUser.setValue("Yummy678", forKey: "password")
        
        do {
            try context.save()
        } catch {
            // any errors are caught here
            print("Something went wrong attempting to save the context")
        }
        */

        // double check our saved data
        let request = NSFetchRequest(entityName: "Users")
        // search the database for username 'Jim'
        //request.predicate = NSPredicate(format: "username = %@", "Klondike")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            //print(results)
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    /*
                    
                    // Try changing the targeted username to something else
                    //result.setValue("Belkar", forKey: "username")
                    
                    // Try deleting the current record
                    context.deleteObject(result)
                    
                    // Save the context
                    do {
                        try context.save()
                    } catch {
                        print("Encountered an error saving the updated context")
                    }
                    
                    */

                    if let username = result.valueForKey("username") as? String {
                        print("The username is \(username)")
                    }
                    
//                    print(result.valueForKey("username")!)
//                    print(result.valueForKey("password")!)
                }
            } else {
                print("Unable to retrieve any records")
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

