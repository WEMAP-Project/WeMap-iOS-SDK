import Mapbox

public class WeMapLineStyleLayer {
    private var mglLineStyleLayer: MGLLineStyleLayer
    
    private var  lineWidthConst: Int
    
    public var lineJoin: NSExpression! { get {
        self.mglLineStyleLayer.lineJoin
    }
    set {
        self.mglLineStyleLayer.lineJoin = newValue
    } }
    
    public var lineCap: NSExpression! { get {
        self.mglLineStyleLayer.lineCap
    }
    set {
        self.mglLineStyleLayer.lineCap = newValue
    } }
    
    public var lineColor: NSExpression! { get {
        self.mglLineStyleLayer.lineColor
    }
    set {
        self.mglLineStyleLayer.lineColor = newValue
    } }
    
    public var lineWidth: Int { get {
        self.lineWidthConst
    }
    set {
        self.lineWidthConst = newValue
        self.mglLineStyleLayer.lineWidth = NSExpression(format: "mgl_interpolate:withCurveType:parameters:stops:($zoomLevel, 'linear', nil, %@)",
                                                        [14: newValue, 18: newValue])
    } }
    
    public required init(identifier: String, source: WeMapShapeSource){
        self.mglLineStyleLayer = MGLLineStyleLayer(identifier: identifier, source: source.getShapeSource()!)
        self.lineWidthConst = 20
    }
    
    public func getLineStyleLayer() -> MGLLineStyleLayer{
        return self.mglLineStyleLayer
    }
    
}

