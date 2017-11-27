import JSON

/// Device type segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#notfication-payload
public final class Notification: BuildingBlock {
    // MARK: Class fields
    
    /// Notification representation
    var notification: JSON
    
    // MARK: Predefined values
    
    public enum Predefined: JSONRepresentable {
        case testAlert
        
        public func makeJSON() -> JSON {
            switch self {
            case .testAlert:
                return JSON(json: [
                    "alert": "This is a test push notification, from nodes-vapor/push-urban-airship"
                ])
            }
        }
    }
    
    // MARK: Initializers
    
    /// Init from JSON
    ///
    /// - Parameter deviceTypes: JSON
    init(json: JSON) {
        self.notification = json
    }
    
    /// Init from alert string
    ///
    /// - Parameter alert: String
    init(alert: String) {
        self.notification = JSON([
            "alert": JSON(alert)
        ])
    }
    
    // MARK: Payload
    
    /// Get the payload
    ///
    /// - Returns: JSON
    func payload() -> JSON {
        return self.notification
    }
}
