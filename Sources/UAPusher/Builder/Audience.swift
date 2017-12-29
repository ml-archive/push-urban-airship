import JSON

/// Audience segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#audience-selectors
public struct Audience: Segment {
    
    // MARK: Class fields
    
    public let key: String = "audience"
    public var payload: JSON
    
    // MARK: Selector values
    
    public enum Selector: JSONRepresentable {
        case all
        case tag(value: String)
        case tags(values: [String])
        case namedUser(value: String)
        case alias(value: String)
        
        public func makeJSON() throws -> JSON {
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
    public init(payload: JSON) {
        self.payload = payload
    }
    
    /// Init from Selector
    ///
    /// - Parameter selector: Selector
    public init(_ selector: Selector) throws {
        try self.payload = selector.makeJSON()
    }

}
