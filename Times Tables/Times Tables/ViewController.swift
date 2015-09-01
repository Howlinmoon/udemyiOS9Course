//
//  ViewController.swift
//  Times Tables
//
//  Created by jim Veneskey on 8/31/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    // Holds the actual value of the slider
    @IBOutlet weak var sliderValue: UISlider!
    
    // Called when the user adjusts the slider
    @IBAction func sliderMoved(sender: AnyObject) {
        // reload the table when the slider is moved
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // we only want the first 20 rows in the table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let timesTable = Int(sliderValue.value * 20)
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "\((indexPath.row + 1) * timesTable)"
        
        return cell
    }



}

