
import JSON

/// Campaigns segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#campaigns-object
public struct Campaigns: Segment {
    
    // MARK: Class fields
    
    /// Key used for payload segment
    public let key: String = "campaigns"
    
    /// The payload segment itself
    public let payload: JSON
    
    // MARK: Selector values
    
    /// Predefined payload segment selectors
    ///
    /// - categories: {"categories": ["cat_1", "cat_2", ...]}
    public enum Selector: JSONRepresentable {
        case categories(values: [String])
        
        /// Generate json for corresponding enum case
        ///
        /// - Returns: Json representation of the payload segmet
        /// - Throws: If values cannot be converted to json
        public func makeJSON() throws -> JSON {
            switch self {
            case .categories(let values):
                var json: JSON = JSON()
                try json.set("categories", values)
                return json
            }
        }
    }
    
    // MARK: Initializers
    
    /// Initialize the campaign segment from JSON
    ///
    /// - Parameter payload: Payload segment to use in final payload
    public init(payload: JSON) {
        self.payload = payload
    }
    
    /// Initialize the campaign segment from Selector
    ///
    /// - Parameter selector: Selector for a predefined payload segment
    public init(_ selector: Selector) throws {
        try self.payload = selector.makeJSON()
    }
    
}
