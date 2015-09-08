//
//  ViewController.swift
//  Map Demo
//
//  Created by jim Veneskey on 9/8/15.
//  Copyright © 2015 Jim Veneskey. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // downtown Akron
        var latitude:CLLocationDegrees = 41.0838776
        var longitude: CLLocationDegrees = -81.5187311
        
        // Zoom level
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

