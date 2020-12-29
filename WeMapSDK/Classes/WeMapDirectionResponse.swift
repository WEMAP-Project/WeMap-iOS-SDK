import CoreLocation
import Foundation

public class WeMapDirectionResponse {
    public var distance: Double
    public var weight: Double
    public var time: Int
    public var originPoint: CLLocationCoordinate2D
    public var destinationPoint: CLLocationCoordinate2D
    public var pathLine: Data
    public var transfers: Double
    public var points: [CLLocationCoordinate2D]
    public var waypoints: [CLLocationCoordinate2D]
    public var instructions: [WeMapInstruction]
    
    public init(){
        self.distance = 0.0
        self.weight = 0.0
        self.time = 0
        self.originPoint = CLLocationCoordinate2D()
        self.destinationPoint = CLLocationCoordinate2D()
        self.pathLine = Data()
        self.transfers = 0.0
        self.points = [CLLocationCoordinate2D]()
        self.waypoints = [CLLocationCoordinate2D]()
        self.instructions = [WeMapInstruction]()
    }
    
    public init(_ path: NSDictionary){
        self.distance = 0.0
        self.weight = 0.0
        self.time = 0
        self.originPoint = CLLocationCoordinate2D()
        self.destinationPoint = CLLocationCoordinate2D()
        self.pathLine = Data()
        self.transfers = 0.0
        self.points = [CLLocationCoordinate2D]()
        self.waypoints = [CLLocationCoordinate2D]()
        self.instructions = [WeMapInstruction]()
        if let distance = path["distance"] as? Double {
            self.distance = distance
        }
        if let weight = path["weight"] as? Double {
            self.weight = weight
        }
        if let transfers = path["transfers"] as? Double {
            self.transfers = transfers
        }
        if let time = path["distance"] as? Int {
            self.time = time
        }
        if let instructions = path["instructions"] as? NSArray {
            for index in 0..<(instructions.count-1) {
                if let instruction = instructions[index] as? NSDictionary{
                    self.instructions.append(WeMapInstruction(instruction))
                }
            }
        }
        if let points = path["points"] as? NSDictionary {
            do {
                self.pathLine = try JSONSerialization.data(withJSONObject: points, options: JSONSerialization.WritingOptions.prettyPrinted)
                //                        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                //                        self.pointsString = String(json!)
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        if let snapped_waypoints = path["snapped_waypoints"] as? NSDictionary {
            if let coordinates = snapped_waypoints["coordinates"] as? NSArray {
                for index in 0..<(coordinates.count-1) {
                    if let point = coordinates[index] as? NSArray{
                        var lat = 0.0
                        var lon = 0.0
                        if let latitude = point[1] as? Double{
                            lat = latitude
                        }
                        if let longtitude = point[1] as? Double{
                            lon = longtitude
                        }
                        let p = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                        self.waypoints.append(p)
                        if(index == 0){
                            self.originPoint = p
                        }
                        if(index == coordinates.count-1){
                            self.destinationPoint = p
                        }
                    }
                }
            }
        }
    }
}

public class WeMapInstruction{
    public var distance: Double
    public var heading: Double
    public var sign: Int
    public var time: Int
    public var text: String
    public var street_name: String
    public var interval: [Int]
    
    public init(){
        self.distance = 0.0
        self.heading = 0.0
        self.sign = 0
        self.time = 0
        self.text = ""
        self.street_name = ""
        self.interval = [Int]()
    }
    
    public init(_ instruction: NSDictionary){
        self.distance = 0.0
        self.heading = 0.0
        self.sign = 0
        self.time = 0
        self.text = ""
        self.street_name = ""
        self.interval = [Int]()
        
        if let distance = instruction["distance"] as? Double{
            self.distance = distance
        }
        
        if let heading = instruction["heading"] as? Double{
            self.heading = heading
        }
        
        if let sign = instruction["sign"] as? Int{
            self.sign = sign
        }
        
        if let time = instruction["time"] as? Int{
            self.time = time
        }
        
        if let text = instruction["text"] as? String{
            self.text = text
        }
        
        if let street_name = instruction["street_name"] as? String{
            self.street_name = street_name
        }
        
        if let interval = instruction["interval"] as? NSArray{
            if let firstInterval = interval[0] as? Int{
                self.interval.append(firstInterval)
            }
            if let secondInterval = interval[1] as? Int{
                self.interval.append(secondInterval)
            }
        }
    }
}
