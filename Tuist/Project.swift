import ProjectDescription

let project = Project(
    name: "Template",
    targets: [
        .target(
            name: "Template",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Template",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["Template/Sources/**"],
            resources: ["Template/Resources/**"],
            dependencies: [
                .external(name: "iOS", condition: .when([.ios]))
            ]
        ),
    ]
)
