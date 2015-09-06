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
    var timer = NSTimer()
    var animationRunning = false
    
    @IBOutlet weak var animationPicture: UIImageView!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        if animationRunning {
            // stop the animation
            print("Stopping the animation")
            timer.invalidate()
            animationRunning = false
        } else {
            // start the animation running again
            print("Attempting to restart the animation")
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "doAnimation", userInfo: nil, repeats: true)
            animationRunning = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "doAnimation", userInfo: nil, repeats: true)
        
    }
    
    func doAnimation() {
        // increment the frame number
        frameNumber += 1
        if frameNumber > 5 {
            frameNumber = 1
        }
        let frameName = "frame\(frameNumber).png"
        animationPicture.image = UIImage(named: frameName)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // More animation types demoed in https://www.udemy.com/the-complete-ios-9-developer-course/learn/#/lecture/3193412
    
    /*
    // all of objects are laid out - but not displayed yet
    override func viewDidLayoutSubviews() {
        // shove the image off screen to the left
        animationPicture.center = CGPointMake(animationPicture.center.x - 400, animationPicture.center.y)
    }
    
    // when the view appears, animate our picture onto the screen
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in

            self.animationPicture.center = CGPointMake(self.animationPicture.center.x + 400, self.animationPicture.center.y)
        }
    }
    
    */


}

