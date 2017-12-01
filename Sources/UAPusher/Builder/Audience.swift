import JSON

/// Audience segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#audience-selectors
public final class Audience: BuildingBlock {
    
    // MARK: Class fields
    
    /// Audience representation
    var payload: JSON
    
    // MARK: Predefined values
    
    public enum Predefined: JSONRepresentable {
        case all
        
        public func makeJSON() throws -> JSON {
            switch self {
            case .all:
                return "all"
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
    
    /// Init from string for tagged (targeted) push
    ///
    /// - Parameter tag: String
    convenience init(tag: String) {
        self.init(payload: JSON([
            "tag": JSON(tag)
        ]))
    }

}
