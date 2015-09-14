//
//  ViewController.swift
//  Back To Bach
//
//  Created by jim Veneskey on 9/14/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    @IBAction func play(sender: AnyObject) {
    
        player.play()
    }
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) {
    
        player.volume = volumeSlider.value
        
    }
    
    @IBOutlet var scrubSlider: UISlider!
    
    
    @IBAction func scrub(sender: AnyObject) {
    
        player.currentTime = NSTimeInterval(scrubSlider.value)
        
    }
    
    
    @IBAction func pause(sender: AnyObject) {
    
        player.pause()
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        
        // Pause the playback
        player.pause()
        // Reset the playback to the beginning
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            
            print("Something went wrong setting up the player")
        }
    
    }

    func updateScrubSlider() {
        print("Auto-Updating the scrub slider")
        
        // read the player's current duration
        scrubSlider.value = Float(player.currentTime)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
        try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
        } catch {
            
            print("Something went wrong setting up the player")
        }
        
        // create an annonymous timer, since we don't need to refer to it by name
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateScrubSlider", userInfo: nil, repeats: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

