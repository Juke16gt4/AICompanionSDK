//
//  AICompanionEvent.swift
//  AICompanionSDK
//
//  📂 格納場所:
//      AICompanionSDK/Models/AICompanionEvent.swift
//
//  🎯 ファイルの目的:
//      共通イベントモデル。
//      - SpeechEvent や EmotionLog を統合
//      - アプリ側に通知するためのデータ構造
//
//  🔗 依存:
//      - Foundation
//
//  🔗 関連/連動ファイル:
//      - AICompanion.swift
//      - AICompanionManager.swift
//
//  👤 作成者: 津村 淳一
//  📅 作成日: 2025年11月30日
//

import Foundation

public enum AICompanionEvent {
    case userSpoke(text: String)
    case companionResponded(text: String)
    case emotionLogged(text: String, topic: String)
}
