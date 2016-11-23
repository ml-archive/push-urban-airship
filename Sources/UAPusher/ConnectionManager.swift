import Vapor
import HTTP

public final class ConnectionMananger {
    
    let drop: Droplet
    let baseUrl = "https://go.urbanairship.com"
    let config: UAPusherConfig
    
    public init(drop: Droplet, config: UAPusherConfig) {
        self.drop = drop
        self.config = config
    }
    
    func headers() -> [HeaderKey: String] {
        
        let username = self.config.appKey
        let password = self.config.masterSecret
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let headers = [
            HeaderKey("Accept"): "application/vnd.urbanairship+json; version=3;",
            HeaderKey("Content-Type"): "application/json",
            HeaderKey("Authorization"): "Basic \(base64LoginString)"
        ]
        
        return headers
    }
    
    
    func post(slug: String, body: JSON) throws -> Status {
        
        let url = baseUrl + slug
        let uaResponse = try drop.client.post(url, headers: headers(), body: body.makeBody())
        
        if(slug == "/api/push/validate" && uaResponse.status == .ok) {
            throw Abort.custom(status: uaResponse.status, message: "UA - Validated and should be ready to send push. Please use the '.send()' method instead")
        } else if(uaResponse.status != .accepted) {
            throw Abort.custom(status: uaResponse.status, message: "UA error - Response was not OK")
        } else {
            return .accepted
        }
    }
    
}
