# UAPusher
[![Swift Version](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-2-F6CBCA.svg)](http://vapor.codes)
[![Circle CI](https://circleci.com/gh/nodes-vapor/push-urban-airship/tree/master.svg?style=shield)](https://circleci.com/gh/nodes-vapor/push-urban-airship)
[![codebeat badge](https://codebeat.co/badges/b5bcf3d5-63ac-4834-9e0c-e37681169cff)](https://codebeat.co/projects/github-com-nodes-vapor-push-urban-airship-master)
[![codebeat badge](https://codebeat.co/badges/52c2f960-625c-4a63-ae63-52a24d747da1)](https://codebeat.co/projects/github-com-nodes-vapor-push-urban-airship)
[![codecov](https://codecov.io/gh/nodes-vapor/push-urban-airship/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/push-urban-airship)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/nodes-vapor/push-urban-airship)](http://clayallsopp.github.io/readme-score?url=https://github.com/nodes-vapor/push-urban-airship)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/push-urban-airship/master/LICENSE)


Send push notifications with Urban Airship for Vapor


## 📦 Installation

Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/nodes-vapor/push-urban-airship.git", majorVersion: 1)
```

### Config

Create config file `uapusher.json` with following syntax

```json
{
	"applicationGroups": {
		"defaultGroup": {
		    "development": {
		        "appKey": "yyyy",
		        "masterSecret": "yyyy"
		    },
		    "staging": {
		        "appKey": "yyyy",
		        "masterSecret": "yyyy"
		    }
		}
	}
}
```

You can define multiple apps like in the example. Else just delete one of groups


## Getting started 🚀
Init the UAPusher to drop

```swift
import UAPusher

try drop.addProvider(UAPusher.Provider.self)
```

### Example

```swift
let body = try JSON(node: [
	"audience": "all",
	"device_types": [
		"ios",
		"android"
	],
	"notification": [
		"alert": "hello world"
	]
])
        
let request = UARequest(body: body)
do {
	let response = try drop.uapusher?.send(request: request)
	if response.status == .accepted {
		print("Push send..")
	}
} catch UAError.response(let uaResponse) {
	//let response = uaResponse.response[0]
}
```
Check out the api documentation (http://docs.urbanairship.com/api/ua/)


## 🏆 Credits

This package is developed and maintained by the Vapor team at [Nodes](https://www.nodesagency.com).
The package owner for this project is [Rasmus](https://github.com/rasmusebbesen).


## 📄 License

This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
