import Mapbox

public class WeMapShapeSource {
    private var shapeSource: MGLShapeSource
    
    public required init(identifier: String, url: URL){
        self.shapeSource = MGLShapeSource(identifier: identifier, url: url, options: nil)
    }
    
    public required init(identifier: String, point: WeMapPointAnnotation?){
        self.shapeSource = MGLShapeSource(identifier: identifier, shape: point?.getAnnotation() as? MGLShape, options: nil)
    }
    
    public required init(identifier: String, points: [WeMapPointAnnotation]){
        var mglPoints = [MGLPointFeature]()
        for point in points {
            mglPoints.append(point.getFeature())
        }
        self.shapeSource = MGLShapeSource(identifier: identifier, features: mglPoints, options: nil)
    }
    
    public required init(identifier: String, data: Data){
        guard let shapeFromGeoJSON = try? MGLShape(data: data, encoding: String.Encoding.utf8.rawValue) else {
        fatalError("Could not generate Shape")
        }
        self.shapeSource = MGLShapeSource(identifier: identifier, shape: shapeFromGeoJSON, options: nil)
    }
    
    func getShapeSource() -> MGLShapeSource? {
        return self.shapeSource
    }
}
