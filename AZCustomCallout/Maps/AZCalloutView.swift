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
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let viewPoint = superview?.convert(point, to: self) ?? point
    
        let view = super.hitTest(viewPoint, with: event)
    
        return view
    }
    
    @IBAction func buttonTouched(_ sender: AnyObject) {
        print("Hello from NY")
    }
}
