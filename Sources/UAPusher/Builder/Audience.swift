import JSON

/// Audience segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#audience-selectors
public struct Audience: Segment {
    
    // MARK: Class fields
    
    /// Key used for payload segment
    public let key: String = "audience"
    
    /// The payload segment itself
    public let payload: JSON
    
    // MARK: Selector values
    
    /// Predefined payload segment selectors
    ///
    /// - all: "all"
    /// - tag: {"tag": "some-tag"}
    /// - tags: {"tag": ["tag-1", "tag-2", ...]}
    /// - namedUser: {"named_user": "some_user_identifier"}
    /// - alias: **Deprecated** use namedUser instead
    public enum Selector: JSONRepresentable {
        case all
        case tag(value: String)
        case tags(values: [String])
        case namedUser(value: String)
        case alias(value: String)
        
        /// Generate json for corresponding enum case
        ///
        /// - Returns: Json representation of the payload segmet
        /// - Throws: If values cannot be converted to json
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
    
    /// Initialize the audience segment from JSON
    ///
    /// - Parameter payload: Payload segment to use in final payload
    public init(payload: JSON) {
        self.payload = payload
    }
    
    /// Initialize the audience segment from Selector
    ///
    /// - Parameter selector: Selector for a predefined payload segment
    public init(_ selector: Selector) throws {
        try self.payload = selector.makeJSON()
    }

}
