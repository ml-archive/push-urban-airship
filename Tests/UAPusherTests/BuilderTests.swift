
import XCTest
import JSON
@testable import UAPusher

class BuilderTests: XCTestCase {
    static var allTests : [(String, (BuilderTests) -> () throws -> Void)] {
        return [
            ("testEmptyState", testEmptyState),
            ("testSingleSegment", testSingleSegment),
            ("testMultipleSegments", testMultipleSegments)
        ]
    }
    
    func testEmptyState() throws {
        let expected: JSON = JSON()
        let builder: Builder = Builder()
        XCTAssertEqual(try builder.payload(), expected)
    }
    
    func testSingleSegment() throws {
        let segment: DeviceTypes = DeviceTypes([.ios, .android])
        
        var expected: JSON = JSON()
        try expected.set(segment.key, segment.payload)
        
        let builder: Builder = Builder()
        _ = builder.add(segment)
        
        XCTAssertEqual(try builder.payload(), expected)
    }
    
    func testMultipleSegments() throws {
        let segments: [Segment] = [
            try Audience(.all),
            try DeviceTypes(.android),
            try Notification(.alert(value: "This is a test"))
        ]
        
        var expected: JSON = JSON()
        
        for segment in segments {
            try expected.set(segment.key, segment.payload)
        }
        
        let builder = Builder()
        _ = builder.add(segments)
        
        XCTAssertEqual(try builder.payload(), expected)
    }
    
}
