import PackageDescription

let package = Package(
    name: "UAPusher",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
    ]
)
