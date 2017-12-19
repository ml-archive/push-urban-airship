
import JSON

/// Campaigns segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#campaigns-object
struct Campaigns: Segment {
    
    // MARK: Class fields
    
    let key: String = "campaigns"
    var payload: JSON
    
    // MARK: Selector values
    
    public enum Selector: JSONRepresentable {
        case categories(values: [String])
        
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
