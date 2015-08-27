//
//  ViewController.swift
//  Guessing Game
//
//  Created by jim Veneskey on 8/27/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomNumber = Int(arc4random_uniform(10)+1)
    
    @IBOutlet weak var guessField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func checkGuess(sender: AnyObject) {
        // When this button is pressed, we need to retrieve the number input by the user
        // and compare it to our randomly generated randomNumber
        var resultText = ""
        let inputNumber = Int(guessField.text!)
        if inputNumber == randomNumber {
            resultText = "CORRECT"
            //playAgain.hidden = false
        } else if inputNumber < randomNumber {
            resultText = "LOW"
        } else {
            resultText = "HIGH"
        }
        
        // Update our result label
        resultLabel.text = resultText
        
    }
    
    
    @IBAction func playAgain(sender: AnyObject) {
        // if this button is enabled, clicking it should clear out the old guess
        // clear out the old result
        // and randomize up a new number
        randomNumber = Int(arc4random_uniform(10)+1)
        resultLabel.text = ""
        guessField.text = ""
        // and then, hide itself again
        //playAgain.hidden = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // hide the play again button
        //playAgain.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

