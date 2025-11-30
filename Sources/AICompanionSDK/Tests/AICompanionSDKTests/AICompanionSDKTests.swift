//
//  AICompanionSDKTests.swift
//  AICompanionSDK
//
//  📂 格納場所:
//      AICompanionSDK/Tests/AICompanionSDKTests.swift
//
//  🎯 ファイルの目的:
//      AICompanionSDK の主要機能をユニットテストする。
//      - AICompanion の speak / listen / logEmotion の動作確認
//      - AICompanionConfig / AICompanionProfile の初期化確認
//      - AICompanionManager のライフサイクル操作確認
//
//  🔗 依存:
//      - XCTest
//      - AICompanionSDK
//
//  👤 作成者: 津村 淳一
//  📅 作成日: 2025年11月30日
//

import XCTest
@testable import AICompanionSDK

final class AICompanionSDKTests: XCTestCase {

    // MARK: - Config Tests
    func testConfigInitialization() {
        let config = AICompanionConfig(defaultLocale: "en-US")
        XCTAssertEqual(config.defaultLocale, "en-US")
        XCTAssertNil(config.defaultVoiceProfile)
    }

    // MARK: - Profile Tests
    func testProfileInitialization() {
        let profile = AICompanionProfile(name: "Junichi", locale: "ja-JP")
        XCTAssertEqual(profile.name, "Junichi")
        XCTAssertEqual(profile.locale, "ja-JP")
        XCTAssertNil(profile.voiceProfile)
    }

    // MARK: - Manager Tests
    func testConversationLifecycle() {
        let manager = AICompanionManager.shared
        manager.startConversation(locale: "ja-JP")
        manager.endConversation()
        manager.reflectPastConversation()
        // 実際の動作は print 出力だが、呼び出しがエラーなく通ることを確認
        XCTAssertTrue(true)
    }

    // MARK: - AICompanion Tests
    func testSpeakFunction() {
        // 実際の音声合成はモック化が必要だが、呼び出しが通ることを確認
        AICompanion.shared.speak("テスト発話")
        XCTAssertTrue(true)
    }

    func testListenFunction() {
        let expectation = self.expectation(description: "音声認識完了")
        AICompanion.shared.listen(locale: "ja-JP") { result in
            print("認識結果: \(result)")
            expectation.fulfill()
        }
        // 実際の認識は非同期処理だが、テストではタイムアウトを設定
        wait(for: [expectation], timeout: 1.0)
    }

    func testLogEmotionFunction() {
        // EmotionSDK の呼び出しが通ることを確認
        AICompanion.shared.logEmotion(from: "今日は試験がある", locale: "ja-JP")
        XCTAssertTrue(true)
    }

    // MARK: - Event Tests
    func testEventEnum() {
        let event1 = AICompanionEvent.userSpoke(text: "こんにちは")
        let event2 = AICompanionEvent.companionResponded(text: "やあ！")
        let event3 = AICompanionEvent.emotionLogged(text: "今日は試験がある", topic: "school")

        switch event1 {
        case .userSpoke(let text):
            XCTAssertEqual(text, "こんにちは")
        default:
            XCTFail("Event mismatch")
        }

        switch event2 {
        case .companionResponded(let text):
            XCTAssertEqual(text, "やあ！")
        default:
            XCTFail("Event mismatch")
        }

        switch event3 {
        case .emotionLogged(let text, let topic):
            XCTAssertEqual(text, "今日は試験がある")
            XCTAssertEqual(topic, "school")
        default:
            XCTFail("Event mismatch")
        }
    }
}
