import JSON

/// Device type segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#device-types
public final class DeviceTypes: BuildingBlock {
    // MARK: Class fields
    
    /// Device types representation
    var deviceTypes: JSON
    
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
    /// - Parameter deviceTypes: JSON
    init(json: JSON) {
        self.deviceTypes = json
    }
    
    /// Init from list of predefined values
    ///
    /// - Parameter compound: [Predefined]
    convenience init(compound: [Predefined]) {
        var compoundJson: [JSON] = []
        
        for predefined in compound {
            compoundJson.append(predefined.makeJSON())
        }
        
        self.init(json: JSON(compoundJson))
    }
    
    // MARK: Payload
    
    /// Get the payload
    ///
    /// - Returns: JSON
    func payload() -> JSON {
        return self.deviceTypes
    }
}
