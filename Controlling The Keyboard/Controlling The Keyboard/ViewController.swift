//
//  ViewController.swift
//  Controlling The Keyboard
//
//  Created by jim Veneskey on 9/2/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var theLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        // get the contents of the text field
        let contents = textField.text
        print("contents of the textField: \(contents)")
        
        // set the label text with the text field
        theLabel.text = contents
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // close the keyboard if the user touches outside of the text field
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // close the keyboard via the return button
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    


}

