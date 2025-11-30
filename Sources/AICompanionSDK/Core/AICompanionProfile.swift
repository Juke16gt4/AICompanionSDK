//
//  AICompanionProfile.swift
//  AICompanionSDK
//
//  📂 格納場所:
//      AICompanionSDK/Core/AICompanionProfile.swift
//
//  🎯 ファイルの目的:
//      ユーザーごとのプロフィールを保持。
//      - 名前・言語・声のスタイル・感情傾向など
//      - CompanionVoiceSDK の VoiceProfile と連動
//
//  🔗 依存:
//      - CompanionVoiceSDK
//
//  🔗 関連/連動ファイル:
//      - AICompanionConfig.swift
//      - AICompanion.swift
//
//  👤 作成者: 津村 淳一
//  📅 作成日: 2025年11月30日
//

import Foundation
import CompanionVoiceSDK

public struct AICompanionProfile: Codable {
    public var name: String
    public var locale: String
    public var voiceProfile: VoiceProfile?

    public init(name: String, locale: String = "ja-JP", voiceProfile: VoiceProfile? = nil) {
        self.name = name
        self.locale = locale
        self.voiceProfile = voiceProfile
    }
}
