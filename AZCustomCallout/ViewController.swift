//
//  ViewController.swift
//  AZCustomCallout
//
//  Created by Alexander Andronov on 23/06/16.
//  Copyright © 2016 Alexander Andronov. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    private var statueOfLibertyAnnotation: StatueOfLibertyAnnotation!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        statueOfLibertyAnnotation = StatueOfLibertyAnnotation()
        mapView.delegate = self
        mapView.addAnnotation(statueOfLibertyAnnotation)
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        return StatueOfLibertyAnnotationView(annotation: statueOfLibertyAnnotation, reuseIdentifier: "StatueOfLibertyAnnotation")
    }
}

