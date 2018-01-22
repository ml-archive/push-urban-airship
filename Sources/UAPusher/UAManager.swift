import Vapor
import HTTP

public enum UAError: Swift.Error {
    case response(uaResponse: UAResponse)
}

public final class UAManager {
    public let connectionManager: ConnectionManager

    public init(connectionManager: ConnectionManager) {
        self.connectionManager = connectionManager
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
