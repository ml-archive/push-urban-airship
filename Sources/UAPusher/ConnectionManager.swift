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
    
    /// Defines the headers of the request with the given appKey and
    /// masterSecret
    ///
    /// - Parameters:
    ///   - appKey: UA applicatication key
    ///   - masterSecret: UA master secret key
    /// - Returns: array of HeaderKey
    func defineHeaders(appKey: String, masterSecret: String) -> [HeaderKey: String] {
        
        let username = appKey
        let password = masterSecret
        let loginString = username + ":" + password
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        let headers = [
            HeaderKey("Accept"): "application/vnd.urbanairship+json; version=3;",
            HeaderKey("Content-Type"): "application/json",
            HeaderKey("Authorization"): "Basic \(base64LoginString)"
        ]
        
        return headers
    }
    
    /// This will send the POST request to each of the defined
    /// applicationGroups and the applications defined by them
    ///
    /// - Parameters:
    ///   - slug: endpoint
    ///   - content: JSON content
    /// - Returns: array of Status for each request made
    /// - Throws: if POST fails
    func post(slug: String, content: JSON) throws -> [Status] {
        
        let url = baseUrl + slug
        let body = content.makeBody()
        
        var status: [Status] = []
        
        for applicationGroup in self.config.applicationGroups {
            
            for application in applicationGroup.applications {
                
                let headers = defineHeaders(
                    appKey: application.appKey,
                    masterSecret: application.masterSecret
                )
                
                let uaResponse = try drop.client.post(
                    url,
                    headers: headers,
                    body: body
                )
                
                status.append(uaResponse.status)
            }
        }
        
        return status
    }
}
