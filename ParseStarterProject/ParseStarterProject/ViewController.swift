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
    
    @IBOutlet weak var registeredText: UILabel!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // our app's current mode
    var signupActive = true
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    // Typo'd on signUp (!)  used for both sign up and login
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
            
            var errorMessage = "Please try again later"
            
            if signupActive == true {
            
                // Create our new user
                let user = PFUser()
                user.username = username.text
                user.password = password.text
                // generic error message
            
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
            
            } else {
                // must be logging in
                
                PFUser.logInWithUsernameInBackground(username.text!, password: password.text!, block:
                    { (user, error) -> Void in
                  
                        print("Trying to login?")
                        
                        if error != nil {
                            // Logged in
                            print("Logged In!")
                            self.activityIndicator.stopAnimating()
                            UIApplication.sharedApplication().endIgnoringInteractionEvents()

                        } else {
                            // error
                            if let errorString = error!.userInfo["error"] as? String {
                                
                                errorMessage = errorString
                                
                            }
                            
                            self.displayAlert("Failed Login", message: errorMessage)
                            
                        }
                })
                
            }
            
        }
        
    }
    
    @IBAction func logIn(sender: AnyObject) {
    
        if signupActive == true {
            signupButton.setTitle("Log In", forState: UIControlState.Normal)
            registeredText.text = "Not registered?"
            loginButton.setTitle("Sign Up", forState: UIControlState.Normal)
            signupActive = false
        } else {
            // other mode
            signupButton.setTitle("Sign Up", forState: UIControlState.Normal)
            registeredText.text = "Already registered?"
            loginButton.setTitle("Login", forState: UIControlState.Normal)
            signupActive = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

