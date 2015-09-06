//
//  ViewController.swift
//  Animations
//
//  Created by Jim Veneskey on 9/5/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var frameNumber = 1
    
    @IBOutlet weak var animationPicture: UIImageView!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        // increment the frame number
        frameNumber += 1
        if frameNumber > 5 {
            frameNumber = 1
        }
        let frameName = "frame\(frameNumber).png"
        animationPicture.image = UIImage(named: frameName)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

