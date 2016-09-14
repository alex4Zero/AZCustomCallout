//
//  StatueOfLibertyAnnotation.swift
//  AZCustomCallout
//
//  Created by Alexander Andronov on 23/06/16.
//  Copyright © 2016 Alexander Andronov. All rights reserved.
//

import Foundation
import MapKit

class StatueOfLibertyAnnotation : NSObject, MKAnnotation {
    internal fileprivate(set) var title: String?
    internal fileprivate(set) var coordinate: CLLocationCoordinate2D
    
    override init() {
        self.title = "The Statue of Liberty"
        self.coordinate = CLLocationCoordinate2D(latitude: 40.6892, longitude: -74.0445)
    }
}
