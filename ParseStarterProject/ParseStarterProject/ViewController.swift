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
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    @IBAction func signUo(sender: AnyObject) {
        
        if username.text == "" || password.text == "" {
            
            // error alert
            displayAlert("Error in Form", message: "Please enter a username and password")
            
        } else {
            print("username and password are non-null")
            // Add spinner while signing up
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            
            // add it to the view
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            // disable user input
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            // Create our new user
            let user = PFUser()
            user.username = username.text
            user.password = password.text
            // generic error message
            var errorMessage = "Please try again later"
            
            user.signUpInBackgroundWithBlock( { (success, error) -> Void in
              
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil {
                    
                    // success
                    print("Successfully signed up new user")
                } else {
                    
                    // error
                    if let errorString = error!.userInfo["error"] as? String {
                        
                        errorMessage = errorString
                        
                    }
                    
                    self.displayAlert("Failed SignUp", message: errorMessage)
                    
                    
                }
                
            })
            
            
        }
        
    }
    
    @IBAction func logIn(sender: AnyObject) {
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

