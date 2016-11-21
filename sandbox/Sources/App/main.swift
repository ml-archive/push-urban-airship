import Vapor
import UAPusher

let drop = Droplet()

drop.uapusher = try UAPusher(drop: drop)

drop.group("api") { api in
    api.resource("posts", PostController())
}

drop.run()
