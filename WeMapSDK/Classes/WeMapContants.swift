//
//  WeMapContants.swift
//  WeMapSDK
//
//  Created by Draku Quay on 12/14/20.
//

import Foundation

public class WeMapConstants{
    private let WEMAP_BASIC = "https://apis.wemap.asia/vector-tiles/styles/osm-bright/style.json"
    
    private let WEMAP_SEARCH_API = "https://apis.wemap.asia/geocode-1/search"
    private let WEMAP_REVERSE_API = "https://apis.wemap.asia/geocode-1/reverse"
    private let WEMAP_DIRECION_API = "https://apis.wemap.asia/route-api/route"
    
    public func getWeMapAPIKey() -> String {
        guard let key = Bundle.main.infoDictionary?["WeMapAPIKey"] as? String else {
            fatalError("You have to config WeMap API Key first")
        }
        return key
    }
    
    public func getWeMapBasicStyle() -> URL{
        guard let basicURL = URL(string: WEMAP_BASIC + "?key=" + getWeMapAPIKey()) else {
            fatalError("You have to config WeMap API Key first")
        }
        return basicURL
    }
    
    public func getWeMapSearchAPI() -> String{
        return String(format: "%@?key=%@", WEMAP_SEARCH_API, getWeMapAPIKey())
    }
    
    public func getWeMapReverseAPI() -> String{
        return String(format: "%@?key=%@", WEMAP_REVERSE_API, getWeMapAPIKey())
    }
    
    public func getWeMapDirectionAPI() -> String{
        return String(format: "%@?key=%@", WEMAP_DIRECION_API, getWeMapAPIKey())
    }
}
