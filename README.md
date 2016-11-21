# UAPusher

Package:
`.Package(url: "https://github.com/nodes-vapor/push-urban-airship.git", majorVersion: 0)
`

In `main.swift` import the UAPusher framework and just instantiate on the droplet.


```swift
import Vapor
import UAPusher

let drop = Droplet()

drop.uapusher = try UAPusher(drop: drop)

drop.group("api") { api in
    api.resource("posts", PostController())
}

drop.run()
```

Use the following code in your project to send a push (will be updated very soon to have it's own builder)

```swift
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
```

Please add a config file `uapusher.json`

```bash
{
    "master_secret": "xxxx",
    "app_key": "xxxx"
}
```