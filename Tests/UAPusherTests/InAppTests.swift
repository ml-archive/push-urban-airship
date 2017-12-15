
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

    func testInAppInitFromPredefined() throws {
        let expected: JSON = JSON([
            "alert": "This is a test in-app alert from UAPusher",
            "display_type": "banner"
        ])
        
        let inApp = try InApp(predefined: .alert)
        XCTAssertEqual(inApp.payload, expected)
    }
}
