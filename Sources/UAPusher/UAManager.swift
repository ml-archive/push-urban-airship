import Vapor
import HTTP

public enum UAError: Swift.Error {
    case response(uaResponse: UAResponse)
}

public final class UAManager {
    
    public let config: UAPusherConfig
    public let connectionManager: ConnectionMananger
    public let drop: Droplet
    
    public convenience init(uaPusherConfig: UAPusherConfig, drop: Droplet) {
        let connectionManager = ConnectionMananger(drop: drop, config: uaPusherConfig)
        self.init(config: uaPusherConfig, connectionMananger: connectionManager, drop: drop)
    }
    
    public init(config: UAPusherConfig, connectionMananger: ConnectionMananger, drop: Droplet) {
        self.config = config
        self.connectionManager = connectionMananger
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
