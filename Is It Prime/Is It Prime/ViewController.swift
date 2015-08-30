//
//  ViewController.swift
//  Is It Prime
//
//  Created by jim Veneskey on 8/28/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBAction func isitPrime(sender: AnyObject) {
        
        let number = Int(numberTextField.text!)!
        
        var isPrime = true
        
        if number == 1 {
            isPrime = true
        } else if number == 2 {
            isPrime = false
        } else if number > 2 {
            
            for var i = 2; i < number; i++ {
                
                if number % i == 0 {
                    print("This number is NOT a prime - \(i) is a factor")
                    isPrime = false
                }
            }
        }
        print(isPrime)
        
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

