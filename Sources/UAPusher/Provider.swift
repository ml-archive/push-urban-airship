import TLS
import Vapor

public final class Provider: Vapor.Provider {
    let config: UAPusherConfig
    public static var repositoryName: String = "uapusher"
    private var connectionManager: ConnectionManager

    public func boot(_ config: Vapor.Config) throws {}

    public func boot(_ drop: Droplet) throws {
        connectionManager.client = try drop.config.resolveClient().makeClient(
            hostname: ConnectionManager.baseUrl,
            port: 443,
            securityLayer: .tls(Context(.client))
        )

        drop.uapusher = UAManager(connectionManager: connectionManager)
    }
    
    public init(config: Vapor.Config) throws {
        self.config = try UAPusherConfig(config: config)

        connectionManager = try ConnectionManager(
            config: self.config
        )
    }

    /// Called before the Droplet begins serving
    public func beforeRun(_: Droplet) {}
}
