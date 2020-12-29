import CoreLocation

public class WeMapPlace {
    public var placeId: String
    
    public var location: CLLocationCoordinate2D
    
    public var placeName: String
    
    public var street: String
    
    public var ward: String
    
    public var district: String
    
    public var city: String
    
    public var housenumber: String
    
    public init(){
        self.placeId = ""
        self.placeName = ""
        self.street = ""
        self.ward = ""
        self.district = ""
        self.city = ""
        self.housenumber = ""
        self.location = CLLocationCoordinate2D()
    }
    
    public init(_ place: NSDictionary){
        self.placeId = ""
        self.placeName = ""
        self.street = ""
        self.ward = ""
        self.district = ""
        self.city = ""
        self.housenumber = ""
        self.location = CLLocationCoordinate2D()
        if let properties = place["properties"] as? NSDictionary {
            if let placeId = properties["id"] as? String {
                self.placeId = placeId
            }
            if let placeName = properties["name"] as? String {
                self.placeName = placeName
            }
            if let street = properties["street"] as? String {
                self.street = street
            }
            if let ward = properties["locality"] as? String {
                self.ward = ward
            }
            if let district = properties["county"] as? String {
                self.district = district
            }
            if let city = properties["region"] as? String {
                self.city = city
            }
            if let housenumber = properties["housenumber"] as? String {
                self.housenumber = housenumber
            }
        }
        
        if let geometry = place["geometry"] as? NSDictionary {
            if let coordinates = geometry["coordinates"] as? NSArray {
                var latitude = 0.0
                var longitude = 0.0
                if let lat = coordinates[1] as? Double { // 5
                    latitude = lat
                }
                if let lon = coordinates[0] as? Double { // 5
                    longitude = lon
                }
                self.location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            }
        }
    }
    
    public func toString() -> String {
        var strings = [String]()
        if(self.placeName != ""){
            strings.append(self.placeName)
        }
        if(self.housenumber != ""){
            strings.append(self.housenumber)
        }
        if(self.street != ""){
            strings.append(self.street)
        }
        if(self.ward != ""){
            strings.append(self.ward)
        }
        if(self.district != ""){
            strings.append(self.district)
        }
        if(self.city != ""){
            strings.append(self.city)
        }
        return strings.joined(separator: ", ")
    }
    
    //    public init(_ json: Data){
    //        self.placeId = json.
    //        self.placeName = ""
    //        self.street = ""
    //        self.ward = ""
    //        self.district = ""
    //        self.city = ""
    //        self.housenumber = ""
    //        self.location = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    //    }
}
