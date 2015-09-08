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
        let latitude:CLLocationDegrees = 41.0838776
        let longitude: CLLocationDegrees = -81.5187311
        
        // Zoom level
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Downtown Akron"
        annotation.subtitle = "Laird Inc"
        
        // add the annotation
        map.addAnnotation(annotation)
        
        // UI Long Press Gesture Recognizer, trailing colon required to pass details to the named function 'action'
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        
        // how long does the user have to press to recognize this?
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
    
    }
    
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        print("You performed a long press")
        
        // co-ordinates relative to the map in the view
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView:self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "Not Sure Where"
        
        // add the annotation
        map.addAnnotation(annotation)

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

