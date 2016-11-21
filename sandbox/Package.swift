import PackageDescription

let package = Package(
    name: "sandbox",
    targets: [
        Target(name: "UAPusher"),
        Target(name: "App", dependencies: [
            .Target(name: "UAPusher")
            ])
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 1)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
        "Tests",
    ]
)

