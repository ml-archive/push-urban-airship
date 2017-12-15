
import JSON

/// Message (rich push) segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#rich-push-api
/// NB: This requires a special plan at UA.
/// See: https://www.urbanairship.com/products/mobile-app-engagement/pricing
public final class Message: BuildingBlock {
    // MARK: Class fields
    
    /// Message representation
    var payload: JSON
    
    // MARK: Predefined values
    
    public enum Predefined: JSONRepresentable {
        
        case test
        
        public func makeJSON() throws -> JSON {
            
            switch self {
            case .test:
                return JSON([
                    "title": "This is a test",
                    "body": "This is a test message sent from UAPusher",
                    "content_type": "text/html"
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
