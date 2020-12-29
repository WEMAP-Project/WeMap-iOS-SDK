import Mapbox

@objc public protocol WeMapAnnotation {
    @objc optional var title: String? { get set }
    @objc optional var subtitle: String? { get set }
    func getAnnotation() -> MGLAnnotation
}
