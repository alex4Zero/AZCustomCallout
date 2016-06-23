# AZCustomCallout
Here is an example of custom callout view for iOS MapKit implemented in Swift 2

![alt tag](https://github.com/alex4Zero/AZCustomCallout/blob/master/screenshots/small-screenshot.png?raw=true)

## Steps to implement
* Add XIB with custom callout
* Create custom class inherited from UIView and assign it to XIB view
* Overwrite `hitTest` function:
```swift
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let viewPoint = superview?.convertPoint(point, toView: self) ?? point
    
        let view = super.hitTest(viewPoint, withEvent: event)
    
        return view
    }
```
* Create custom Annotation inherited implemented MKAnnotation
* Create custom View implemented MKAnnotationView (or MKPinAnnotationView if you are fine with standard red pin)
* Overwrite `setSelected` function to manually create and add callout view (see [example](https://github.com/alex4Zero/AZCustomCallout/blob/master/AZCustomCallout/Maps/StatueOfLibertyAnnotationView.swift))
* Overwrite `hitTest` function:
```swift
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
```
* Have fun! :)
