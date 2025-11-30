// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AICompanionSDK",
    platforms: [
        .iOS(.v16), .macOS(.v14)
    ],
    products: [
        .library(
            name: "AICompanionSDK",
            targets: ["AICompanionSDK"]
        ),
    ],
    dependencies: [
        // 外部SDKをここに追加
        .package(url: "https://github.com/Juke16gt4/EmotionSDK.git", from: "1.0.0"),
        .package(url: "https://github.com/Juke16gt4/CompanionVoiceSDK.git", from: "1.0.0"),
        .package(url: "https://github.com/Juke16gt4/CompanionSpeechSDK.git", from: "1.0.0")
        .package(url: "https://github.com/Juke16gt4/CompanionsSDK.git", from: "1.0.0")
        .package(url: "https://github.com/Juke16gt4/LanguageSDKCore.git", from: "1.0.0")
        .package(url: "https://github.com/Juke16gt4/LanguageSDKExtras.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "AICompanionSDK",
            dependencies: [
                "EmotionSDK",
                "CompanionVoiceSDK",
                "CompanionSpeechSDK",
                "CompanionsSDK",
                "LanguageSDKCore",
                "LanguageSDKExtras"
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "AICompanionSDKTests",
            dependencies: ["AICompanionSDK"],
            path: "Tests"
        )
    ]
)
