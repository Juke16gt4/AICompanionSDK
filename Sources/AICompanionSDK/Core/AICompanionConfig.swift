//
//  AICompanionConfig.swift
//  AICompanionSDK
//
//  📂 格納場所:
//      AICompanionSDK/Core/AICompanionConfig.swift
//
//  🎯 ファイルの目的:
//      AICompanion の設定管理。
//      - デフォルト言語・VoiceProfile・Emotionログ保存ポリシーなどを保持
//
//  🔗 依存:
//      - CompanionVoiceSDK
//
//  🔗 関連/連動ファイル:
//      - AICompanion.swift
//      - AICompanionManager.swift
//
//  👤 作成者: 津村 淳一
//  📅 作成日: 2025年11月30日
//

import Foundation
import CompanionVoiceSDK

public struct AICompanionConfig {
    public var defaultLocale: String
    public var defaultVoiceProfile: VoiceProfile?

    public init(defaultLocale: String = "ja-JP", defaultVoiceProfile: VoiceProfile? = nil) {
        self.defaultLocale = defaultLocale
        self.defaultVoiceProfile = defaultVoiceProfile
    }
}
