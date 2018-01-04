import JSON

/// Notification segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#notfication-payload
public struct Notification: Segment {
    // MARK: Class fields
    
    /// Key used for payload segment
    public let key: String = "notification"
    
    /// The payload segment itself
    public let payload: JSON
    
    // MARK: Selector values
    
    /// Predefined payload segment selectors
    ///
    /// - alert: "alert": "The text shown in push"
    public enum Selector: JSONRepresentable {
        case alert(value: String)
        
        /// Generate json for corresponding enum case
        ///
        /// - Returns: Json representation of the payload segmet
        /// - Throws: If values cannot be converted to json
        public func makeJSON() throws -> JSON {
            switch self {
            case .alert(let value):
                var json: JSON = JSON()
                try json.set("alert", value)
                return json
            }
        }
    }
    
    // MARK: Initializers
    
    /// Initialize the notification segment from JSON
    ///
    /// - Parameter payload: JSON
    public init(payload: JSON) {
        self.payload = payload
    }
    
    /// Initialize the notification segment from Selector
    ///
    /// - Parameter selector: Selector
    public init(_ selector: Selector) throws {
        try self.payload = selector.makeJSON()
    }

}
