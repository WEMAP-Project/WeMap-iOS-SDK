import CoreLocation
import WeMapSDK

class ViewController1: UIViewController, WeMapViewDelegate {
    
    func WeMapViewDidFinishLoadingMap(_ wemapView: WeMapView) {
        
        // Create a data source to hold the point data
        let shapeSource = WeMapShapeSource(identifier: "marker-source", url: URL(string: "https://wemap-project.github.io/WeMap-Web-SDK-Release/demo/data/data.geojson")!)
        
        // Create new layer for the line.
        let layer = WeMapLineStyleLayer(identifier: "polyline", source: shapeSource)
        
        // Set the line join and cap to a rounded end.
        layer.lineJoin = NSExpression(forConstantValue: "round")
        layer.lineCap = NSExpression(forConstantValue: "round")
        
        // Set the line color to a constant blue color.
        layer.lineColor = NSExpression(forConstantValue: UIColor(red: 59/255, green: 178/255, blue: 208/255, alpha: 1))
        
        layer.lineWidth = 10
        
        // Add the source and style layer to the map
        wemapView.addSource(shapeSource)
        wemapView.addLayer(layer)
    }
    
    var wemapView: WeMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wemapView = WeMapView(frame: view.bounds)
        
        wemapView.setCenter(CLLocationCoordinate2D(latitude: 21.0266469, longitude: 105.7615744), zoomLevel: 4, animated: false)
        wemapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(wemapView)
        wemapView.delegate = self
    }
    
}
