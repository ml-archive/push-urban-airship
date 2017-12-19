
import JSON

/// In-app segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#api-in-app-object
struct InApp: Segment {
    // MARK: Class fields
    
    let key: String = "in_app"
    var payload: JSON
    
    // MARK: Initializers
    
    /// Init from JSON
    ///
    /// - Parameter payload: JSON
    init(payload: JSON) {
        self.payload = payload
    }
    
}
