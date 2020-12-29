import CoreLocation
import WeMapSDK

class ViewController3: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let completeHandler: ([WeMapPlace]) -> Void = { wemapPlaces in
            print(wemapPlaces.count)
            print(wemapPlaces[0].toString())
        }
        
        let wemapSearch = WeMapSearch()
        
        //gioi han so luong du lieu tra ve
        let wemapOptions = WeMapSearchOptions(10, focusPoint: CLLocationCoordinate2D(latitude: 21.031772, longitude: 105.799508), latLngBounds: WeMapLatLonBounds(minLon: 104.799508, minLat: 20.031772, maxLon: 105.799508, maxLat: 21.031772))
        
        wemapSearch.search("kfc", wemapSearchOptions: wemapOptions, completeHandler: completeHandler)
//        wemapSearch.reverse(CLLocationCoordinate2D(latitude: 21.031772, longitude: 105.799508), wemapSearchOptions: wemapOptions, completeHandler: completeHandler)
    }
    
}
