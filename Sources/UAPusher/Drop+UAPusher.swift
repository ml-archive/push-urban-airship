import Vapor

extension Droplet {
    public var uapusher: UAManager? {
        get { return storage["uapusher"] as? UAManager }
        set { storage["uapusher"] = newValue }
    }
}
