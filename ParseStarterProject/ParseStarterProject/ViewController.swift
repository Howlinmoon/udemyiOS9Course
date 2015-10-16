//
//  ViewController.swift
//
//  Instagram Clone
//  2015/10/15 Jim Veneskey

import UIKit
import Parse

class ViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signUo(sender: AnyObject) {
        
        if username.text == "" || password.text == "" {
            let alert = UIAlertController(title: "Error in Form", message: "Please enter a username and password", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
                
            })))
            
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            print("username and password are non-null")
        }
        
    }
    
    @IBAction func logIn(sender: AnyObject) {
    
    }
    
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

