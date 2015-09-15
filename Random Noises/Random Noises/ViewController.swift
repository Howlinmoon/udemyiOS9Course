//
//  ViewController.swift
//  Random Noises
//
//  Created by jim Veneskey on 9/15/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()

    var sfx = ["Boinging", "Canary", "Dum_Dum", "Falling_Bomb", "Junk_Falling", "Missile_Launch",
    "Mouse_Twitter", "Slide_Whistle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            print("Device was shaken!")
            // Now select a random number that will determine which sound effect we play
            let effectNumber = Int(arc4random_uniform(UInt32(sfx.count)))
            let effectName = sfx[effectNumber]
            print("Playing sfx number: \(effectNumber) entitled: \(effectName)")
            
            
            // Now - Play it!
            let audioPath = NSBundle.mainBundle().pathForResource(effectName, ofType: "mp3")!
            do {
                
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
                player.play()
            } catch {
                // process error here if any
                
            }

            
        }
    }

    
}

