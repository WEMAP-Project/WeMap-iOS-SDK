import CoreLocation

public class WeMapDirectionOptions {
    private let VEHICLE_CAR = "car"
    private let VEHICLE_FOOT = "foot"
    private let VEHICLE_BIKE = "bike"
    
    public var vehicle: String
    
    public var instruction = true
    
    
    public init (){
        self.vehicle = "car"
    }
    
    public init (vehicle: String, instruction: Bool){
        self.vehicle = "car"
        if(vehicle == VEHICLE_CAR || vehicle == VEHICLE_BIKE || vehicle == VEHICLE_FOOT){
            self.vehicle = vehicle
        }
        self.instruction = instruction
    }
}
