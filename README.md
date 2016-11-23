# UAPusher

In `main.swift` import the UAPusher framework and just instantiate on the droplet.

###Setup

```swift
import UAPusher

drop.uapusher = try UAPusher(drop: drop)
```

Please add a config file `uapusher.json`

```bash
{
    "master_secret": "xxxx",
    "app_key": "xxxx"
}
```

###Test

To test your UA setup is correctly implemented before sending push just call: `let response = try drop.uapusher?.validateUASetup()` any place after you have instantiated UAPusher in `main.swift`

###Sending pushes

Use the following code in your project to send a push (will be updated very soon to have it's own builder and validator)

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

The send can also take a JSON object. We would recommend to use the `UARequest` object instead of this method below. 

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
        
let response = try drop.uapusher?.send(request: body)
	if response == .accepted {
		print("Push send..")
}
```