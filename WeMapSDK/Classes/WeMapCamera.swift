import Mapbox

public class WeMapCamera: NSObject {
    private var camera : MGLMapCamera
    
    public init(centerCoordinate: CLLocationCoordinate2D, altitude: CLLocationDistance, pitch: CGFloat, heading: CLLocationDirection){
        self.camera = MGLMapCamera(lookingAtCenter: centerCoordinate, altitude: altitude, pitch: pitch, heading: heading)
    }
    
    public init(centerCoordinate: CLLocationCoordinate2D, acrossDistance: CLLocationDistance, pitch: CGFloat, heading: CLLocationDirection){
        self.camera = MGLMapCamera(lookingAtCenter: centerCoordinate, acrossDistance: acrossDistance, pitch: pitch, heading: heading)
    }
    
    public func getCamera() -> MGLMapCamera {
        return self.camera
    }
}
