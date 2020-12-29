import Mapbox

public class WeMapFillStyleLayer {
    private var mglFillStyleLayer: MGLFillStyleLayer
    
    private var  lineWidthConst: Int
    
    public var fillOpacity: NSExpression! { get {
        self.mglFillStyleLayer.fillOpacity
    }
    set {
        self.mglFillStyleLayer.fillOpacity = newValue
    } }
    
    public var fillColor: NSExpression! { get {
        self.mglFillStyleLayer.fillColor
    }
    set {
        self.mglFillStyleLayer.fillColor = newValue
    } }
    
    public required init(identifier: String, source: WeMapShapeSource){
        self.mglFillStyleLayer = MGLFillStyleLayer(identifier: identifier, source: source.getShapeSource()!)
        self.lineWidthConst = 20
    }
    
    public func getFillStyleLayer() -> MGLFillStyleLayer{
        return self.mglFillStyleLayer
    }
    
}

