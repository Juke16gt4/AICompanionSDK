//
//  AICompanionManager.swift
//  AICompanionSDK
//
//  📂 格納場所:
//      AICompanionSDK/Core/AICompanionManager.swift
//
//  🎯 ファイルの目的:
//      AICompanion のライフサイクル管理。
//      - 会話開始・終了・振り返りなど高レベル操作を提供
//      - 内部で EmotionSDK / VoiceSDK / SpeechSDK を呼び出す
//
//  🔗 依存:
//      - AICompanion.swift
//      - EmotionSDK
//      - CompanionVoiceSDK
//      - CompanionSpeechSDK
//
//  🔗 関連/連動ファイル:
//      - AICompanionConfig.swift
//      - AICompanionProfile.swift
//      - AICompanionEvent.swift
//
//  👤 作成者: 津村 淳一
//  📅 作成日: 2025年11月30日
//

import Foundation

public final class AICompanionManager {
    public static let shared = AICompanionManager()
    private init() {}

    public func startConversation(locale: String = "ja-JP") {
        print("🗣️ 会話開始 (\(locale))")
    }

    public func endConversation() {
        print("🔚 会話終了")
    }

    public func reflectPastConversation() {
        print("📅 過去の会話を振り返ります")
    }
}
