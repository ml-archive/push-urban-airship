/// Defines an Application (from the config)
struct Application {
    /// Application name eg. "development"
    let name: String
    
    /// Urban airship api master secret for application
    let masterSecret: String
    
    /// Urban airship api application key
    let appKey: String
}
