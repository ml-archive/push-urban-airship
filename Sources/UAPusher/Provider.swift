import TLS
import Vapor

public final class Provider: Vapor.Provider {
    let config: UAPusherConfig
    public static var repositoryName: String = "uapusher"

    public func boot(_ config: Vapor.Config) throws {}

    public func boot(_ drop: Droplet) throws {
        let connectionManager = try ConnectionManager(
            config: self.config,
            clientFactory: drop.config.resolveClient()
        )

        drop.uapusher = UAManager(connectionManager: connectionManager)
    }
    
    public init(config: Vapor.Config) throws {
        self.config = try UAPusherConfig(config: config)
    }

    /// Called before the Droplet begins serving
    public func beforeRun(_: Droplet) {}
}
