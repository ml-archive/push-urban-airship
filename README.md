# UAPusher
[![Language](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org)
[![Build Status](https://travis-ci.org/nodes-vapor/push-urban-airship.svg?branch=master)](https://travis-ci.org/nodes-vapor/push-urban-airship)
[![codecov](https://codecov.io/gh/nodes-vapor/push-urban-airship/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/push-urban-airship)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/push-urban-airship/master/LICENSE)


Package:
`.Package(url: "https://github.com/nodes-vapor/push-urban-airship.git", majorVersion: 0, minor: 1)
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

Please add a config file `uapusher.json`. You can define multiple applications
to send the push to.

```bash
{
	"applicationGroups": {
        "defaultGroup": {
            "app-1": {
                "masterSecret": "xxxx",
                "appKey": "xxxx"
            },
            "ios-test-app": {
                "masterSecret": "yyyy",
                "appKey": "yyyy"
            }
        }
    }
}
```
