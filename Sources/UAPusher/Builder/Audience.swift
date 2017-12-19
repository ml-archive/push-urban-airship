import JSON

/// Audience segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#audience-selectors
struct Audience: Segment {
    
    // MARK: Class fields
    
    let key: String = "audience"
    let payload: JSON
    
    enum Selector: JSONRepresentable {
        case all
        case tag(value: String)
        case tags(values: [String])
        case namedUser(value: String)
        case alias(value: String)
        
        func makeJSON() throws -> JSON {
            switch self {
            case .all:
                return "all"
            case .tag(let value):
                var json: JSON = JSON()
                try json.set("tag", value)
                return json
            case .tags(let values):
                var json: JSON = JSON()
                try json.set("tag", values)
                return json
            case .namedUser(let value):
                var json: JSON = JSON()
                try json.set("named_user", value)
                return json
            case .alias(let value):
                print("\"alias\" is deprecated. Use \"named_user\" instead")
                print("See https://docs.urbanairship.com/api/ua/#data-formats-1 for more info")
                var json: JSON = JSON()
                try json.set("named_user", value)
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
