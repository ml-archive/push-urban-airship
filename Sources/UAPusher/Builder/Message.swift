
import JSON

/// Message (rich push) segment of an Urban Airship push notification payload
/// - NB: This requires a special plan at UA.
/// - See: https://www.urbanairship.com/products/mobile-app-engagement/pricing
/// - See: https://docs.urbanairship.com/api/ua/#rich-push-api
public struct Message: Segment {
    
    // MARK: Class fields
    
    /// Key used for payload segment
    public let key: String = "message"
    
    /// The payload segment itself
    public let payload: JSON
    
    // MARK: Initializers
    
    /// Init from JSON
    ///
    /// - Parameter payload: JSON
    public init(payload: JSON) {
        self.payload = payload
    }
    
}
