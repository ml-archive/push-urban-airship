import Vapor
import HTTP

public final class UAPusher {
    
    public let config: UAPusherConfig
    public let connectionManager: ConnectionMananger
    public let drop: Droplet
    
    public convenience init(drop: Droplet) throws {
        let uaPusherConfig = try UAPusherConfig(drop: drop)
        let connectionManager = ConnectionMananger(drop: drop, config: uaPusherConfig)
        
        try self.init(config: uaPusherConfig, connectionMananger: connectionManager, drop: drop)
    }
    
    public init(config: UAPusherConfig, connectionMananger: ConnectionMananger, drop: Droplet) throws {
        self.config = config
        self.connectionManager = connectionMananger
        self.drop = drop
    }
    
    public func send(request: UARequest) throws -> UAResponse {
        
        //Add more defensive coding here
        
        let responses = try self.connectionManager.post(slug: "/api/push", content: request.getBody())
        
        let uaResponse = UAResponse(responses: responses)
        
        if uaResponse.status != .accepted {
            throw Abort.custom(status: uaResponse.status, message: "UA request was not OK")
        }
        
        return uaResponse
    }
}
