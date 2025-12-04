# AICompanionSDK

AICompanionSDK は、EmotionSDK / CompanionVoiceSDK / CompanionSpeechSDK と連携し、  
感情認識・音声合成・音声再生を統合的に扱うための SDK です。  
コンパニオンアプリケーションに「感情に応じた応答」「音声での発話」「声の再生」を提供します。

---

## 📦 機能概要
- **感情応答**: EmotionSDK から渡された Emotion を解析し、応答メッセージを生成
- **音声合成**: CompanionSpeechSDK を利用してテキストを音声化
- **音声再生**: CompanionVoiceSDK を利用して音声を再生

---

## 🚀 インストール / セットアップ

### 1. ターゲット追加
Xcode プロジェクトに以下の Framework ターゲットを追加してください:
- EmotionSDK
- CompanionVoiceSDK
- CompanionSpeechSDK
- AICompanionSDK

### 2. 依存関係設定
- **CompanionSDK** → AICompanionSDK, EmotionSDK, CompanionVoiceSDK, CompanionSpeechSDK  
- **AICompanionSDK** → EmotionSDK, CompanionVoiceSDK, CompanionSpeechSDK  

### 3. Link Binary With Libraries
各ターゲットに対応する `.framework` を追加してください。

---

## 📝 使い方

### インポート
```swift
import AICompanionSDK
import EmotionSDK
