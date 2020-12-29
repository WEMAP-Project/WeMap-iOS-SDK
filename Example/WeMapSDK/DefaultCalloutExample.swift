import CoreLocation
import WeMapSDK

class ViewController5: UIViewController, WeMapViewDelegate {
    
    var wemapView: WeMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wemapView = WeMapView(frame: view.bounds)
        
        wemapView.setCenter(CLLocationCoordinate2D(latitude: 21.0266469, longitude: 105.7615744), zoomLevel: 2, animated: false)
        wemapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(wemapView)
        wemapView.delegate = self
    }
    
    
    func WeMapViewDidFinishLoadingMap(_ wemapView: WeMapView) {
        
        let coordinates = [
            CLLocationCoordinate2D(latitude: 21.0767899, longitude: 105.8426627),
            CLLocationCoordinate2D(latitude: 21.0467899, longitude: 105.8636627),
            CLLocationCoordinate2D(latitude: 21.0567899, longitude: 105.8756627)
        ]
        
        // Fill an array with point annotations and add it to the map.
        var pointAnnotations = [WeMapPointAnnotation]()
        for coordinate in coordinates {
            let point = WeMapPointAnnotation(coordinate)
            point.title = "\(coordinate.latitude), \(coordinate.longitude)"
            pointAnnotations.append(point)
        }
        
        wemapView.addAnnotations(pointAnnotations)
        let annotation = WeMapPointAnnotation(CLLocationCoordinate2D(latitude: 21.0367899, longitude: 105.8346627))
        annotation.title = "Ho Chi Minh Mausoleum"
        annotation.subtitle = "\(annotation.coordinate.latitude), \(annotation.coordinate.longitude)"
        
        wemapView.addAnnotation(annotation)
        
        // Center the map on the annotation.
        wemapView.setCenter(annotation.coordinate, zoomLevel: 10, animated: false)
        
        // Pop-up the callout view.
        wemapView.selectAnnotation(annotation, animated: true, completionHandler: {})
    }
    
    func wemapView(_ wemapView: WeMapView, annotationCanShowCallout annotation: WeMapAnnotation) -> Bool {
        return true
    }
    
    func wemapView(_ wemapView: WeMapView, leftCalloutAccessoryViewFor annotation: WeMapAnnotation) -> UIView? {
        if (annotation.title! == "Ho Chi Minh Mausoleum") {
            // Callout height is fixed; width expands to fit its content.
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
            label.textAlignment = .right
            label.textColor = UIColor(red: 0.81, green: 0.71, blue: 0.23, alpha: 1)
            label.text = "霊廟"
            
            return label
        }
        
        return nil
    }
    
    func wemapView(_ wemapView: WeMapView, rightCalloutAccessoryViewFor annotation: WeMapAnnotation) -> UIView? {
        return UIButton(type: .detailDisclosure)
    }
    
    func wemapView(_ wemapView: WeMapView, annotation: WeMapAnnotation, calloutAccessoryControlTapped control: UIControl) {
        // Hide the callout view.
        wemapView.deselectAnnotation(annotation, animated: false)
        
        // Show an alert containing the annotation's details
        let alert = UIAlertController(title: annotation.title!!, message: "A lovely (if touristy) place.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
