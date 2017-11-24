import Vapor

/// Builder class for the request payload
public final class UABuilder {
    
    // MARK: Class fields
    
    var audiencePayload: Audience?
    
    // MARK: Initializers
    
    /// Init
    public init() {}
    
    // MARK: Audience
    
    /// Set audience from a JSON objet
    ///
    /// - Parameter audience: JSON
    /// - Returns: UABuilder
    public func audience(audience: JSON) -> UABuilder {
        self.audiencePayload = Audience(audience: audience)
        return self
    }
    
    /// Set audience using a predefined value
    ///
    /// - Parameter predefined: Audience.standarVal
    /// - Returns: UABuilder
    public func audience(predefined: Audience.predefined) -> UABuilder {
        self.audiencePayload = Audience(predefined: predefined)
        return self
    }
    
    // MARK: Build
    
    /// Build the payload
    ///
    /// - Returns: JSON
    /// - Throws: <#throws value description#>
    public func makeBody() throws -> JSON {
        var body: JSON = JSON()
        
        if let unwrappedAudience: Audience = audiencePayload {
            try body.set("audience", unwrappedAudience.payload())
        }
        
        return body
    }
    
}
