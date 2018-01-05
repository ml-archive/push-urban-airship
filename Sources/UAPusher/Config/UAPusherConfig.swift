import Vapor

/// Load the urban airship configuration
public struct UAPusherConfig {
    /// List of groups
    var applicationGroups: [ApplicationGroup] = []
    
    /// Initialize from Config
    ///
    /// - Parameter config: Vapor configuration
    /// - Throws: if required config is missing or malformed
    public init(config: Config) throws {
        // Load application group configuration
        guard let applicationGroupConfig = config["applicationGroups"]?.object else {
            throw Abort(
                .internalServerError,
                metadata: nil,
                reason: "UAPusher config error - applicationGroups are not set."
            )
        }
        
        if (applicationGroupConfig.count < 1) {
            throw Abort(
                .internalServerError,
                metadata: nil,
                reason: "UAPusher config error - there are no applicationGroups."
            )
        }
        
        // Init groups and applications
        for applicationGroup in applicationGroupConfig {
            var group = ApplicationGroup(name: applicationGroup.key, applications: [])
            
            guard let applicationsConfig = applicationGroup.value.object else {
                throw Abort(
                    .internalServerError,
                    metadata: nil,
                    reason: "UAPusher config error - applicationGroup is missing applications."
                )
            }
            
            for applicationConfig in applicationsConfig {
                let appName = applicationConfig.key
                
                guard let masterSecret = applicationConfig.value.object?["masterSecret"]?.string else {
                    throw Abort(
                        .internalServerError,
                        metadata: nil,
                        reason: "UAPusher config error - application is missing masterSecret."
                    )
                }
                
                guard let appKey = applicationConfig.value.object?["appKey"]?.string else {
                    throw Abort(
                        .internalServerError,
                        metadata: nil,
                        reason: "UAPusher config error - application is missing appKey."
                    )
                }
                
                group.applications.append(
                    Application(
                        name: appName,
                        masterSecret: masterSecret,
                        appKey: appKey
                    )
                )
            }
            
            // Store the group
            self.applicationGroups.append(group)
        }
    }
}
