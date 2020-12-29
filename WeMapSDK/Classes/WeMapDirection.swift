import CoreLocation
import Foundation

public class WeMapDirection {
    public required init(){
        
    }
    private func buildDirectionURL(_ points: [CLLocationCoordinate2D], wemapDirectionOptions: WeMapDirectionOptions) -> String {
        let wemapConstant = WeMapConstants()
        
        var directionURL = String(format: "%@&locale=vi-VN&points_encoded=false&type=json", wemapConstant.getWeMapDirectionAPI())
        for point in points {
            let pointString = String(format: "%@,%@", String(point.latitude), String(point.longitude))
            directionURL = String(format: "%@&point=%@", directionURL, pointString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)
        }
        directionURL = String(format: "%@&vehicle=%@", directionURL, wemapDirectionOptions.vehicle)
        directionURL = String(format: "%@&instructions=%@", directionURL, String(wemapDirectionOptions.instruction))
        return directionURL
    }
    
    public func route(_ points: [CLLocationCoordinate2D], wemapDirectionOptions: WeMapDirectionOptions, completeHandler: @escaping ([WeMapDirectionResponse]) -> Void) {
        var pathsResult = [WeMapDirectionResponse]()
        let routeURL = self.buildDirectionURL(points, wemapDirectionOptions: wemapDirectionOptions)
        let request = NSMutableURLRequest(url: URL(string: routeURL)!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    // try to read out a string array
                    if let paths = json["paths"] as? [NSDictionary] {
                        for path in paths {
                            pathsResult.append(WeMapDirectionResponse(path))
                        }
                        completeHandler(pathsResult)
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completeHandler(pathsResult)
            }
        })
        
        task.resume()
    }
    
}
