import JSON

/// Device type segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#device-types
public final class DeviceTypes {
    // MARK: Class fields
    
    /// Device types representation
    var deviceTypes: JSON
    
    // MARK: Predefined values
    
    public enum predefined {
        case all
        case ios
        case android
        case windows
        case web
        
        var json: JSON {
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
    init(deviceTypes: JSON) {
        self.deviceTypes = deviceTypes
    }
    
    
    /// Init from predefined enum
    ///
    /// - Parameter predefined: predefined
    convenience init(predefined: predefined) {
        self.init(deviceTypes: predefined.json)
    }
    
    /// Init from list of predefined values
    ///
    /// - Parameter compound: [predefined]]
    convenience init(compound: [predefined]) {
        var compoundJson: [JSON] = []
        
        for predefined in compound {
            compoundJson.append(predefined.json)
        }
        
        self.init(deviceTypes: JSON(compoundJson))
    }
    
    // MARK: Payload
    
    /// Get the payload
    ///
    /// - Returns: JSON
    func payload() -> JSON {
        return self.deviceTypes
    }
}
