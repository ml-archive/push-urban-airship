import XCTest
import JSON
@testable import UAPusher

class NotificationTests: XCTestCase {
    static var allTests : [(String, (NotificationTests) -> () throws -> Void)] {
        return [
            ("testNotificationInitFromJSON", testNotificationInitFromJSON),
            ("testNotificationInitFromPredefined", testNotificationInitFromPredefined)
        ]
    }
    
    func testNotificationInitFromJSON() {
        let notificationJson: JSON = JSON([
            "alert": "This is a push notification"
        ])
        
        let notification = Notification(payload: notificationJson)
        XCTAssertEqual(notification.payload, notificationJson)
    }
    
    func testNotificationInitFromPredefined() throws {
        let msg: String = "This is a test push notification, from nodes-vapor/push-urban-airship"
        var expected: JSON = JSON()
        try expected.set("alert", msg)
        
        let notification = try Notification(.alert(value: msg))
        XCTAssertEqual(notification.payload, expected)
    }
    
}
