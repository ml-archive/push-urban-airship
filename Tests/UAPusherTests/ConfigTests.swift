
import XCTest
@testable import UAPusher
import Vapor

class ConfigTests: XCTestCase {
    static var allTests : [(String, (ConfigTests) -> () throws -> Void)] {
        return [
            ("testValidConfigOneGroupOneApp", testValidConfigOneGroupOneApp),
            ("testInvalidConfigNoAppKeyThrowsError", testInvalidConfigNoAppKeyThrowsError),
            ("testInvalidConfigNoMasterSecretThrowsError", testInvalidConfigNoMasterSecretThrowsError),
            ("testInvalidConfigNoAppNameThrowsError", testInvalidConfigNoAppNameThrowsError),
            ("testInvalidConfigNoConfigThrowsError", testInvalidConfigNoConfigThrowsError),
            ("testInvalidConfigWrongKeyGroup", testInvalidConfigWrongKeyGroup),
            ("testInvalidConfigWrongKeyAppKey", testInvalidConfigWrongKeyAppKey),
            ("testInvalidConfigWrongKeyMasterSecret", testInvalidConfigWrongKeyMasterSecret),
        ]
    }
    
    func testValidConfigOneGroupOneApp() throws {
        let config: Config = Config([
            "applicationGroups": [
                "defaultGroup": [
                    "development": [
                        "appKey": "some-testable-app-key",
                        "masterSecret": "some-testable-master-secret"
                    ]
                ]
            ]
        ])
        
        let cfg = try UAPusherConfig(config: config)
        
        XCTAssertNotNil(cfg.applicationGroups[0], "Application group element was nil")
        let group: ApplicationGroup = cfg.applicationGroups[0]
        
        XCTAssertEqual(group.name, "defaultGroup")
        
        XCTAssertNotNil(group.applications[0], "Application element was nil")
        let app: Application = group.applications[0]
        
        XCTAssertEqual(app.name, "development")
        XCTAssertEqual(app.appKey, "some-testable-app-key")
        XCTAssertEqual(app.masterSecret, "some-testable-master-secret")
    }
    
    func testInvalidConfigNoAppKeyThrowsError() throws {
        let config: Config = Config([
            "applicationGroups": [
                "defaultGroup": [
                    "development": [
                        "masterSecret": "some-testable-master-secret"
                    ]
                ]
            ]
        ])
        
        XCTAssertThrowsError(try UAPusherConfig(config: config))
    }
    
    func testInvalidConfigNoMasterSecretThrowsError() throws {
        let config: Config = Config([
            "applicationGroups": [
                "defaultGroup": [
                    "development": [
                        "appKey": "some-testable-app-key",
                    ]
                ]
            ]
        ])
        
        XCTAssertThrowsError(try UAPusherConfig(config: config))
    }
    
    func testInvalidConfigNoAppNameThrowsError() throws {
        let config: Config = Config([
            "applicationGroups": [
                "defaultGroup": [
                    "appKey": "some-testable-app-key",
                    "masterSecret": "some-testable-master-secret"
                ]
            ]
        ])
        
        XCTAssertThrowsError(try UAPusherConfig(config: config))
    }
    
    func testInvalidConfigNoConfigThrowsError() throws {
        let config: Config = Config([])
        XCTAssertThrowsError(try UAPusherConfig(config: config))
    }
    
    func testInvalidConfigWrongKeyGroup() throws {
        let config: Config = Config([
            "appGroups": [
                "defaultGroup": [
                    "development": [
                        "appKey": "some-testable-app-key",
                        "masterSecret": "some-testable-master-secret"
                    ]
                ]
            ]
        ])
        
        XCTAssertThrowsError(try UAPusherConfig(config: config))
    }
    
    func testInvalidConfigWrongKeyAppKey() throws {
        let config: Config = Config([
            "applicationGroups": [
                "defaultGroup": [
                    "development": [
                        "applicationKey": "some-testable-app-key",
                        "masterSecret": "some-testable-master-secret"
                    ]
                ]
            ]
        ])
        
        XCTAssertThrowsError(try UAPusherConfig(config: config))
    }
    
    func testInvalidConfigWrongKeyMasterSecret() throws {
        let config: Config = Config([
            "applicationGroups": [
                "defaultGroup": [
                    "development": [
                        "appKey": "some-testable-app-key",
                        "masterSeacret": "some-testable-master-secret"
                    ]
                ]
            ]
        ])
        
        XCTAssertThrowsError(try UAPusherConfig(config: config))
    }
}
