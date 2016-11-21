import Vapor

public struct UAPusherConfig {
    
    var masterSecret: String
    var appKey: String
    
    enum ConfigError: String {
        case uapusher = "uapusher"
        case defaultApplication = "defaultApplication"
        case log = "log"
        case applications = "applications"
        
        var error: Abort {
            return .custom(status: .internalServerError,
                           message: "UAPusher error - uapusher.\(rawValue) config is missing.")
        }
    }
    
    init(drop: Droplet) throws {
        // Set config
        let optionalConfig = drop.config["uapusher"]
        
        guard let config: Config = optionalConfig else {
            throw ConfigError.uapusher.error
        }
        
        try self.init(config: config)
    }
    
    init(config: Config) throws {
        
        guard let masterSecret = config["master_secret"]?.string else {
            throw ConfigError.uapusher.error
        }
        
        guard let appKey = config["app_key"]?.string else {
            throw ConfigError.uapusher.error
        }
        
        self.masterSecret = masterSecret
        self.appKey = appKey
        
    }
    
}
