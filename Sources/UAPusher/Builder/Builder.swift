import Vapor

/// Builder class for the request payload
public final class Builder {
    
    /// Payload segments
    private var segments: [Segment]
    
    /// Initializes the builder
    public init() {
        self.segments = []
    }
    
    /// Add a single segment
    ///
    /// - Parameter segment: Segment Urban airship payload segment
    /// - Returns: Builder
    public func add(_ segment: Segment) -> Builder {
        segments.append(segment)
        return self
    }
    
    /// Add a list of segments
    ///
    /// - Parameter segments: [Segment] List of Urban airship payload segments
    /// - Returns: Builder
    public func add(_ segments: [Segment]) -> Builder {
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
