//
//  StatueOfLibertyAnnotationView.swift
//  AZCustomCallout
//
//  Created by Alexander Andronov on 23/06/16.
//  Copyright © 2016 Alexander Andronov. All rights reserved.
//

import Foundation
import MapKit

class StatueOfLibertyAnnotationView : MKPinAnnotationView {
    private var calloutView: AZCalloutView?
    private var hitOutside:Bool = true
    
    override func setSelected(selected: Bool, animated: Bool) {
        let calloutViewAdded = calloutView?.superview != nil
        
        if (selected || !selected && hitOutside) {
            super.setSelected(selected, animated: animated)
        }
        
        self.superview?.bringSubviewToFront(self)
        
        if (calloutView == nil) {
            calloutView = UINib(nibName: "AZCallout", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as? AZCalloutView
        }
        
        if (self.selected && !calloutViewAdded) {
            let width = 181.0
            let height = 155.0
            let calloutHeightOffset = 5.0
            let halfSelfWidth = Double(frame.size.width/2.0)
            let halfWidth = -width/2.0
            let x = halfSelfWidth+halfWidth
            let calloutWidthOffset = 5.0 //depends on pin width
            calloutView!.frame = CGRect(origin: CGPoint(x: x - calloutWidthOffset, y: -height-calloutHeightOffset), size: CGSize(width: width, height: height))
            calloutView!.style()
            
            addSubview(calloutView!)
            bringSubviewToFront(calloutView!)
        }
        
        if (!self.selected) {
            calloutView?.removeFromSuperview()
        }
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        var hitView = super.hitTest(point, withEvent: event)
        
        if hitView == nil && self.selected {
            let pointInCallout = convertPoint(point, toView: calloutView)
            hitView = calloutView!.hitTest(pointInCallout, withEvent: event)
        }
        
        if let callout = calloutView {
            if (hitView == nil && self.selected) {
                hitView = callout.hitTest(point, withEvent: event)
            }
        }
        
        hitOutside = hitView == nil
        
        return hitView;
    }
}