
import JSON

/// In-app segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#api-in-app-object
public final class InApp: BuildingBlock {
    // MARK: Class fields
    
    /// InApp representation
    var payload: JSON
    
    // MARK: Predefined values
    
    public enum Predefined: JSONRepresentable {
        
        case alert
        
        public func makeJSON() throws -> JSON {
            
            switch self {
            case .alert:
                return JSON([
                    "alert": "This is a test in-app alert from UAPusher",
                    "display_type": "banner"
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
    
}
