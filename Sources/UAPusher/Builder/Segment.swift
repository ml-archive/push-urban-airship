import JSON

/// Protocol for the elements that makes up a complete
/// payload for an Urban airship push request
public protocol Segment {
    var key: String { get }
    var payload: JSON { get }
    init(payload: JSON)
}
