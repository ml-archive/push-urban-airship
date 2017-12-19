import JSON

/// Notification segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/integration/#notfication-payload
struct Notification: Segment {
    // MARK: Class fields
    
    let key: String = "notification"
    var payload: JSON
    
    // MARK: Predefined values
    
    public enum Selector: JSONRepresentable {
        case alert(value: String)
        
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
    
    /// Init from JSON
    ///
    /// - Parameter payload: JSON
    init(payload: JSON) {
        self.payload = payload
    }
    
    /// Init from Selector
    ///
    /// - Parameter selector: Selector
    init(_ selector: Selector) throws {
        try self.payload = selector.makeJSON()
    }

}
