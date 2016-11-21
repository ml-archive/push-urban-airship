import Vapor

public final class UARequest {
    
    //Will be replaced later..
    let body: JSON
    
    public init(body: JSON) {
        self.body = body
    }
    
    public func getBody() -> JSON {
        return self.body
    }
    
}
