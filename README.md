# AZCustomCallout
Here is an example of custom callout view for iOS MapKit implemented with Swift 3

![alt tag](https://github.com/alex4Zero/AZCustomCallout/blob/master/screenshots/small-screenshot.png?raw=true)

## Steps to implement
* Add XIB with custom callout
* Create custom class inherited from UIView and assign it to XIB view
* Overwrite `hitTest` function:
```swift
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let viewPoint = superview?.convert(point, to: self) ?? point
    
        let view = super.hitTest(viewPoint, with: event)
    
        return view
    }
```
* Create custom Annotation inherited implemented MKAnnotation
* Create custom View implemented MKAnnotationView (or MKPinAnnotationView if you are fine with standard red pin)
* Overwrite `setSelected` function to manually create and add callout view (see [example](https://github.com/alex4Zero/AZCustomCallout/blob/master/AZCustomCallout/Maps/StatueOfLibertyAnnotationView.swift))
* Overwrite `hitTest` function:
```swift
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
```
* Have fun! :)
