import XCTest
import JSON
@testable import UAPusher

class DeviceTypesTests: XCTestCase {
    static var allTests : [(String, (DeviceTypesTests) -> () throws -> Void)] {
        return [
            ("testDeviceTypesInitFromJSON", testDeviceTypesInitFromJSON),
            ("testDeviceTypesInitFromPredefinedAll", testDeviceTypesInitFromPredefinedAll),
            ("testDeviceTypesInitFromPredefinedIos", testDeviceTypesInitFromPredefinedIos),
            ("testDeviceTypesInitFromPredefinedAndroid", testDeviceTypesInitFromPredefinedAndroid),
            ("testDeviceTypesInitFromPredefinedWindowsPhone", testDeviceTypesInitFromPredefinedWindowsPhone),
            ("testDeviceTypesInitFromPredefinedWeb", testDeviceTypesInitFromPredefinedWeb),
            ("testDeviceTypesInitFromCompoundPredefined", testDeviceTypesInitFromCompoundPredefined)
        ]
    }
    
    func testDeviceTypesInitFromJSON() {
        let deviceTypesJson: JSON = JSON(["ios", "android", "web"])
        let deviceTypes = DeviceTypes(payload: deviceTypesJson)
        XCTAssertEqual(deviceTypes.payload, deviceTypesJson)
    }
    
    func testDeviceTypesInitFromPredefinedAll() throws {
        let expected: JSON = JSON("all")
        let deviceTypes = try DeviceTypes(.all)
        XCTAssertEqual(deviceTypes.payload, expected)
    }
    
    func testDeviceTypesInitFromPredefinedIos() throws {
        let expected: JSON = JSON(["ios"])
        let deviceTypes = try DeviceTypes(.ios)
        XCTAssertEqual(deviceTypes.payload, expected)
    }
    
    func testDeviceTypesInitFromPredefinedAndroid() throws {
        let expected: JSON = JSON(["android"])
        let deviceTypes = try DeviceTypes(.android)
        XCTAssertEqual(deviceTypes.payload, expected)
    }
    
    func testDeviceTypesInitFromPredefinedWindowsPhone() throws {
        let expected: JSON = JSON(["wns"])
        let deviceTypes = try DeviceTypes(.windows)
        XCTAssertEqual(deviceTypes.payload, expected)
    }
    
    func testDeviceTypesInitFromPredefinedWeb() throws {
        let expected: JSON = JSON(["web"])
        let deviceTypes = try DeviceTypes(.web)
        XCTAssertEqual(deviceTypes.payload, expected)
    }
    
    func testDeviceTypesInitFromCompoundPredefined() {
        let expected: JSON = JSON(["ios", "android", "web"])
        let deviceTypes = DeviceTypes([.ios, .android, .web])
        XCTAssertEqual(deviceTypes.payload, expected)
    }
    
}
