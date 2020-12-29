import Mapbox

open class WeMapPointAnnotation: WeMapAnnotation {
    private var annotaion: MGLPointAnnotation
    
    public var coordinate: CLLocationCoordinate2D { get {
        self.annotaion.coordinate
    }
    set {
        self.annotaion.coordinate = newValue
    } }
    
    public var title: String? { get {
        self.annotaion.title
    }
    set {
        self.annotaion.title = newValue
    } }
    
    public var subtitle: String? { get {
        self.annotaion.subtitle
    }
    set {
        self.annotaion.subtitle = newValue
    } }
    
    public init(_ coordinate: CLLocationCoordinate2D) {
        self.annotaion = MGLPointAnnotation()
        self.annotaion.coordinate = coordinate
    }
    
    public init( annotation: MGLPointAnnotation) {
        self.annotaion = annotation
    }
    
    public func getAnnotation() -> MGLAnnotation {
        return self.annotaion
    }
}
