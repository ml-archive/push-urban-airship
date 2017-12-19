
import XCTest
import JSON
@testable import UAPusher

class InAppTests: XCTestCase {
    
    func testInAppInitFromJSON() {
        let inAppJson: JSON = JSON([
            "alert": "This part appears in-app!",
            "display_type": "banner",
            "expiry": "2015-04-01T12:00:00",
            "display": [
                "position": "top"
            ]
        ])
        
        let inApp: InApp = InApp(payload: inAppJson)
        XCTAssertEqual(inApp.payload, inAppJson)
    }
    
}
