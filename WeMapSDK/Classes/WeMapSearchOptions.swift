import CoreLocation

public class WeMapSearchOptions {
    public var size: Int
    
    public var focusPoint: CLLocationCoordinate2D
    
    public var latLngBounds: WeMapLatLonBounds
    
    public init (_ size: Int){
        if(size > 0 && size < 25){
            self.size = size
        } else {
            self.size = 10
        }
        self.focusPoint = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        self.latLngBounds = WeMapLatLonBounds(minLon: 0, minLat: 0, maxLon: 0, maxLat: 0)
    }
    
    public init (_ size: Int, focusPoint: CLLocationCoordinate2D){
        if(size > 0 && size < 25){
            self.size = size
        } else {
            self.size = 10
        }
        self.focusPoint = focusPoint
        self.latLngBounds = WeMapLatLonBounds(minLon: 0, minLat: 0, maxLon: 0, maxLat: 0)
    }
    
    public init (_ size: Int, focusPoint: CLLocationCoordinate2D, latLngBounds: WeMapLatLonBounds){
        if(size > 0 && size < 25){
            self.size = size
        } else {
            self.size = 10
        }
        self.focusPoint = focusPoint
        self.latLngBounds = latLngBounds
    }
}
