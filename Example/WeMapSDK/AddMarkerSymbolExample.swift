import CoreLocation
import WeMapSDK

class ViewController7: UIViewController, WeMapViewDelegate {
    
    func WeMapViewDidFinishLoadingMap(_ wemapView: WeMapView) {
//        let point = WeMapPointAnnotation(CLLocationCoordinate2D(latitude: 21.0266469, longitude: 105.7615744))
        
        // Create a data source to hold the point data
        let shapeSource = WeMapShapeSource(identifier: "marker-source", url: URL(string: "https://d2ad6b4ur7yvpq.cloudfront.net/naturalearth-3.3.0/ne_10m_ports.geojson")!)
        
        // Create a style layer for the symbol
        let shapeLayer = WeMapSymbolStyleLayer(identifier: "marker-style", source: shapeSource)
        
        // Add the image to the style's sprite
        if let image = UIImage(named: "icon-house") {
            wemapView.setImage(image, forName: "home-symbol")
        }
        
        // Tell the layer to use the image in the sprite
        shapeLayer.iconImageName = NSExpression(forConstantValue: "home-symbol")
        
        // Add the source and style layer to the map
        wemapView.addSource(shapeSource)
        wemapView.addLayer(shapeLayer)
    }
    
    var wemapView: WeMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wemapView = WeMapView(frame: view.bounds)
        
        wemapView.setCenter(CLLocationCoordinate2D(latitude: 21.0266469, longitude: 105.7615744), zoomLevel: 12, animated: false)
        wemapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(wemapView)
        wemapView.delegate = self
    }
}
