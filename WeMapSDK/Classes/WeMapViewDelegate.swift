 
import UIKit
 
//
// This is the DELEGATE PROTOCOL
//
@objc public protocol WeMapViewDelegate : AnyObject{
    // Classes that adopt this protocol MUST define
    // this method -- and hopefully do something in
    // that definition.
    @objc optional func WeMapViewDidFinishLoadingMap(_ wemapView:WeMapView)
    
    //Managing Annotation Views
    @objc optional func wemapView(_ weMapView: WeMapView, viewFor annotation: WeMapAnnotation) -> UIView?
    @objc optional func wemapView(_ weMapView: WeMapView, leftCalloutAccessoryViewFor annotation: WeMapAnnotation) -> UIView?
    @objc optional func wemapView(_ weMapView: WeMapView, rightCalloutAccessoryViewFor annotation: WeMapAnnotation) -> UIView?
    @objc optional func wemapView(_ weMapView: WeMapView, annotation: WeMapAnnotation, calloutAccessoryControlTapped control: UIControl)
    
    //Camera
    
    @objc optional func regionDidChangeAnimated(_ weMapView: WeMapView, regionDidChangeAnimated animated: Bool)
    @objc optional func regionWillChangeAnimated(_ weMapView: WeMapView, regionWillChangeAnimated animated: Bool)
//    @objc optional func weMapView(_ weMapView: WeMapView, didAdd annotationViews: [WeMapAnnotationView])
    
    @objc optional func wemapView(_ weMapView: WeMapView, annotationCanShowCallout annotation: WeMapAnnotation) -> Bool
}
