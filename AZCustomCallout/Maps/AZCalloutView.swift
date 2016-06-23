//
//  AZCalloutView.swift
//  AZCustomCallout
//
//  Created by Alexander Andronov on 23/06/16.
//  Copyright © 2016 Alexander Andronov. All rights reserved.
//

import Foundation
import UIKit

class AZCalloutView : UIView {
    func style() {
        layer.borderColor = UIColor.blackColor().CGColor
        layer.borderWidth = 1
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let viewPoint = superview?.convertPoint(point, toView: self) ?? point
    
        let view = super.hitTest(viewPoint, withEvent: event)
    
        return view
    }
    
    @IBAction func buttonTouched(sender: AnyObject) {
        print("Hello from NY")
    }
}
