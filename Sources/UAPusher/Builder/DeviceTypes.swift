import JSON

/// Device type segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#device-types
public struct DeviceTypes: Segment {
    
    // MARK: Class fields
    
    /// Key used for payload segment
    public let key: String = "device_types"
    
    /// The payload segment itself
    public let payload: JSON
    
    // MARK: Selector values
    
    /// Predefined payload segment selectors
    ///
    /// - all: "all"
    /// - ios: "ios"
    /// - android: "android"
    /// - windows: "wns"
    /// - web: "web"
    public enum Selector: JSONRepresentable {
        case all
        case ios
        case android
        case windows
        case web
        
        /// Generate json for corresponding enum case
        ///
        /// - Returns: Json representation of the payload segmet
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
    
    /// Initialize the device type segment from JSON
    ///
    /// - Parameter payload: Payload segment to use in final payload
    public init(payload: JSON) {
        self.payload = payload
    }
    
    /// Initialize the device type segment from Selector
    ///
    /// - Parameter selector: Selector for a predefined payload segment
    public init(_ selector: Selector) throws {
        guard selector == .all else {
            self.init([selector])
            return
        }
        
        self.init(payload: selector.makeJSON())
    }
    
    /// Initialize the device type segment from a list of predefined values
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
