import XCTest
import JSON
@testable import UAPusher

class NotificationTests: XCTestCase {
    
    func testNotificationInitFromJSON() {
        let notificationJson: JSON = JSON([
            "alert": "This is a push notification"
        ])
        
        let notification = Notification(json: notificationJson)
        XCTAssertEqual(notification.payload(), notificationJson)
    }
    
    func testNotificationInitFromPredefined() throws {
        let expected: JSON = JSON([
            "alert": "This is a test push notification, from nodes-vapor/push-urban-airship"
        ])
        let notification = try Notification(predefined: .testAlert)
        XCTAssertEqual(notification.payload(), expected)
    }
    
    func testNotificationInitFromAlert() {
        let alert: String = "This is a test"
        let expected: JSON = JSON([
            "alert": .string(alert)
        ])
        
        let notification = Notification(alert: alert)
        XCTAssertEqual(notification.payload(), expected)
    }
    
}
