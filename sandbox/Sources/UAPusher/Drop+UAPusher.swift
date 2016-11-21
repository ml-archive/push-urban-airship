import Vapor

extension Droplet {
    public var uapusher: UAPusher? {
        get { return storage["uapusher"] as? UAPusher }
        set { storage["uapusher"] = newValue }
    }
}
