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
    fileprivate var calloutView: AZCalloutView?
    fileprivate var hitOutside:Bool = true
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        let calloutViewAdded = calloutView?.superview != nil
        
        if (selected || !selected && hitOutside) {
            super.setSelected(selected, animated: animated)
        }
        
        self.superview?.bringSubview(toFront: self)
        
        if (calloutView == nil) {
            calloutView = UINib(nibName: "AZCallout", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? AZCalloutView
        }
        
        if (self.isSelected && !calloutViewAdded) {
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
            bringSubview(toFront: calloutView!)
        }
        
        if (!self.isSelected) {
            calloutView?.removeFromSuperview()
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var hitView = super.hitTest(point, with: event)
        
        if hitView == nil && self.isSelected {
            let pointInCallout = convert(point, to: calloutView)
            hitView = calloutView!.hitTest(pointInCallout, with: event)
        }
        
        if let callout = calloutView {
            if (hitView == nil && self.isSelected) {
                hitView = callout.hitTest(point, with: event)
            }
        }
        
        hitOutside = hitView == nil
        
        return hitView;
    }
}
