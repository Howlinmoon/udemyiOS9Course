//
//  ViewController.swift
//  Table Views
//
//  Created by jim Veneskey on 8/31/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

// Add the UITableViewDelegate functions to allow this object (ViewController) to manipulate the Table View

class ViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 3
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")

        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

