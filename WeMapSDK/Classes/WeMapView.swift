import Mapbox

open class WeMapView: UIView, MGLMapViewDelegate {
    public var centerCoordinate: CLLocationCoordinate2D
    private var mapView: MGLMapView
    public weak var delegate: WeMapViewDelegate?
    private var style: MGLStyle
    
    private var wemapContants: WeMapConstants
    
    private var trafficSource = MGLRasterTileSource(identifier: "traffic-layer", tileURLTemplates: ["https://mt1.google.com/vt/lyrs=transit,traffic&x={x}&y={y}&z={z}"], options: [ .tileSize: 256 ])
    private var trafficLayer = MGLRasterStyleLayer(identifier: "traffic-layer", source: MGLRasterTileSource(identifier: "traffic-layer", tileURLTemplates: ["https://mt1.google.com/vt/lyrs=transit,traffic&x={x}&y={y}&z={z}"], options: [ .tileSize: 256 ]))
    private var satelliteSource = MGLRasterTileSource(identifier: "satellite-layer", tileURLTemplates: ["https://mt1.google.com/vt/lyrs=y&x={x}&y={y}&z={z}"], options: [ .tileSize: 256 ])
    private var satelliteLayer = MGLRasterStyleLayer(identifier: "satellite-layer", source: MGLRasterTileSource(identifier: "satellite-layer", tileURLTemplates: ["https://mt1.google.com/vt/lyrs=y&x={x}&y={y}&z={z}"], options: [ .tileSize: 256 ]))
    
    public required override init(frame: CGRect) {
        self.wemapContants = WeMapConstants()
        self.mapView = MGLMapView(frame: frame, styleURL: self.wemapContants.getWeMapBasicStyle())
        self.style = MGLStyle()
        self.centerCoordinate = self.mapView.centerCoordinate
        super.init(frame: frame)
        self.mapView.delegate = self
        self.mapView.attributionButton.isHidden = true
        self.mapView.logoView.isHidden = true
        self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.mapView)
    }
    
    public func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle)  {
        self.mapView = mapView
        self.style = style
        self.wemapViewDidFinishLoadingMap()
    }
    
    
    public func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool{
        //        guard annotation is MGLPointAnnotation else {
        return ((delegate?.wemapView!(self, annotationCanShowCallout: WeMapPointAnnotation(annotation: annotation as! MGLPointAnnotation))) != nil)
        //        }
        //        return false
    }
    
    public func mapView(_ mapView: MGLMapView, leftCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        //        guard annotation is MGLPointAnnotation else {
        return delegate?.wemapView?(self, leftCalloutAccessoryViewFor: WeMapPointAnnotation(annotation: annotation as! MGLPointAnnotation))
        //        }
        //        return nil
    }
    
    public func mapView(_ mapView: MGLMapView, rightCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        //        guard annotation is MGLPointAnnotation else {
        return delegate?.wemapView?(self, rightCalloutAccessoryViewFor: WeMapPointAnnotation(annotation: annotation as! MGLPointAnnotation))
        //        }
        //        return nil
    }
    
    public func mapView(_ mapView: MGLMapView, annotation: MGLAnnotation, calloutAccessoryControlTapped control: UIControl){
        delegate?.wemapView?(self, annotation: WeMapPointAnnotation(annotation: annotation as! MGLPointAnnotation), calloutAccessoryControlTapped: control)
    }
    
    private func wemapViewDidFinishLoadingMap(){
        delegate?.WeMapViewDidFinishLoadingMap!(self)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func getView() -> UIView{
        return self.mapView
    }
    
    public func setCenter(_ centerCoordinate: CLLocationCoordinate2D) {
        self.mapView.setCenter(centerCoordinate, animated: false)
    }
    
    
    public func setCenter(_ centerCoordinate: CLLocationCoordinate2D, animated: Bool) {
        self.mapView.setCenter(centerCoordinate, animated: animated)
    }
    
    public func setCenter(_ centerCoordinate: CLLocationCoordinate2D, zoomLevel: Double, animated: Bool) {
        self.mapView.setCenter(centerCoordinate, zoomLevel: zoomLevel, animated: animated)
    }
    
    public func setCamera(camera: WeMapCamera, animated: Bool) {
        self.mapView.setCamera(camera.getCamera(), animated: animated)
    }
    
    public func setCamera(camera: WeMapCamera, withDuration: TimeInterval, animationTimingFunction: CAMediaTimingFunction?) {
        self.mapView.setCamera(camera.getCamera(), withDuration: withDuration, animationTimingFunction: animationTimingFunction)
    }
    
    public func setCamera(camera: WeMapCamera, withDuration: TimeInterval, animationTimingFunction: CAMediaTimingFunction?, completionHandler: @escaping (() -> Void)) {
        self.mapView.setCamera(camera.getCamera(), withDuration: withDuration, animationTimingFunction: animationTimingFunction, completionHandler: completionHandler)
    }
    
    public func setCamera(camera: WeMapCamera, withDuration: TimeInterval, animationTimingFunction: CAMediaTimingFunction?, edgePadding: UIEdgeInsets, completionHandler: @escaping (() -> Void)) {
        self.mapView.setCamera(camera.getCamera(), withDuration: withDuration, animationTimingFunction: animationTimingFunction, edgePadding: edgePadding, completionHandler: completionHandler)
    }
    
    public func addTrafficLayer(){
        if(self.mapView.style?.layer(withIdentifier: "traffic-layer") == nil){
            self.mapView.style?.addSource(trafficSource)
            self.mapView.style?.addLayer(trafficLayer)
        }
    }
    
    public func removeTrafficLayer(){
        if(self.mapView.style?.layer(withIdentifier: "traffic-layer") != nil){
            self.mapView.style?.removeLayer(trafficLayer)
            self.mapView.style?.removeSource(trafficSource)
        }
    }
    
    public func addSatelliteLayer(){
        if(self.mapView.style?.layer(withIdentifier: "satellite-layer") == nil){
            self.mapView.style?.addSource(satelliteSource)
            self.mapView.style?.addLayer(satelliteLayer)
        }
    }
    
    public func removeSatelliteLayer(){
        if(self.mapView.style?.layer(withIdentifier: "satellite-layer") != nil){
            self.mapView.style?.removeLayer(satelliteLayer)
            self.mapView.style?.removeSource(satelliteSource)
        }
    }
    
    public func addWMSLayer(layerID: String, wmsURL: String, tileSize: Int){
        let WMSSource = MGLRasterTileSource(identifier: layerID, tileURLTemplates: [wmsURL], options: [ .tileSize: Int(tileSize) ])
        let WMSLayer = MGLRasterStyleLayer(identifier: layerID + "-layer", source: WMSSource)
        self.mapView.style?.addSource(WMSSource)
        self.mapView.style?.addLayer(WMSLayer)
    }
    
    public func removeWMSLayer(layerID: String){
        let WMSLayer = self.mapView.style?.layer(withIdentifier: layerID + "-layer")
        if(WMSLayer != nil){
            self.mapView.style?.removeLayer(WMSLayer!)
        }
        let WMSSource = self.mapView.style?.source(withIdentifier: layerID)
        if(WMSSource != nil){
            self.mapView.style?.removeSource(WMSSource!)
        }
    }
    
    public func image(forName name: String) -> UIImage?{
        return self.style.image(forName: name)
    }
    
    public func setImage(_ image: UIImage, forName name: String){
        self.style.setImage(image, forName: name)
    }
    
    public func removeImage(forName name: String){
        self.style.removeImage(forName: name)
    }
    
    public func addSource(_ source: WeMapShapeSource){
        self.style.addSource(source.getShapeSource()!)
    }
    
    public func addLayer(_ layer: WeMapSymbolStyleLayer){
        self.style.addLayer(layer.getStyleLayer())
    }
    
    public func addLayer(_ layer: WeMapLineStyleLayer){
        self.style.addLayer(layer.getLineStyleLayer())
    }
    
    public func addLayer(_ layer: WeMapFillStyleLayer){
        self.style.addLayer(layer.getFillStyleLayer())
    }
    
    public func addAnnotation(_ annotation: WeMapAnnotation){
        mapView.addAnnotation(annotation.getAnnotation())
    }
    
    public func addAnnotations(_ annotations: [WeMapAnnotation]){
        var annotationsMGLs = [MGLAnnotation]()
        for annotation in annotations{
            annotationsMGLs.append(annotation.getAnnotation())
        }
        mapView.addAnnotations(annotationsMGLs)
    }
    
    public func selectAnnotation(_ annotation: WeMapAnnotation, animated: Bool, completionHandler: @escaping () -> ()){
        mapView.selectAnnotation(annotation.getAnnotation(), animated: animated, completionHandler: completionHandler)
        
    }
    
    public func deselectAnnotation(_ annotation: WeMapAnnotation, animated: Bool){
        mapView.deselectAnnotation(annotation.getAnnotation(), animated: animated)
    }
}
