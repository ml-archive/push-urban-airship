import Vapor
import HTTP

/// Urban Airship response
final public class UAResponse {
    
    public let responses: [Response]
    
    public var status: Status {
        for response in responses {
            if response.status != .accepted {
                responses.forEach { response in
                    print(response.makeResponse())
                }
                
                return response.status
            }
        }
        
        return .accepted
    }
    
    init(responses: [Response]) {
        self.responses = responses
    }
}
