import JSON
import Foundation

/// Options segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#push-options
public struct Options: Segment {
    // MARK: Class fields
    
    public let key: String = "options"
    public var payload: JSON
    
    // MARK: Selector values
    
    public enum Selector: JSONRepresentable {
        
        case expireInOneHour
        case expireIn24Hours
        case expireInOneWeek
        case expireInOneMonth
        case expireInOneYear
        
        public func makeJSON() throws -> JSON {
            var expiration: Date
            
            switch self {
            case .expireInOneHour:
                expiration = Date(timeIntervalSinceNow: 3600)
            case .expireIn24Hours:
                expiration = Date(timeIntervalSinceNow: 86400)
            case .expireInOneWeek:
                expiration = Date(timeIntervalSinceNow: 604800)
            case .expireInOneMonth:
                /// 30 days
                expiration = Date(timeIntervalSinceNow: 2592000)
            case .expireInOneYear:
                /// 365 days
                expiration = Date(timeIntervalSinceNow: 31536000)
            }
            
            return JSON(json: [
                "expiry": .string(DateFormatter.uaISO8601.string(from: expiration))
            ])
        
        }
        
    }
    
    // MARK: Initializers
    
    /// Init from JSON
    ///
    /// - Parameter audience: JSON
    public init(payload: JSON) {
        self.payload = payload
    }
    
    /// Init from Selector
    ///
    /// - Parameter selector: Selector
    public init(_ selector: Selector) throws {
        try self.payload = selector.makeJSON()
    }

}

/// Urban airship ISO8601 Date Formatter
/// http://stackoverflow.com/a/28016692/2611971
extension DateFormatter {
    @nonobjc public static let uaISO8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
}
