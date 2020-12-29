import CoreLocation
import Foundation

public class WeMapSearch {
    public required init(){
        
    }
    private func buildSearchURL(_ query: String, wemapSearchOptions: WeMapSearchOptions) -> String {
        let wemapConstant = WeMapConstants()
        
        var searchURL = String(format: "%@&lang=vi-vn&text=%@", wemapConstant.getWeMapSearchAPI(), query.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)
        searchURL = String(format: "%@&size=%@", searchURL, String(wemapSearchOptions.size))
        if(wemapSearchOptions.focusPoint.latitude > 0){
            searchURL = String(format: "%@&location.lat=%@&location.lon=%@", searchURL, String(wemapSearchOptions.focusPoint.latitude), String(wemapSearchOptions.focusPoint.longitude))
        }
        if(wemapSearchOptions.latLngBounds.minLon != 0){
            searchURL = String(format: "%@&@", searchURL, wemapSearchOptions.latLngBounds.getSearchString())
        }
        return searchURL
    }
    
    private func buildReverseURL(_ point: CLLocationCoordinate2D, wemapSearchOptions: WeMapSearchOptions) -> String {
        let wemapConstant = WeMapConstants()
        
        var reverseURL = String(format: "%@&lang=vi-vn&point.lat=%@&point.lon=%@", wemapConstant.getWeMapReverseAPI(), String(point.latitude), String(point.longitude))
        reverseURL = String(format: "%@&size=%@", reverseURL, String(wemapSearchOptions.size))
        return reverseURL
    }
    
    public func search(_ query: String, completeHandler: @escaping ([WeMapPlace]) -> Void) {
        var places = [WeMapPlace]()
        
        let searchUrl = self.buildSearchURL(query, wemapSearchOptions: WeMapSearchOptions(10))
        let request = NSMutableURLRequest(url: URL(string: searchUrl)!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    // try to read out a string array
                    if let features = json["features"] as? [NSDictionary] {
                        
                        for feature in features {
                            places.append(WeMapPlace(feature))
                        }
                        completeHandler(places)
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completeHandler(places)
            }
        })
        
        task.resume()
    }
    
    public func search(_ query: String, wemapSearchOptions: WeMapSearchOptions, completeHandler: @escaping ([WeMapPlace]) -> Void) {
        var places = [WeMapPlace]()
        
        let searchUrl = self.buildSearchURL(query, wemapSearchOptions: wemapSearchOptions)
        let request = NSMutableURLRequest(url: URL(string: searchUrl)!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    // try to read out a string array
                    if let features = json["features"] as? [NSDictionary] {
                        
                        for feature in features {
                            places.append(WeMapPlace(feature))
                        }
                        completeHandler(places)
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completeHandler(places)
            }
        })
        
        task.resume()
    }
    
    public func reverse(_ point: CLLocationCoordinate2D, completeHandler: @escaping ([WeMapPlace]) -> Void) {
        var places = [WeMapPlace]()
        
        let reverseURL = self.buildReverseURL(point, wemapSearchOptions: WeMapSearchOptions(1))
        let request = NSMutableURLRequest(url: URL(string: reverseURL)!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    // try to read out a string array
                    if let features = json["features"] as? [NSDictionary] {
                        
                        for feature in features {
                            places.append(WeMapPlace(feature))
                        }
                        completeHandler(places)
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completeHandler(places)
            }
        })
        
        task.resume()
    }
    
    public func reverse(_ point: CLLocationCoordinate2D, wemapSearchOptions: WeMapSearchOptions, completeHandler: @escaping ([WeMapPlace]) -> Void) {
        var places = [WeMapPlace]()
        
        let reverseURL = self.buildReverseURL(point, wemapSearchOptions: wemapSearchOptions)
        print(reverseURL)
        let request = NSMutableURLRequest(url: URL(string: reverseURL)!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    // try to read out a string array
                    if let features = json["features"] as? [NSDictionary] {
                        
                        for feature in features {
                            places.append(WeMapPlace(feature))
                        }
                        completeHandler(places)
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completeHandler(places)
            }
        })
        
        task.resume()
    }
}
