import XCTest
import JSON
@testable import UAPusher

class OptionsTests: XCTestCase {
    static var allTests : [(String, (OptionsTests) -> () throws -> Void)] {
        return [
            ("testOptionsInitFromJSON", testOptionsInitFromJSON),
            ("testOptionsInitFromPredefinedOneHour", testOptionsInitFromPredefinedOneHour),
            ("testOptionsInitFromPredefined24Hours", testOptionsInitFromPredefined24Hours),
            ("testOptionsInitFromPredefinedOneWeek", testOptionsInitFromPredefinedOneWeek),
            ("testOptionsInitFromPredefinedOneMonth", testOptionsInitFromPredefinedOneMonth),
            ("testOptionsInitFromPredefinedOneYear", testOptionsInitFromPredefinedOneYear)
        ]
    }
    
    func testOptionsInitFromJSON() {
        let expiryDate = Date()
        let optionsJson: JSON = JSON([
            "expiry":.string(DateFormatter.uaISO8601.string(from: expiryDate))
        ])
        
        let options = Options(payload: optionsJson)
        
        XCTAssertEqual(options.payload, optionsJson)
    }
    
    func testOptionsInitFromPredefinedOneHour() throws {
        let expiryDate = Date(timeIntervalSinceNow: 3600)
        let expected: JSON = JSON([
            "expiry":.string(DateFormatter.uaISO8601.string(from: expiryDate))
        ])
        
        let options: Options = try Options(.expireInOneHour)
        
        XCTAssertEqual(options.payload, expected)
    }
    
    func testOptionsInitFromPredefined24Hours() throws {
        let expiryDate = Date(timeIntervalSinceNow: 86400)
        let expected: JSON = JSON([
            "expiry":.string(DateFormatter.uaISO8601.string(from: expiryDate))
        ])
        
        let options: Options = try Options(.expireIn24Hours)
        
        XCTAssertEqual(options.payload, expected)
    }
    
    func testOptionsInitFromPredefinedOneWeek() throws {
        let expiryDate = Date(timeIntervalSinceNow: 604800)
        let expected: JSON = JSON([
            "expiry":.string(DateFormatter.uaISO8601.string(from: expiryDate))
        ])
        
        let options: Options = try Options(.expireInOneWeek)
        
        XCTAssertEqual(options.payload, expected)
    }
    
    func testOptionsInitFromPredefinedOneMonth() throws {
        let expiryDate = Date(timeIntervalSinceNow: 2592000)
        let expected: JSON = JSON([
            "expiry":.string(DateFormatter.uaISO8601.string(from: expiryDate))
        ])
        
        let options: Options = try Options(.expireInOneMonth)
        
        XCTAssertEqual(options.payload, expected)
    }
    
    func testOptionsInitFromPredefinedOneYear() throws {
        let expiryDate = Date(timeIntervalSinceNow: 31536000)
        let expected: JSON = JSON([
            "expiry":.string(DateFormatter.uaISO8601.string(from: expiryDate))
        ])
        
        let options: Options = try Options(.expireInOneYear)
        
        XCTAssertEqual(options.payload, expected)
    }
}
