import XCTest
import JSON
@testable import UAPusher

class AudienceTests: XCTestCase {
    
    func testAudienceInitFromJSON() {
        let audienceJson: JSON = JSON([
            "static_list": "subscriptions"
        ])
    
        let audience = Audience(payload: audienceJson)
        XCTAssertEqual(audience.payload, audienceJson)
    }
    
    func testAudienceInitFromPredefined() throws {
        let expected: JSON = JSON("all")
        let audience = try Audience(predefined: .all)
        XCTAssertEqual(audience.payload, expected)
    }
    
    func testAudienceInitFromTag() {
        let tag: String = "user_xyz"
        
        let expected: JSON = JSON([
            "tag": .string(tag)
        ])
        
        let audience = Audience(tag: tag)
        XCTAssertEqual(audience.payload, expected)
    }
    
}
