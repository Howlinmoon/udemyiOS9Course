//
//  ViewController.swift
//  Whats The Weather
//
//  Created by jim Veneskey on 9/4/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var cityTextField: UITextField!
    
    @IBOutlet var forecastResults: UILabel!
    
    
    @IBAction func lookupForecastButton(sender: AnyObject) {
        
        var targetCity = cityTextField.text
        if targetCity == "" {
            forecastResults.text = "PLEASE ENTER A CITY NAME ABOVE"
        } else {
            let url = NSURL(string: "http://www.weather-forecast.com/locations/" + targetCity!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")!
            
            
                let separatorStart = "3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
            let separatorEnd = "</span>"
            
            // launching a virtual browser
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, let response, error) -> Void in
                // code executed when the task completes - closure
                
                if let urlContent = data {
                    // checking to see if var data exists
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        //print("data returned via the http session: \(webContent)")
                        let websiteArray = webContent!.componentsSeparatedByString(separatorStart)
                        if websiteArray.count > 1 {
                            let weatherArray = websiteArray[1].componentsSeparatedByString(separatorEnd)
                            if weatherArray.count > 0 {
                                let weatherSummary = weatherArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º ")
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    self.forecastResults.text = weatherSummary
                                })
                                
                            }
                        }
                        
                    })
                    
                } else {
                    
                    self.forecastResults.text = "That appears to be an invalid city name, please try again"
                }
                print("the response code from the sessions: \(response)")
                // 3 Day Weather Forecast Summary:</b><span class="read-more-small"><span class="read-more-content"> <span class="phrase">
            }
            
            task.resume()
        }
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

