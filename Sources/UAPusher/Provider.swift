import Vapor

/// Urban airship provider for Vapor
public final class Provider: Vapor.Provider {
    var config: UAPusherConfig
    
    public static var repositoryName: String = "uapusher"

    public func boot(_ config: Config){}

    public func boot(_ drop: Droplet) {
        drop.uapusher = UAManager(uaPusherConfig: config, drop: drop)
    }
    
    public init(config: Config) throws {
        guard let config: Config = config["uapusher"] else {
            throw Abort(
                .internalServerError,
                metadata: nil,
                reason: "UAPusher error - uapusher.json config is missing."
            )
        }
        
        self.config = try UAPusherConfig(config: config)
    }
    
    public func beforeRun(_ drop: Droplet) {
        for group: ApplicationGroup in config.applicationGroups {
            for application: Application in group.applications {
                drop.console.info("loaded urban airship app: \(application.name)")
            }
        }
        
    }
}
