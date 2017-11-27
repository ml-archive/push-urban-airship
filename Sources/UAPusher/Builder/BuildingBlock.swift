import JSON

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
