import Vapor

extension Config {
    public var uapusher: UAManager? {
        get { return storage["uapusher"] as? UAManager }
        set { storage["uapusher"] = newValue }
    }
}

extension Droplet {
    public var uapusher: UAManager? {
        get { return config.uapusher }
        set { config.uapusher = newValue }
    }
}
