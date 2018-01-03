import XCTest
import JSON
@testable import UAPusher

class AudienceTests: XCTestCase {
    static var allTests : [(String, (AudienceTests) -> () throws -> Void)] {
        return [
            ("testAudienceInitFromJSON", testAudienceInitFromJSON),
            ("testAudienceInitFromAll", testAudienceInitFromAll),
            ("testAudienceInitFromTag", testAudienceInitFromTag),
            ("testAudienceInitFromTags", testAudienceInitFromTags),
            ("testAudienceInitFromNamedUser", testAudienceInitFromNamedUser),
            ("testAudienceInitFromAlias", testAudienceInitFromAlias)
        ]
    }
    
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
        
        var expected: JSON = JSON()
        try expected.set("tag", tag)
        
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
    
    func testAudienceInitFromNamedUser() throws {
        let namedUser: String = "user_123"
        
        var expected: JSON = JSON()
        try expected.set("named_user", namedUser)
        
        let audience = try Audience(.namedUser(value: namedUser))
        XCTAssertEqual(audience.payload, expected)
    }
    
    func testAudienceInitFromAlias() throws {
        let alias: String = "user_123"
        
        var expected: JSON = JSON()
        try expected.set("named_user", alias)
        
        let audience = try Audience(.alias(value: alias))
        XCTAssertEqual(audience.payload, expected)
    }

}
