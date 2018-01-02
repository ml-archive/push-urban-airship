
import JSON

/// Message (rich push) segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#rich-push-api
/// NB: This requires a special plan at UA.
/// See: https://www.urbanairship.com/products/mobile-app-engagement/pricing
public struct Message: Segment {
    
    // MARK: Class fields
    
    public let key: String = "message"
    public let payload: JSON
    
    // MARK: Initializers
    
    /// Init from JSON
    ///
    /// - Parameter payload: JSON
    public init(payload: JSON) {
        self.payload = payload
    }
    
}
