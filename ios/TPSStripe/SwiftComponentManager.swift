@objc(SwiftComponentManager)
class SwiftComponentManager: NSObject {

@objc func passValueFromReact(_ value : String) {
    debugPrint(" Print Here \(value)")
 }
}
