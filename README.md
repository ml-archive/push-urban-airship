# UAPusher
[![Language](https://img.shields.io/badge/Swift-3-brightgreen.svg)](http://swift.org)
[![Build Status](https://travis-ci.org/nodes-vapor/push-urban-airship.svg?branch=master)](https://travis-ci.org/nodes-vapor/push-urban-airship)
[![codecov](https://codecov.io/gh/nodes-vapor/push-urban-airship/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/push-urban-airship)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/push-urban-airship/master/LICENSE)

# Send push notifications with Urban Airship for Vapor

# Installation
Update your `Package.swift` file.
```swift
.Package(url: "https://github.com/nodes-vapor/push-urban-airship.git", majorVersion: 0, minor: 2)
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

### main.swift 
Init the UAPusher to drop

```swift
import UAPusher

try drop.addProvider(UAPusher.Provider.self)
```

# Example

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
let response = try drop.uapusher?.send(request: request)
if response.status == .accepted {
	print("Push send..")
}
```
Check out the api documentation (http://docs.urbanairship.com/api/ua/)

# Todo
 - Make a builder like (https://github.com/nodes-php/push)