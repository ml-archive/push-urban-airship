
import XCTest
import JSON
@testable import UAPusher

class CampaignsTest: XCTestCase {
    
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
    
    func testCampaingsInitFromPredefined() throws {
        let expected: JSON = JSON([
            "categories": [
                "kittens",
                "tacos",
                "horse_racing"
            ]
        ])
        
        let campaigns: Campaigns = try Campaigns(predefined: .test)
        XCTAssertEqual(campaigns.payload, expected)
    }
    
    func testCampaignsInitFromStringList() throws {
        let list: [String] = [
            "cars",
            "boats",
            "bikes"
        ]
        
        var expected: JSON = JSON()
        try expected.set("categories", list)
        
        let campaigns: Campaigns = try Campaigns(categories: list)
        XCTAssertEqual(campaigns.payload, expected)
    }
}
