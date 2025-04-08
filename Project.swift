import ProjectDescription

let project = Project(
    name: "YettelTestApp-iOS",
    packages: [
        .remote(url: "https://github.com/apple/swift-openapi-generator", requirement: .upToNextMajor(from: "1.3.0")),
        .remote(url: "https://github.com/apple/swift-openapi-runtime", requirement: .exact("1.5.0")),
        .remote(url: "https://github.com/apple/swift-openapi-urlsession", requirement: .exact("1.0.2")),
        .remote(url: "https://github.com/hmlongco/Factory", requirement: .upToNextMajor(from: "2.4.5"))
    ],
    targets: [
        .target(
            name: "YettelTestApp-iOS",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.YettelTestApp-iOS",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "NSAppTransportSecurity": [
                        "NSAllowsArbitraryLoads": true
                    ]
                ]
            ),
            sources: ["YettelTestApp-iOS/Sources/**"],
            resources: ["YettelTestApp-iOS/Resources/**"],
            dependencies: [
                .package(product: "Factory"),
                .package(product: "HTTPTypes"),
                .package(product: "OpenAPIRuntime"),
                .package(product: "OpenAPIURLSession"),
                .package(product: "OpenAPIGenerator", type: .plugin)
            ]
        ),
        .target(
            name: "YettelTestApp-iOSTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.YettelTestApp-iOSTests",
            infoPlist: .default,
            sources: ["YettelTestApp-iOS/Tests/**"],
            resources: [],
            dependencies: [.target(name: "YettelTestApp-iOS")]
        ),
    ]
)
