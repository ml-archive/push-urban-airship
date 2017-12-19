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
    
    func testAudienceInitFromAll() throws {
        let expected: JSON = JSON("all")
        let audience = try Audience(.all)
        XCTAssertEqual(audience.payload, expected)
    }
    
    func testAudienceInitFromTag() throws {
        let tag: String = "user_xyz"
        
        let expected: JSON = JSON([
            "tag": .string(tag)
        ])
        
        let audience = try Audience(.tag(value: tag))
        XCTAssertEqual(audience.payload, expected)
    }
    
    func testAudienceInitFromTags() throws {
        let tags: [String] = ["tag-a", "tag-b", "tag-c"]
        
        var expected: JSON = JSON()
        try expected.set("tag", tags)
        
        let audience = try Audience(.tags(values: tags))
        XCTAssertEqual(audience.payload, expected)
    }
    
}
