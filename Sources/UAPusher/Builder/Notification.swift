import JSON

/// Notification segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#notfication-payload
public final class Notification: BuildingBlock {
    // MARK: Class fields
    
    /// Notification representation
    var payload: JSON
    
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
    /// - Parameter payload: JSON
    init(payload: JSON) {
        self.payload = payload
    }
    
    /// Init from alert string
    ///
    /// - Parameter alert: String
    convenience init(alert: String) {
        self.init(payload: JSON([
            "alert": JSON(alert)
        ]))
    }

}
