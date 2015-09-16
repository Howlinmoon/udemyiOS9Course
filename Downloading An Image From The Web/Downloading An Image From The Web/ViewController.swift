//
//  ViewController.swift
//  Downloading An Image From The Web
//
//  Created by jim Veneskey on 9/16/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://consciouscat.net/wp-content/uploads/2012/03/grey-cat-with-bowl-istockphoto.jpg")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (respone, data, error) -> Void in
            if error != nil {
                print(error)
            } else {
                // create an image
                if let catImage = UIImage(data: data!) {
                 self.image.image = catImage
                    
                    // Now - save the image
                    var documentsDirectory:String?
                    var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                    
                    if paths.count > 0 {
                        documentsDirectory = paths[0] as? String
                        let savePath = documentsDirectory! + "/catPicture.jpg"
                        print(savePath)
                        NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                        self.image.image = UIImage(named: savePath)
                    }
                    
                }
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

