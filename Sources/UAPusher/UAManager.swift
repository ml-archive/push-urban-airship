import Vapor
import HTTP

public enum UAError: Swift.Error {
    case response(uaResponse: UAResponse)
}

public final class UAManager {
    
    public let config: UAPusherConfig
    public let connectionManager: ConnectionManager
    public let drop: Droplet

    public convenience init(drop: Droplet) throws {
        let uaPusherConfig = try UAPusherConfig(drop: drop)
        let connectionManager = ConnectionManager(drop: drop, config: uaPusherConfig)
        
        self.init(config: uaPusherConfig, connectionManager: connectionManager, drop: drop)
    }
    
    public convenience init(uaPusherConfig: UAPusherConfig, drop: Droplet) {
        let connectionManager = ConnectionManager(drop: drop, config: uaPusherConfig)
        
        self.init(config: uaPusherConfig, connectionManager: connectionManager, drop: drop)
    }
    
    public init(config: UAPusherConfig, connectionManager: ConnectionManager, drop: Droplet) {
        self.config = config
        self.connectionManager = connectionManager
        self.drop = drop
    }
    
    public func send(request: UARequest) throws -> UAResponse {
        let responses = try self.connectionManager.post(slug: "/api/push", content: request.getBody())
        let uaResponse = UAResponse(responses: responses)
        
        if uaResponse.status != .accepted {
            throw UAError.response(uaResponse: uaResponse)
        }
        
        return uaResponse
    }
}
