import Vapor
import HTTP
import UAPusher

final class PostController: ResourceRepresentable {
    func index(request: Request) throws -> ResponseRepresentable {
        
        let body = try JSON(node: [
            "audience": "all",
            "device_types": [
                "ios",
                "android"
            ],
            "notification": [
                "ios": [
                    "alert": "hello world"
                ]
            ]
        ])
        
        let request = UARequest(body: body)
        let response = try drop.uapusher?.send(request: request)
        if response == .accepted {
            print("Push send..")
        }
        
        return try Post.all().makeNode().converted(to: JSON.self)
    }

    func create(request: Request) throws -> ResponseRepresentable {
        var post = try request.post()
        try post.save()
        
        return post
    }

    func show(request: Request, post: Post) throws -> ResponseRepresentable {
        return post
    }

    func delete(request: Request, post: Post) throws -> ResponseRepresentable {
        try post.delete()
        return JSON([:])
    }

    func clear(request: Request) throws -> ResponseRepresentable {
        try Post.query().delete()
        return JSON([])
    }

    func update(request: Request, post: Post) throws -> ResponseRepresentable {
        let new = try request.post()
        var post = post
        post.content = new.content
        try post.save()
        
        return post
    }

    func replace(request: Request, post: Post) throws -> ResponseRepresentable {
        try post.delete()
        return try create(request: request)
    }

    func makeResource() -> Resource<Post> {
        return Resource(
            index: index,
            store: create,
            show: show,
            replace: replace,
            modify: update,
            destroy: delete,
            clear: clear
        )
    }
}

extension Request {
    func post() throws -> Post {
        guard let json = json else { throw Abort.badRequest }
        return try Post(node: json)
    }
}
