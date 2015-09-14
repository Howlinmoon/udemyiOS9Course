//
//  ViewController.swift
//  Working With Audio
//
//  Created by Jim Veneskey on 9/12/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var paused = false
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func play(sender: AnyObject) {
        
        let audioPath = NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            player.play()
        } catch {
            // process error here if any
            
        }

    }
    
    @IBAction func pause(sender: AnyObject) {
        
        if paused == false {
            player.pause()
            paused = true
        } else {
            player.play()
            paused = false
        }
    
    }
    
    @IBAction func adjustVolume(sender: AnyObject) {
    
        player.volume = slider.value
        
    }
    
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

