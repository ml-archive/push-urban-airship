import Vapor

public final class Provider: Vapor.Provider {
    let config: UAPusherConfig
    public static var repositoryName: String = "uapusher"

    public func boot(_ config: Config) throws {
        let connectionManager = try ConnectionManager(
            clientFactory: config.resolveClient(),
            config: self.config
        )

        config.uapusher = UAManager(connectionManager: connectionManager)
    }

    public func boot(_ drop: Droplet) throws {}
    
    public init(config: Config) throws {
        self.config = try UAPusherConfig(config: config)
    }

    /// Called before the Droplet begins serving
    public func beforeRun(_: Droplet) {}
}
