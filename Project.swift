import ProjectDescription

let project = Project(
    name: "YettelTestApp-iOS",
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
                ]
            ),
            sources: ["YettelTestApp-iOS/Sources/**"],
            resources: ["YettelTestApp-iOS/Resources/**"],
            dependencies: []
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
