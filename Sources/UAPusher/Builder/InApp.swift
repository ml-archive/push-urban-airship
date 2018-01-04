
import JSON

/// In-app segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#api-in-app-object
public struct InApp: Segment {
    // MARK: Class fields
    
    /// Key used for payload segment
    public let key: String = "in_app"
    
    /// The payload segment itself
    public let payload: JSON
    
    // MARK: Initializers
    
    /// Initialize the In app segment from JSON
    ///
    /// - Parameter payload: JSON
    public init(payload: JSON) {
        self.payload = payload
    }
    
}
