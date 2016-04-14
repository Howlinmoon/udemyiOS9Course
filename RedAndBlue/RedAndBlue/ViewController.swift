//
//  ViewController.swift
//  RedAndBlue
//
//  Created by jim Veneskey on 4/12/16.
//  Copyright © 2016 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var blueBalloon: UIImageView!
    
    @IBOutlet weak var redBalloon: UIImageView!
    
    
    @IBAction func hideBlue(sender: AnyObject) {
        print("Hiding the Blue Balloon!")
        blueBalloon.hidden = true
    }

    @IBAction func hideRed(sender: AnyObject) {
        print("Hiding the Red Balloon!")
        redBalloon.hidden = true
    
    }
    
}

