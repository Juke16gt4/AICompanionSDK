//
//  AICompanion.swift
//  AICompanionSDK
//
//  📂 格納場所:
//      AICompanionSDK/Core/AICompanion.swift
//
//  🎯 ファイルの目的:
//      SDK全体のファサード（入り口）。
//      - EmotionSDK / CompanionVoiceSDK / CompanionSpeechSDK を統合
//      - アプリ側からはこのクラスを呼ぶだけで利用可能
//
//  🔗 依存:
//      - EmotionSDK
//      - CompanionVoiceSDK
//      - CompanionSpeechSDK
//
//  🔗 関連/連動ファイル:
//      - AICompanionManager.swift（統合制御）
//      - AICompanionConfig.swift（設定）
//      - AICompanionProfile.swift（プロフィール）
//      - AICompanionEvent.swift（イベント）
//
//  👤 作成者: 津村 淳一
//  📅 作成日: 2025年11月30日
//

import Foundation
import EmotionSDK
import CompanionVoiceSDK
import CompanionSpeechSDK

public final class AICompanion {
    public static let shared = AICompanion()
    private init() {}

    public func speak(_ text: String, profile: VoiceProfile? = nil) {
        if let profile {
            SpeechManager.shared.speak(text,
                                       languageCode: profile.languageCode,
                                       rate: profile.rate,
                                       pitch: profile.pitch,
                                       volume: profile.volume)
        } else {
            SpeechManager.shared.speak(text)
        }
    }

    public func listen(locale: String = "ja-JP", completion: @escaping (String) -> Void) {
        SpeechManager.shared.startListening(locale: locale,
            onPartial: { _ in },
            onFinal: { result in completion(result) }
        )
    }

    public func logEmotion(from text: String, locale: String = "ja-JP") {
        let topic = SpeechTopicInferencer().inferTopic(from: text, language: locale)
        let entry = ConversationEntry(
            speaker: "user",
            text: text,
            emotion: "neutral",
            topic: ConversationSubject(label: topic),
            isCommand: false,
            language: locale
        )
        CalendarSyncService().save(entry: entry)
    }
}
