import Vapor

/// Builder class for the request payload
public final class UABuilder {
    
    // MARK: Class fields
    
    var audiencePayload: Audience?
    var deviceTypesPayload: DeviceTypes?
    var notificationPayload: Notification?
    var optionsPayload: Options?
    var inAppPayload: InApp?
    var messagePayload: Message?
    var campaignsPayload: Campaigns?
    
    // MARK: Initializers
    
    /// Init
    public init() {}
    
    // MARK: Audience
    
    /// Set audience from a JSON objet
    ///
    /// - Parameter audience: JSON
    /// - Returns: UABuilder
    public func audience(audience: JSON) -> UABuilder {
        self.audiencePayload = Audience(payload: audience)
        return self
    }
    
    /// Set audience using a predefined value
    ///
    /// - Parameter predefined: Audience.predefined
    /// - Returns: UABuilder
    /// - Throws: In case of invalid JSON
    public func audience(predefined: Audience.Predefined) throws -> UABuilder {
        self.audiencePayload = try Audience(predefined: predefined)
        return self
    }
    
    /// Set audience from a tag-string
    ///
    /// - Parameter tag: String
    /// - Returns: UABuilder
    public func audience(tag: String) -> UABuilder {
        self.audiencePayload = Audience(tag: tag)
        return self
    }
    
    // MARK: DeviceTypes
    
    /// Set device types from JSON object
    ///
    /// - Parameter deviceTypes: JSON
    /// - Returns: UABuilder
    public func deviceTypes(deviceTypes: JSON) -> UABuilder {
        self.deviceTypesPayload = DeviceTypes(payload: deviceTypes)
        return self
    }
    
    /// Set device types from predefined
    ///
    /// - Parameter predefined: DevideTypes.predefined
    /// - Returns: UABuilder
    /// - Throws: In case of invalid JSON
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
    
    // MARK: Notification
    
    /// Set notification from a JSON object
    ///
    /// - Parameter notification: JSON
    /// - Returns: UABuilder
    public func notification(notification: JSON) -> UABuilder {
        self.notificationPayload = Notification(payload: notification)
        return self
    }
    
    /// Set notification from a predefined value
    ///
    /// - Parameter predefined: Notification.predefined
    /// - Returns: UABuilder
    /// - Throws: In case of invalid JSON
    public func notification(predefined: Notification.Predefined) throws -> UABuilder {
        self.notificationPayload = try Notification(predefined: predefined)
        return self
    }
    
    /// Set notification using alert String
    ///
    /// - Parameter alert: String
    /// - Returns: UABuilder
    public func notification(alert: String) -> UABuilder {
        self.notificationPayload = Notification.init(alert: alert)
        return self
    }
    
    // MARK: Options
    
    /// Set options from a JSON object
    ///
    /// - Parameter options: JSON
    /// - Returns: UABuilder
    public func options(options: JSON) -> UABuilder {
        self.optionsPayload = Options(payload: options)
        return self
    }
    
    /// Set options from a predefined value
    ///
    /// - Parameter predefined: Options.Predefined
    /// - Returns: UABuilder
    /// - Throws: In case of invalid JSON
    public func options(predefined: Options.Predefined) throws -> UABuilder {
        self.optionsPayload = try Options(predefined: predefined)
        return self
    }
    
    // MARK: InApp
    
    /// Set in_app from a JSON object
    ///
    /// - Parameter inApp: JSON
    /// - Returns: UABuilder
    public func inApp(inApp: JSON) -> UABuilder {
        self.inAppPayload = InApp(payload: inApp)
        return self
    }
    
    /// Set in_app from a predefined value
    ///
    /// - Parameter predefined: InApp.Predefined
    /// - Returns: UABuilder
    /// - Throws: In case of invalid JSON
    public func inApp(predefined: InApp.Predefined) throws -> UABuilder {
        self.inAppPayload = try InApp(predefined: predefined)
        return self
    }
    
    // MARK: Message
    
    /// Set message from a JSON object
    ///
    /// - Parameter message: JSON
    /// - Returns: UABuilder
    public func message(message: JSON) -> UABuilder {
        self.messagePayload = Message(payload: message)
        return self
    }
    
    /// Set message from a predefined value
    ///
    /// - Parameter predefined: InApp.Predefined
    /// - Returns: UABuilder
    /// - Throws: In case of invalid JSON
    public func message(predefined: Message.Predefined) throws -> UABuilder {
        self.messagePayload = try Message(predefined: predefined)
        return self
    }
    
    // MARK: Campaigns
    
    /// Set campaigns from a JSON object
    ///
    /// - Parameter campaigns: JSON
    /// - Returns: UABuilder
    public func campaigns(campaigns: JSON) -> UABuilder {
        self.campaignsPayload = Campaigns(payload: campaigns)
        return self
    }
    
    /// Set campaigns from a predefined value
    ///
    /// - Parameter predefined: Campaign.Predefined
    /// - Returns: UABuilder
    /// - Throws: In case of invalid json
    public func campaigns(predefined: Campaigns.Predefined) throws -> UABuilder {
        self.campaignsPayload = try Campaigns(predefined: predefined)
        return self
    }
    
    /// Set campaigns from a list of categories
    ///
    /// - Parameter categories: [String]
    /// - Returns: UABuilder
    /// - Throws: In case campaig json cannot be created
    public func campaigns(categories: [String]) throws -> UABuilder {
        self.campaignsPayload = try Campaigns(categories: categories)
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
            try body.set("audience", unwrappedAudience.payload)
        }
        
        if let unwrappedDeviceTypes: DeviceTypes = deviceTypesPayload {
            try body.set("device_types", unwrappedDeviceTypes.payload)
        }
        
        if let unwrappedNotification: Notification = notificationPayload {
            try body.set("notification", unwrappedNotification.payload)
        }
        
        if let unwrappedOptions: Options = optionsPayload {
            try body.set("options", unwrappedOptions.payload)
        }
        
        if let unwrappedInApp: InApp = inAppPayload {
            try body.set("in_app", unwrappedInApp.payload)
        }
        
        if let unwrappedMessage: Message = messagePayload {
            try body.set("message", unwrappedMessage.payload)
        }
        
        if let unwrappedCampaigns: Campaigns = campaignsPayload {
            try body.set("campaigns", unwrappedCampaigns.payload)
        }
        
        return body
    }
    
}
