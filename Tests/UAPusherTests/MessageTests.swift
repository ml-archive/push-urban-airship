
import XCTest
import JSON
@testable import UAPusher

class MessageTests: XCTestCase {
    
    func testMessageInitFromJSON() {
        let messageJson: JSON = JSON([
            "title": "Message title",
            "body": "<Your message here>",
            "content_type": "text/html"
        ])
        
        let message: Message = Message(payload: messageJson)
        XCTAssertEqual(message.payload, messageJson)
    }
    
    func testMessageInitFromPredefined() throws {
        let expected: JSON = JSON([
            "title": "This is a test",
            "body": "This is a test message sent from UAPusher",
            "content_type": "text/html"
        ])
        let message = try Message(predefined: .test)
        XCTAssertEqual(message.payload, expected)
    }
}
