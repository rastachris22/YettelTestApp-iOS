import ProjectDescription

let project = Project(
    name: "YettelTestApp-iOS",
    packages: [
        .remote(url: "https://github.com/apple/swift-openapi-generator", requirement: .upToNextMajor(from: "1.3.0")),
        .remote(url: "https://github.com/apple/swift-openapi-runtime", requirement: .exact("1.5.0")),
        .remote(url: "https://github.com/apple/swift-openapi-urlsession", requirement: .exact("1.0.2")),
        .remote(url: "https://github.com/hmlongco/Factory", requirement: .upToNextMajor(from: "2.4.5")),
        .remote(url: "https://github.com/Kolos65/Mockable", requirement: .upToNextMajor(from: "0.0.1"))
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
                .package(product: "OpenAPIGenerator", type: .plugin),
                .package(product: "Mockable")
            ],
            settings: .settings(
                configurations: [
                    .debug(
                        name: .debug,
                        settings: [
                            "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "$(inherited) MOCKING"
                        ]
                    )
                ]
            )
        ),
        .target(
            name: "YettelTestApp-iOSTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.YettelTestApp-iOSTests",
            infoPlist: .default,
            sources: ["YettelTestApp-iOS/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "YettelTestApp-iOS"),
                .package(product: "Factory"),
                .package(product: "Mockable")
            ]
        ),
    ], schemes: [
        .scheme(
            name: "YettelTestApp-iOS",
            shared: true,
            buildAction: .buildAction(targets: ["YettelTestApp-iOS"]),
            testAction: .testPlans(["YettelTestApp-iOS/Resources/YettelTestApp-IOS.xctestplan"]),
            runAction: .runAction(configuration: .debug),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .release),
            analyzeAction: .analyzeAction(configuration: .debug)
        )
    ]
)
