import JSON

/// Device type segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#device-types
public final class DeviceTypes: BuildingBlock {
    // MARK: Class fields
    
    /// Device types representation
    var payload: JSON
    
    // MARK: Predefined values
    
    public enum Predefined: JSONRepresentable {
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
    init(payload: JSON) {
        self.payload = payload
    }
    
    /// Init from list of predefined values
    ///
    /// - Parameter compound: [Predefined]
    convenience init(compound: [Predefined]) {
        var compoundJson: [JSON] = []
        
        for predefined in compound {
            compoundJson.append(predefined.makeJSON())
        }
        
        self.init(payload: JSON(compoundJson))
    }

}
