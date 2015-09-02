//
//  FirstViewController.swift
//  To Do List
//
//  Created by jim Veneskey on 9/2/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

// global var - an array of strings
var toDoList = [String]()


class FirstViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet var toDoListTable: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    // This handy function causes the table to be reloaded when we return from the second
    // view controller
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }


}

