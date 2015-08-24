//
//  ViewController.swift
//  Hello World 2
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topLabel: UILabel!

    @IBOutlet weak var numberField: UITextField!
    
    @IBAction func submitPressed(sender: AnyObject) {
        print("Thank you for clicking Submit")
        
        topLabel.text = numberField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

