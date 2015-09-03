//
//  SecondViewController.swift
//  To Do List
//
//  Created by jim Veneskey on 9/2/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var item: UITextField!

    @IBAction func addItem(sender: AnyObject) {
        // add an item to the todo array
        toDoList.append(item.text!)
        // clear out the input text, to allow for another
        item.text = ""
        
        // update the stored copy of the array
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // get rid of keyboard if user touches outside of it
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        item.resignFirstResponder()
        return true
    }
    

}

