import Vapor

/// Builder class for the request payload
public final class UABuilder {
    
    // MARK: Class fields
    
    var audiencePayload: Audience?
    var deviceTypesPayload: DeviceTypes?
    
    // MARK: Initializers
    
    /// Init
    public init() {}
    
    // MARK: Audience
    
    /// Set audience from a JSON objet
    ///
    /// - Parameter audience: JSON
    /// - Returns: UABuilder
    public func audience(audience: JSON) -> UABuilder {
        self.audiencePayload = Audience(json: audience)
        return self
    }
    
    /// Set audience using a predefined value
    ///
    /// - Parameter predefined: Audience.predefined
    /// - Returns: UABuilder
    public func audience(predefined: Audience.Predefined) throws -> UABuilder {
        self.audiencePayload = try Audience(predefined: predefined)
        return self
    }
    
    // MARK: DeviceTypes
    
    /// Set device types from JSON object
    ///
    /// - Parameter deviceTypes: JSON
    /// - Returns: UABuilder
    public func deviceTypes(deviceTypes: JSON) -> UABuilder {
        self.deviceTypesPayload = DeviceTypes(json: deviceTypes)
        return self
    }
    
    /// Set device types from predefined
    ///
    /// - Parameter predefined: DevideTypes.predefined
    /// - Returns: UABuilder
    public func deviceTypes(predefined: DeviceTypes.Predefined) throws -> UABuilder {
        self.deviceTypesPayload = try DeviceTypes(predefined: predefined)
        return self
    }
    
    /// Set device types from list of predefined
    ///
    /// - Parameter compound: [DeviceTypes.predefined]
    /// - Returns: UABuilder
    public func deviceTypes(compound: [DeviceTypes.Predefined]) -> UABuilder {
        self.deviceTypesPayload = DeviceTypes(compound: compound)
        return self
    }
    
    // MARK: Build
    
    /// Build the payload
    ///
    /// - Returns: JSON
    /// - Throws: In case of invalid JSON
    public func makeBody() throws -> JSON {
        var body: JSON = JSON()
        
        if let unwrappedAudience: Audience = audiencePayload {
            try body.set("audience", unwrappedAudience.payload())
        }
        
        if let unwrappedDeviceTypes: DeviceTypes = deviceTypesPayload {
            try body.set("device_types", unwrappedDeviceTypes.payload())
        }
        
        return body
    }
    
}
