import CoreLocation
import WeMapSDK

class ViewController8: UIViewController, WeMapViewDelegate {
    
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
        // Create a data source to hold the point data
        let shapeSource = WeMapShapeSource(identifier: "home-source", points: pointAnnotations)
        
        // Create a style layer for the symbol
        let shapeLayer = WeMapSymbolStyleLayer(identifier: "home-symbols", source: shapeSource)
        
        // Add the image to the style's sprite
        if let image = UIImage(named: "icon-house") {
            wemapView.setImage(image, forName: "icon-house")
        }
        
        // Tell the layer to use the image in the sprite
        shapeLayer.iconImageName = NSExpression(forConstantValue: "icon-house")
        
        // Add the source and style layer to the map
        wemapView.addSource(shapeSource)
        wemapView.addLayer(shapeLayer)
        
        // Add a single tap gesture recognizer. This gesture requires the built-in WeMapView tap gestures (such as those for zoom and annotation selection) to fail.
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleMapTap(sender:)))
        for recognizer in wemapView.getGestureRecognizers() where recognizer is UITapGestureRecognizer {
            singleTap.require(toFail: recognizer)
        }
        wemapView.addGestureRecognizer(singleTap)
    }
    
    func wemapView(_ wemapView: WeMapView, annotationCanShowCallout annotation: WeMapAnnotation) -> Bool {
        return true
    }
    
    var wemapView: WeMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wemapView = WeMapView(frame: view.bounds)
        wemapView?.setCenter(CLLocationCoordinate2D(latitude: 21.0266469, longitude: 105.7615744), zoomLevel: 4, animated: false)
        wemapView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //Hide callout default symbol
        wemapView?.noCalloutMarker = true
        view.addSubview(wemapView!)
        
        wemapView?.delegate = self
        
        wemapView?.userTrackingMode = .follow
        
    }
    
    // MARK: - Feature interaction
    @objc @IBAction func handleMapTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            // Limit feature selection to just the following layer identifiers.
            let layerIdentifiers: Set = ["home-symbols"]
            // Try matching the exact point first.
            let point = sender.location(in: sender.view!)
            for pointAnnotation in wemapView?.visibleFeatures(at: point, styleLayerIdentifiers: layerIdentifiers) ?? []{
                wemapView?.selectAnnotation(pointAnnotation, animated: false, completionHandler: {})
                return
            }
            
            let touchCoordinate = wemapView?.convert(point, toCoordinateFrom: sender.view!)
            let touchLocation = CLLocation(latitude: touchCoordinate?.latitude ?? 0.0, longitude: touchCoordinate?.longitude ?? 0.0)
            
            // Otherwise, get all features within a rect the size of a touch (44x44).
            let touchRect = CGRect(origin: point, size: .zero).insetBy(dx: -22.0, dy: -22.0)
            let possibleFeatures = wemapView?.visibleFeatures(inCGRect: touchRect, styleLayerIdentifiers: Set(layerIdentifiers))
            
            // Select the closest feature to the touch center.
            let closestFeatures = possibleFeatures?.sorted(by: {
                return CLLocation(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude).distance(from: touchLocation) < CLLocation(latitude: $1.coordinate.latitude, longitude: $1.coordinate.longitude).distance(from: touchLocation)
            })
            if let feature = closestFeatures?.first {
                wemapView?.selectAnnotation(feature, animated: false, completionHandler: {})
                return
            }
            
            // If no features were found, deselect the selected annotation, if any.
            wemapView?.deselectFirstAnnotation(animated: true)
        }
    }
}
