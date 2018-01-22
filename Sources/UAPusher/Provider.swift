import Vapor

public final class Provider: Vapor.Provider {
    let config: UAPusherConfig
    public static var repositoryName: String = "uapusher"
    private var connectionManager: ConnectionManager

    public func boot(_ config: Config) throws {}

    public func boot(_ drop: Droplet) throws {
        drop.uapusher = UAManager(connectionManager: connectionManager)
    }
    
    public init(config: Config) throws {
        self.config = try UAPusherConfig(config: config)
        connectionManager = try ConnectionManager(
            clientFactory: config.resolveClient(),
            config: self.config
        )
    }

    /// Called before the Droplet begins serving
    public func beforeRun(_: Droplet) {}
}
