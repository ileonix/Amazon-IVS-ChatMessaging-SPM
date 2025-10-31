// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AmazonIVSChatMessaging",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AmazonIVSChatMessaging",
            targets: ["AmazonIVSChatMessaging"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "AmazonIVSChatMessaging",
            path: "Frameworks/AmazonIVSChatMessaging.xcframework"
        )
    ]
)

