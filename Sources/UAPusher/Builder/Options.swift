import JSON
import Foundation

/// Options segment of an Urban Airship push notification payload
/// See: https://docs.urbanairship.com/api/ua/#push-options
public struct Options: Segment {
    // MARK: Class fields
    
    /// Key used for payload segment
    public let key: String = "options"
    
    /// The payload segment itself
    public let payload: JSON
    
    // MARK: Selector values
    
    /// Predefined payload segment selectors
    ///
    /// - expireInOneHour
    /// - expireIn24Hours
    /// - expireInOneWeek
    /// - expireInOneMonth
    /// - expireInOneYear
    public enum Selector: JSONRepresentable {
        case expireInOneHour
        case expireIn24Hours
        case expireInOneWeek
        case expireInOneMonth
        case expireInOneYear
        
        /// Generate json for corresponding enum case
        ///
        /// - Returns: Json representation of the payload segmet
        /// - Throws: If values cannot be converted to json
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
    
    /// Initialize the options segment from JSON
    ///
    /// - Parameter payload: Payload segment to use in final payload
    public init(payload: JSON) {
        self.payload = payload
    }
    
    /// Initialize the options segment from Selector
    ///
    /// - Parameter selector: Selector for a predefined payload segment
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
