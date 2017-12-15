

import XCTest
import JSON
@testable import UAPusher

class UABuilderTests: XCTestCase {
    var builder: UABuilder = UABuilder()
    var expected: JSON = JSON()
    
    override func setUp() {
        builder = UABuilder()
        expected = JSON()
    }
    
    func testAudienceJSON() throws {
        let payload: JSON = JSON(["testing": "is fun"])
        try expected.set("audience", payload)
        _ = builder.audience(audience: payload)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testDeviceTypesJSON() throws {
        let payload: JSON = JSON(["testing": "is fun"])
        try expected.set("device_types", payload)
        _ = builder.deviceTypes(deviceTypes: payload)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testNotificationJSON() throws {
        let payload: JSON = JSON(["testing": "is fun"])
        try expected.set("notification", payload)
        _ = builder.notification(notification: payload)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testOptionsJSON() throws {
        let payload: JSON = JSON(["testing": "is fun"])
        try expected.set("options", payload)
        _ = builder.options(options: payload)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testInAppJSON() throws {
        let payload: JSON = JSON(["testing": "is fun"])
        try expected.set("in_app", payload)
        _ = builder.inApp(inApp: payload)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testMessageJSON() throws {
        let payload: JSON = JSON(["testing": "is fun"])
        try expected.set("message", payload)
        _ = builder.message(message: payload)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testCampaignsJSON() throws {
        let payload: JSON = JSON(["testing": "is fun"])
        try expected.set("campaigns", payload)
        _ = builder.campaigns(campaigns: payload)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testAudiencePredefined() throws {
        try expected.set("audience", Audience.Predefined.all.makeJSON())
        _ = try builder.audience(predefined: .all)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testDeviceTypesPredefined() throws {
        try expected.set("device_types", DeviceTypes.Predefined.all.makeJSON())
        _ = try builder.deviceTypes(predefined: .all)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testNotificationPredefined() throws {
        try expected.set("notification", Notification.Predefined.testAlert.makeJSON())
        _ = try builder.notification(predefined: .testAlert)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testOptionsPredefined() throws {
        try expected.set("options", Options.Predefined.expireIn24Hours.makeJSON())
        _ = try builder.options(predefined: .expireIn24Hours)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testInAppPredefined() throws {
        try expected.set("in_app", InApp.Predefined.alert.makeJSON())
        _ = try builder.inApp(predefined: .alert)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testMessagePredefined() throws {
        try expected.set("message", Message.Predefined.test.makeJSON())
        _ = try builder.message(predefined: .test)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testCampaignsPredefined() throws {
        try expected.set("campaigns", Campaigns.Predefined.test.makeJSON())
        _ = try builder.campaigns(predefined: .test)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testAudienceTag() throws {
        let tag: String = "user123"
        try expected.set("audience", JSON(["tag": JSON(tag)]))
        _ = builder.audience(tag: tag)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testDeviceTypesCompound() throws {
        let types = [
            DeviceTypes.Predefined.android,
            DeviceTypes.Predefined.ios
        ]
        
        let expectedTypes = [
            DeviceTypes.Predefined.android.makeJSON(),
            DeviceTypes.Predefined.ios.makeJSON()
        ]
        
        try expected.set("device_types", expectedTypes)
        _ = builder.deviceTypes(compound: types)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testNotificationAlert() throws {
        let notification: String = "Test notification"
        try expected.set("notification", JSON(["alert": .string(notification)]))
        _ = builder.notification(alert: notification)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
    func testCampaignsList() throws {
        let categories: [String] = ["foo", "bar"]
        var expectedJson: JSON = JSON()
        try expectedJson.set("categories", categories)
        try expected.set("campaigns", expectedJson)
        _ = try builder.campaigns(categories: categories)
        XCTAssertEqual(try builder.makeBody().makeJSON(), expected)
    }
    
}
