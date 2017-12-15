
import JSON

/// Campaigns segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#campaigns-object
public final class Campaigns: BuildingBlock {
    
    // MARK: Class fields
    
    /// Campaign representation
    var payload: JSON
    
    // MARK: Predefined values
    
    public enum Predefined: JSONRepresentable {
        case test
        
        public func makeJSON() throws -> JSON {
            switch self {
            case .test:
                return JSON([
                    "categories": [
                        "kittens",
                        "tacos",
                        "horse_racing"
                    ]
                ])
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
    
    
    /// Init from a list of custom categories
    ///
    /// - Parameter categories: An a array of strings
    /// - Throws: In case json cannot be created
    convenience init(categories: [String]) throws {
        var json = JSON()
        try json.set("categories", categories)
        self.init(payload: json)
    }
}
