//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by Jim Veneskey on 9/18/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.valueForKey("timeStamp")!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


/*

BLOG STUFF

https://www.googleapis.com/blogger/v3/blogs/byurl?url=http://bifftech.blogspot.com/&key=AIzaSyBWVDC6NHZX7P6GRtdPrUWpECEixmAX6NQ



{
"kind": "blogger#blog",
"id": "6889056965376595624",
"name": "“We're lost, but we're making good time”",
"description": "One of many classic Yogi Berra quotes.",
"published": "2007-05-01T11:25:08-04:00",
"updated": "2015-09-17T02:53:51-04:00",
"url": "http://bifftech.blogspot.com/",
"selfLink": "https://www.googleapis.com/blogger/v3/blogs/6889056965376595624",
"posts": {
"totalItems": 34,
"selfLink": "https://www.googleapis.com/blogger/v3/blogs/6889056965376595624/posts"
},
"pages": {
"totalItems": 0,
"selfLink": "https://www.googleapis.com/blogger/v3/blogs/6889056965376595624/pages"
},
"locale": {
"language": "en",
"country": "US",
"variant": ""
}
}
*/
