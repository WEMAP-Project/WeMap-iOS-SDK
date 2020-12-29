public class WeMapLatLonBounds {
    public var minLon: Double
    public var minLat: Double
    public var maxLon: Double
    public var maxLat: Double
    
    public required init(minLon: Double, minLat: Double, maxLon: Double, maxLat: Double){
        self.minLon = minLon
        self.minLat = minLat
        self.maxLon = maxLon
        self.maxLat = maxLat
    }
    
    public func getSearchString() -> String {
        return String(format: "bbox.min_lon=%@&bbox.min_lat=%@&bbox.max_lon=%@&bbox.max_lat=%@", String(self.minLon), String(self.minLat), String(self.maxLon), String(self.maxLat))
    }
}
