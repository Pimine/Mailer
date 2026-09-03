// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Mailer",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Mailer", targets: ["Mailer"])
    ],
    targets: [
        .target(
            name: "Mailer",
            path: "Sources",
            exclude: ["Support files"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
