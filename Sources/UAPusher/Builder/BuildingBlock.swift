import JSON

/// Protocol for the elements that makes up a complete
/// payload for an Urban airship request
protocol BuildingBlock {
    associatedtype Predefined: JSONRepresentable
    init(payload: JSON)
    var payload: JSON { get }
}

extension BuildingBlock {
    init(predefined: Predefined) throws {
        try self.init(payload: predefined.makeJSON())
    }
}
