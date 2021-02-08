import CoreLocation
import WeMapSDK

class ViewController: UIViewController, WeMapViewDelegate {
    
    func WeMapViewDidFinishLoadingMap(_ wemapView: WeMapView) {
        let camera = WeMapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 21.0266469, longitude: 106.7615744), altitude: 4500, pitch: 15, heading: 180)
        wemapView.setCamera(camera: camera, withDuration: 5, animationTimingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
//        wemapView.addWMSLayer(layerID: "osm-layer", wmsURL: "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png", tileSize: 256)
        //wemapView.removeWMSLayer(layerID: "osm-layer")
    }
    
    func regionDidChangeAnimated(_ wemapView: WeMapView, regionDidChangeAnimated animated: Bool) {
        print("Region did change")
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
