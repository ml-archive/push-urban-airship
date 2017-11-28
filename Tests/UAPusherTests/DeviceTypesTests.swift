import XCTest
import JSON
@testable import UAPusher

class DeviceTypesTests: XCTestCase {
    
    func testDeviceTypesInitFromJSON() {
        let deviceTypesJson: JSON = JSON(["ios", "android", "web"])
        let deviceTypes = DeviceTypes(json: deviceTypesJson)
        XCTAssertEqual(deviceTypes.payload(), deviceTypesJson)
    }
    
    func testDeviceTypesInitFromPredefinedAll() throws {
        let expected: JSON = JSON("all")
        let deviceTypes = try DeviceTypes(predefined: .all)
        XCTAssertEqual(deviceTypes.payload(), expected)
    }
    
    func testDeviceTypesInitFromPredefinedIos() throws {
        let expected: JSON = JSON("ios")
        let deviceTypes = try DeviceTypes(predefined: .ios)
        XCTAssertEqual(deviceTypes.payload(), expected)
    }
    
    func testDeviceTypesInitFromPredefinedAndroid() throws {
        let expected: JSON = JSON("android")
        let deviceTypes = try DeviceTypes(predefined: .android)
        XCTAssertEqual(deviceTypes.payload(), expected)
    }
    
    func testDeviceTypesInitFromPredefinedWindowsPhone() throws {
        let expected: JSON = JSON("wns")
        let deviceTypes = try DeviceTypes(predefined: .windows)
        XCTAssertEqual(deviceTypes.payload(), expected)
    }
    
    func testDeviceTypesInitFromPredefinedWeb() throws {
        let expected: JSON = JSON("web")
        let deviceTypes = try DeviceTypes(predefined: .web)
        XCTAssertEqual(deviceTypes.payload(), expected)
    }
    
    func testDeviceTypesInitFromCompoundPredefined() {
        let expected: JSON = JSON(["ios", "android", "web"])
        let deviceTypes = DeviceTypes(compound: [.ios, .android, .web])
        XCTAssertEqual(deviceTypes.payload(), expected)
    }
    
}
