import JSON

/// Audience segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#audience-selectors
public final class Audience: BuildingBlock {
    
    // MARK: Class fields
    
    /// Audience representation
    var audience: JSON
    
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
    /// - Parameter audience: JSON
    init(json: JSON) {
        self.audience = json
    }
    
    /// Init from string for tagged (targeted) push
    ///
    /// - Parameter tag: String
    init(tag: String) {
        self.audience = JSON([
            "tag": JSON(tag)
        ])
    }
    
    // MARK: Payload
    
    /// Get the payload
    ///
    /// - Returns: JSON
    func payload() -> JSON {
        return self.audience
    }
}
