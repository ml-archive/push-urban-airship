
import JSON

/// In-app segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#api-in-app-object
public struct InApp: Segment {
    // MARK: Class fields
    
    public let key: String = "in_app"
    public var payload: JSON
    
    // MARK: Initializers
    
    /// Init from JSON
    ///
    /// - Parameter payload: JSON
    public init(payload: JSON) {
        self.payload = payload
    }
    
}
