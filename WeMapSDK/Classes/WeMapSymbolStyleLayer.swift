import Mapbox

public class WeMapSymbolStyleLayer: WeMapStyleLayer {
    private var mglSymbolStyleLayer: MGLSymbolStyleLayer?
    
    public var iconAllowsOverlap: NSExpression! { get {
        mglSymbolStyleLayer?.iconAllowsOverlap
    }
    set {
        mglSymbolStyleLayer?.iconAllowsOverlap = newValue
    } }
    
    public var iconImageName: NSExpression! { get {
        mglSymbolStyleLayer?.iconImageName
    }
    set {
        mglSymbolStyleLayer?.iconImageName = newValue
    } }
    
    public var iconOffset: NSExpression! { get {
        mglSymbolStyleLayer?.iconOffset
    }
    set {
        mglSymbolStyleLayer?.iconOffset = newValue
    } }
    
    public var iconOptional: NSExpression! { get {
        mglSymbolStyleLayer?.iconOptional
    }
    set {
        mglSymbolStyleLayer?.iconOptional = newValue
    } }
    
    public var iconPadding: NSExpression! { get {
        mglSymbolStyleLayer?.iconPadding
    }
    set {
        mglSymbolStyleLayer?.iconPadding = newValue
    } }
    
    public var iconPitchAlignment: NSExpression! { get {
        mglSymbolStyleLayer?.iconPitchAlignment
    }
    set {
        mglSymbolStyleLayer?.iconPitchAlignment = newValue
    } }
    
    public var iconRotation: NSExpression! { get {
        mglSymbolStyleLayer?.iconRotation
    }
    set {
        mglSymbolStyleLayer?.iconRotation = newValue
    } }
    
    public var iconRotationAlignment: NSExpression! { get {
        mglSymbolStyleLayer?.iconRotationAlignment
    }
    set {
        mglSymbolStyleLayer?.iconRotationAlignment = newValue
    } }
    
    public var iconScale: NSExpression! { get {
        mglSymbolStyleLayer?.iconScale
    }
    set {
        mglSymbolStyleLayer?.iconScale = newValue
    } }
    
    public var iconTextFit: NSExpression! { get {
        mglSymbolStyleLayer?.iconTextFit
    }
    set {
        mglSymbolStyleLayer?.iconTextFit = newValue
    } }
    
    public var iconTextFitPadding: NSExpression! { get {
        mglSymbolStyleLayer?.iconTextFitPadding
    }
    set {
        mglSymbolStyleLayer?.iconTextFitPadding = newValue
    } }
    
    public var keepsIconUpright: NSExpression! { get {
        mglSymbolStyleLayer?.keepsIconUpright
    }
    set {
        mglSymbolStyleLayer?.keepsIconUpright = newValue
    } }
    
    public var keepsTextUpright: NSExpression! { get {
        mglSymbolStyleLayer?.keepsTextUpright
    }
    set {
        mglSymbolStyleLayer?.keepsTextUpright = newValue
    } }
    
    public var maximumTextAngle: NSExpression! { get {
        mglSymbolStyleLayer?.maximumTextAngle
    }
    set {
        mglSymbolStyleLayer?.maximumTextAngle = newValue
    } }
    
    public var maximumTextWidth: NSExpression! { get {
        mglSymbolStyleLayer?.maximumTextWidth
    }
    set {
        mglSymbolStyleLayer?.maximumTextWidth = newValue
    } }
    
    public var symbolAvoidsEdges: NSExpression! { get {
        mglSymbolStyleLayer?.symbolAvoidsEdges
    }
    set {
        mglSymbolStyleLayer?.symbolAvoidsEdges = newValue
    } }
    
    public var symbolPlacement: NSExpression! { get {
        mglSymbolStyleLayer?.symbolPlacement
    }
    set {
        mglSymbolStyleLayer?.symbolPlacement = newValue
    } }
    
    public var symbolSortKey: NSExpression! { get {
        mglSymbolStyleLayer?.symbolSortKey
    }
    set {
        mglSymbolStyleLayer?.symbolSortKey = newValue
    } }
    
    public var symbolSpacing: NSExpression! { get {
        mglSymbolStyleLayer?.symbolSpacing
    }
    set {
        mglSymbolStyleLayer?.symbolSpacing = newValue
    } }
    
    public var symbolZOrder: NSExpression! { get {
        mglSymbolStyleLayer?.symbolZOrder
    }
    set {
        mglSymbolStyleLayer?.symbolZOrder = newValue
    } }
    
    public var text: NSExpression! { get {
        mglSymbolStyleLayer?.text
    }
    set {
        mglSymbolStyleLayer?.text = newValue
    } }
    
    public var textAllowsOverlap: NSExpression! { get {
        mglSymbolStyleLayer?.textAllowsOverlap
    }
    set {
        mglSymbolStyleLayer?.textAllowsOverlap = newValue
    } }
    
    public var textAnchor: NSExpression! { get {
        mglSymbolStyleLayer?.textAnchor
    }
    set {
        mglSymbolStyleLayer?.textAnchor = newValue
    } }
    
    public var textFontNames: NSExpression! { get {
        mglSymbolStyleLayer?.textFontNames
    }
    set {
        mglSymbolStyleLayer?.textFontNames = newValue
    } }
    
    public var textFontSize: NSExpression! { get {
        mglSymbolStyleLayer?.textFontSize
    }
    set {
        mglSymbolStyleLayer?.textFontSize = newValue
    } }
    
    public var textIgnoresPlacement: NSExpression! { get {
        mglSymbolStyleLayer?.textIgnoresPlacement
    }
    set {
        mglSymbolStyleLayer?.textIgnoresPlacement = newValue
    } }
    
    public var textJustification: NSExpression! { get {
        mglSymbolStyleLayer?.textJustification
    }
    set {
        mglSymbolStyleLayer?.textJustification = newValue
    } }
    
    public var textLetterSpacing: NSExpression! { get {
        mglSymbolStyleLayer?.textLetterSpacing
    }
    set {
        mglSymbolStyleLayer?.textLetterSpacing = newValue
    } }
    
    public var textLineHeight: NSExpression! { get {
        mglSymbolStyleLayer?.textLineHeight
    }
    set {
        mglSymbolStyleLayer?.textLineHeight = newValue
    } }
    
    public var textOffset: NSExpression! { get {
        mglSymbolStyleLayer?.textOffset
    }
    set {
        mglSymbolStyleLayer?.textOffset = newValue
    } }
    
    public var textOptional: NSExpression! { get {
        mglSymbolStyleLayer?.textOptional
    }
    set {
        mglSymbolStyleLayer?.textOptional = newValue
    } }
    
    public var textPadding: NSExpression! { get {
        mglSymbolStyleLayer?.textPadding
    }
    set {
        mglSymbolStyleLayer?.textPadding = newValue
    } }
    
    public var textPitchAlignment: NSExpression! { get {
        mglSymbolStyleLayer?.textPitchAlignment
    }
    set {
        mglSymbolStyleLayer?.textPitchAlignment = newValue
    } }
    
    public var textRadialOffset: NSExpression! { get {
        mglSymbolStyleLayer?.textRadialOffset
    }
    set {
        mglSymbolStyleLayer?.textRadialOffset = newValue
    } }
    
    public var textRotation: NSExpression! { get {
        mglSymbolStyleLayer?.textRotation
    }
    set {
        mglSymbolStyleLayer?.textRotation = newValue
    } }
    
    public var textRotationAlignment: NSExpression! { get {
        mglSymbolStyleLayer?.textRotationAlignment
    }
    set {
        mglSymbolStyleLayer?.textRotationAlignment = newValue
    } }
    
    public var textTransform: NSExpression! { get {
        mglSymbolStyleLayer?.textTransform
    }
    set {
        mglSymbolStyleLayer?.textTransform = newValue
    } }
    
    public var textVariableAnchor: NSExpression! { get {
        mglSymbolStyleLayer?.textVariableAnchor
    }
    set {
        mglSymbolStyleLayer?.textVariableAnchor = newValue
    } }
    
    public var textWritingModes: NSExpression! { get {
        mglSymbolStyleLayer?.textWritingModes
    }
    set {
        mglSymbolStyleLayer?.textWritingModes = newValue
    } }
    
    public var iconColor: NSExpression! { get {
        mglSymbolStyleLayer?.iconColor
    }
    set {
        mglSymbolStyleLayer?.iconColor = newValue
    } }
    
    public var iconColorTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.iconColorTransition
    }
    set {
        mglSymbolStyleLayer?.iconColorTransition = newValue
    } }
    
    public var iconHaloBlur: NSExpression! { get {
        mglSymbolStyleLayer?.iconHaloBlur
    }
    set {
        mglSymbolStyleLayer?.iconHaloBlur = newValue
    } }
    
    public var iconHaloColor: NSExpression! { get {
        mglSymbolStyleLayer?.iconHaloColor
    }
    set {
        mglSymbolStyleLayer?.iconHaloColor = newValue
    } }
    
    public var iconHaloColorTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.iconHaloColorTransition
    }
    set {
        mglSymbolStyleLayer?.iconHaloColorTransition = newValue
    } }
    
    public var iconHaloWidth: NSExpression! { get {
        mglSymbolStyleLayer?.iconHaloWidth
    }
    set {
        mglSymbolStyleLayer?.iconHaloWidth = newValue
    } }
    
    public var iconHaloWidthTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.iconHaloWidthTransition
    }
    set {
        mglSymbolStyleLayer?.iconHaloWidthTransition = newValue
    } }
    
    public var iconOpacity: NSExpression! { get {
        mglSymbolStyleLayer?.iconOpacity
    }
    set {
        mglSymbolStyleLayer?.iconOpacity = newValue
    } }
    
    public var iconTranslation: NSExpression! { get {
        mglSymbolStyleLayer?.iconTranslation
    }
    set {
        mglSymbolStyleLayer?.iconTranslation = newValue
    } }
    
    public var iconTranslationTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.iconTranslationTransition
    }
    set {
        mglSymbolStyleLayer?.iconTranslationTransition = newValue
    } }
    
    public var iconTranslationAnchor: NSExpression! { get {
        mglSymbolStyleLayer?.iconTranslationAnchor
    }
    set {
        mglSymbolStyleLayer?.iconTranslationAnchor = newValue
    } }
    
    public var textColor: NSExpression! { get {
        mglSymbolStyleLayer?.textColor
    }
    set {
        mglSymbolStyleLayer?.textColor = newValue
    } }
    
    public var textColorTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.textColorTransition
    }
    set {
        mglSymbolStyleLayer?.textColorTransition = newValue
    } }
    
    public var textHaloBlur: NSExpression! { get {
        mglSymbolStyleLayer?.textHaloBlur
    }
    set {
        mglSymbolStyleLayer?.textHaloBlur = newValue
    } }
    
    public var textHaloColor: NSExpression! { get {
        mglSymbolStyleLayer?.textHaloColor
    }
    set {
        mglSymbolStyleLayer?.textHaloColor = newValue
    } }
    
    public var textHaloColorTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.textHaloColorTransition
    }
    set {
        mglSymbolStyleLayer?.textHaloColorTransition = newValue
    } }
    
    public var textHaloWidth: NSExpression! { get {
        mglSymbolStyleLayer?.textHaloWidth
    }
    set {
        mglSymbolStyleLayer?.textHaloWidth = newValue
    } }
    
    public var textHaloWidthTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.textHaloWidthTransition
    }
    set {
        mglSymbolStyleLayer?.textHaloWidthTransition = newValue
    } }
    
    public var textOpacity: NSExpression! { get {
        mglSymbolStyleLayer?.textOpacity
    }
    set {
        mglSymbolStyleLayer?.textOpacity = newValue
    } }
    
    public var textOpacityTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.textOpacityTransition
    }
    set {
        mglSymbolStyleLayer?.textOpacityTransition = newValue
    } }
    
    public var textTranslation: NSExpression! { get {
        mglSymbolStyleLayer?.textTranslation
    }
    set {
        mglSymbolStyleLayer?.textTranslation = newValue
    } }
    
    public var textTranslationTransition: MGLTransition! { get {
        mglSymbolStyleLayer?.textTranslationTransition
    }
    set {
        mglSymbolStyleLayer?.textTranslationTransition = newValue
    } }
    
    public var textTranslationAnchor: NSExpression! { get {
        mglSymbolStyleLayer?.textTranslationAnchor
    }
    set {
        mglSymbolStyleLayer?.textTranslationAnchor = newValue
    } }
    
    
    public required init(identifier: String, source: WeMapShapeSource){
        self.mglSymbolStyleLayer = MGLSymbolStyleLayer(identifier: identifier, source: source.getShapeSource()!)
    }
    
    public func getStyleLayer() -> MGLStyleLayer{
        return self.mglSymbolStyleLayer!
    }
}
