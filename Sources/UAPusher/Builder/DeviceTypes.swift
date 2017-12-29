import JSON

/// Device type segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#device-types
public struct DeviceTypes: Segment {
    
    // MARK: Class fields
    
    public let key: String = "device_types"
    public var payload: JSON
    
    // MARK: Selector values
    
    public enum Selector: JSONRepresentable {
        case all
        case ios
        case android
        case windows
        case web
        
        public func makeJSON() -> JSON {
            switch self {
            case .all:
                return "all"
            case .ios:
                return "ios"
            case .android:
                return "android"
            case .windows:
                return "wns"
            case .web:
                return "web"
            }
        }
    }
    
    // MARK: Initializers
    
    /// Init from JSON
    ///
    /// - Parameter payload: JSON
    public init(payload: JSON) {
        self.payload = payload
    }
    
    /// Init from Selector
    ///
    /// - Parameter selector: Selector
    public init(_ selector: Selector) throws {
        self.payload = selector.makeJSON()
    }
    
    /// Init from list of predefined values
    ///
    /// - Parameter selectors: [Selector]
    public init(_ selectors: [Selector]) {
        var compoundJson: [JSON] = []
        
        for selector in selectors {
            compoundJson.append(selector.makeJSON())
        }
        
        self.init(payload: JSON(compoundJson))
    }

}
