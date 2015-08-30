//
//  ViewController.swift
//  Stop Watch
//
//  Created by Jim Veneskey on 8/30/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Globals
    var elapsedTime = 0
    var timer = NSTimer()

    func result() {
        elapsedTime++
        print("\(elapsedTime) seconds has passed")
        // update our big label
        currentTimeLabel.text = "\(elapsedTime)"
    }

    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        // start (enable) timer code goes in here
        print("Start button was pressed")
        // self here is referring to the ViewController object itself
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        // stop (disable) timer code goes in here
        print("Stop Button was pressed")
        timer.invalidate()
    }
    
    
    @IBAction func resetButtonPressed(sender: AnyObject) {
        // this routine resets the counter to 0 and displays it
        print("Reset button was pressed")
        elapsedTime = 0
        currentTimeLabel.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTimeLabel.text = "0"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

