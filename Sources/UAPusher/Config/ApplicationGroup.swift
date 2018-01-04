/// Defines an ApplicationGroup (from the config)
struct ApplicationGroup {
    /// Application group name eg. "defaultGroup"
    let name: String
    
    /// List of applications for group
    var applications: [Application]
}
