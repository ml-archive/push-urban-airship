import JSON

/// Protocol for the elements that makes up a complete
/// payload for an Urban airship request
protocol BuildingBlock {
    associatedtype Predefined: JSONRepresentable
    init(json: JSON)
    func payload() -> JSON
}

extension BuildingBlock {
    init(predefined: Predefined) throws {
        try self.init(json: predefined.makeJSON())
    }
}
