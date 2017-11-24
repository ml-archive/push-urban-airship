import Vapor

/// Audience segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#audience-selectors
public final class Audience {
    
    // MARK: Class fields
    
    /// Audience representation
    var audience: JSON
    
    // MARK: Standard values
    public enum predefined {
        case all
        
        var json: JSON {
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
    init(audience: JSON) {
        self.audience = audience
    }
    
    /// Init from predefined enum
    ///
    /// - Parameter val: predefined
    convenience init(predefined: predefined) {
        self.init(audience: predefined.json)
    }
    
    // MARK: Payload
    
    /// Get the payload
    ///
    /// - Returns: JSON
    func payload() -> JSON {
        return self.audience
    }
}
