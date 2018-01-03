
import XCTest
import JSON
@testable import UAPusher

class MessageTests: XCTestCase {
    static var allTests : [(String, (MessageTests) -> () throws -> Void)] {
        return [
            ("testMessageInitFromJSON", testMessageInitFromJSON)
        ]
    }
    
    func testMessageInitFromJSON() {
        let messageJson: JSON = JSON([
            "title": "Message title",
            "body": "<Your message here>",
            "content_type": "text/html"
        ])
        
        let message: Message = Message(payload: messageJson)
        XCTAssertEqual(message.payload, messageJson)
    }

}
