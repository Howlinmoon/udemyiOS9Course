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

