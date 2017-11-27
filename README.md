# UAPusher
Send push notification payloads to Urban Airship from your server using Vapor.

[![Swift Version](https://img.shields.io/badge/Swift-3.1-brightgreen.svg)](http://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-2-F6CBCA.svg)](http://vapor.codes)
[![Linux Build Status](https://img.shields.io/circleci/project/github/nodes-vapor/push-urban-airship.svg?label=Linux)](https://circleci.com/gh/nodes-vapor/push-urban-airship)
[![macOS Build Status](https://img.shields.io/travis/nodes-vapor/push-urban-airship.svg?label=macOS)](https://travis-ci.org/nodes-vapor/push-urban-airship)
[![codebeat badge](https://codebeat.co/badges/52c2f960-625c-4a63-ae63-52a24d747da1)](https://codebeat.co/projects/github-com-nodes-vapor-push-urban-airship)
[![codecov](https://codecov.io/gh/nodes-vapor/push-urban-airship/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/push-urban-airship)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/nodes-vapor/push-urban-airship)](http://clayallsopp.github.io/readme-score?url=https://github.com/nodes-vapor/push-urban-airship)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/push-urban-airship/master/LICENSE)

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

### Simple example
```swift
let body = try JSON(node: [
    "audience": "all",
    "device_types": [
        "ios"
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
    // let response = uaResponse.response[0]
}
```

The above example will send a text push notification with the message `hello world` to all users on the `ios` platforms

### Chain your payload
This package offers a way to easily customize they different segments of the final payload sent to Urban Airship, using the UABuilder class.

```swift
...
let builder = UABuilder()

_ = try builder
    .audience(tag: "tagged_targets")
    .deviceTypes(compound: [.ios, .android])
    .notification(alert: "Some informative push message text")

let request: UARequest = UARequest(body: try builder.makeBody())
...
```

The above example will send a text push notification with the message `Some informative push message text` to all users subscribing to tag `tagged_targets` on the `ios` and `android` platforms

UABuilder currently lets you set `audience`, `device_type` and `notification`. Method overloads allow you to set the payload segments directly using custom JSON or using a preset value. For more information see the [Urban Airship documentation](https://docs.urbanairship.com/api/ua/#push-object) about the push object or check out the [full api documentation](http://docs.urbanairship.com/api/ua/)

## 🏆 Credits
This package is developed and maintained by the Vapor team at [Nodes](https://www.nodesagency.com).
The package owner for this project is [Rasmus](https://github.com/rasmusebbesen).

## 📄 License
This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)