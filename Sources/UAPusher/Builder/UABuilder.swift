import Vapor

/// Builder class for the request payload
public final class UABuilder {
    
    /// Payload segments
    public var segments: [Segment]
    
    /// Initializer
    public init() {
        self.segments = []
    }
    
    /// Add a single segment
    ///
    /// - Parameter segment: Segment UA payload segment
    /// - Returns: UABuilder
    public func add(_ segment: Segment) -> UABuilder {
        segments.append(segment)
        return self
    }
    
    /// Add a list of segments
    ///
    /// - Parameter segments: [Segment] List of UA payload segments
    /// - Returns: UABuilder
    public func add(_ segments: [Segment]) -> UABuilder {
        self.segments.append(contentsOf: segments)
        return self
    }
    
    /// Generate complete UA payload
    ///
    /// - Returns: JSON The payload to be sent to UA
    /// - Throws: If setting the json keys fails
    public func payload() throws -> JSON {
        var payload: JSON = JSON()
        
        for segment in segments {
            try payload.set(segment.key, segment.payload)
        }
        
        return payload
    }
    
}
