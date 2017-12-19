import JSON

/// Protocol for the elements that makes up a complete
/// payload for an Urban airship push request
protocol Segment {
    var key: String { get }
    init(payload: JSON)
}


