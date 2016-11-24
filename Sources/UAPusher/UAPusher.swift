import Vapor
import Foundation
import HTTP

public final class UAPusher {
    
    //Hello world!
    
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
    
    //MARK: Send
    
    public func send(request: UARequest) throws -> Status {
        
        //Add more defensive coding here
        
        let response = try self.connectionManager.post(slug: "/api/push", body: request.getBody())
        return response
        
    }
    
    public func send(request: JSON) throws -> Status {
        
        //Add more defensive coding here
        
        let response = try self.connectionManager.post(slug: "/api/push", body: request)
        return response
        
    }
    
    //MARK: Validate
    
    public func validateUASetup() throws -> Status {
        
        let body = try JSON(node: [
            "audience": "all",
            "device_types": [
                "ios",
                "android"
            ],
            "notification": [
                "ios": [
                    "alert": "VAPOR test"
                ]
            ]
        ])
        
        let response = try self.connectionManager.post(slug: "/api/push/validate", body: body)
        return response
        
    }
    
    public func validateRequest(request: JSON) throws -> Status {
        
        let response = try self.connectionManager.post(slug: "/api/push/validate", body: request)
        return response
        
    }
    
    public func validateRequest(request: UARequest) throws -> Status {
        
        let response = try self.connectionManager.post(slug: "/api/push/validate", body: request.getBody())
        return response
        
    }
    
}
