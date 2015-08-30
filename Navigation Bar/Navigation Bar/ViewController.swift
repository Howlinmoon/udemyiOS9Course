//
//  ViewController.swift
//  Navigation Bar
//
//  Created by Jim Veneskey on 8/30/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // globals
    var time = 0
    
    
    func result() {
        time++
        print("\(time) seconds has passed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // timer code goes in here
        
        var timer = NSTimer()
        // self here is referring to the ViewController object itself
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

