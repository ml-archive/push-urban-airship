
import XCTest
import JSON
@testable import UAPusher

class CampaignsTests: XCTestCase {
    static var allTests : [(String, (CampaignsTests) -> () throws -> Void)] {
        return [
            ("testCampaignsInitFromJSON", testCampaignsInitFromJSON),
            ("testCampaingsInitFromCategories", testCampaingsInitFromCategories)
        ]
    }
    
    func testCampaignsInitFromJSON() {
        let campaignJson: JSON = JSON([
            "categories": [
                "kittens",
                "puppies"
            ]
        ])
        
        let campaigns: Campaigns = Campaigns(payload: campaignJson)
        XCTAssertEqual(campaigns.payload, campaignJson)
    }
    
    func testCampaingsInitFromCategories() throws {
        let categories = ["kittens", "tacos", "horse_racing"]
        var expected: JSON = JSON()
        try expected.set("categories", categories)
        
        let campaigns: Campaigns = try Campaigns(.categories(values: categories))
        XCTAssertEqual(campaigns.payload, expected)
    }
    
}
