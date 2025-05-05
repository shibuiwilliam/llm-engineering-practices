# Basic Foundation Patterns

**概要**  
Basic Foundation Patterns は、LLM（大規模言語モデル）API を安全かつ確実にアプリケーションに組み込むための“土台”となる共通基盤パターン群です。  
これらのパターンを採用することで、後続の高度な機能や運用パターンをリスクなく積み上げることができます。

- **安定性**：外部 API の遅延・障害に強い設計  
- **拡張性**：プロバイダ変更や新機能追加への備え  
- **可観測性**：品質・コスト・セキュリティをモニタ可能  
- **テスト容易性**：自動化された品質ゲートを構築  

---

## 含まれるパターン一覧

1. **Abstract Factory for Model Clients**  
   複数の LLM プロバイダ（OpenAI, Anthropic, OSS モデルなど）を共通インターフェースで扱うファクトリパターン。  
2. **Adapter for Unified API Interface**  
   異なるベンダー API 仕様を吸収し、業務ロジックからの呼び出しを統一するアダプタパターン。  
3. **Dependency Injection for LLM Pipelines**  
   各ステップ（プロンプト組立→推論→後処理）を疎結合にし、モック／テストしやすくする DI 構成。  
4. **Structured Prompt Template**  
   YAML／JSON ベースでプロンプト構造を定義し、型安全かつ再利用可能に管理するテンプレート。  
5. **Structured Output**  
   Function-calling や JSON モードを使って、LLM の出力を Pydantic／Protobuf などのスキーマに沿って受け取る設計。  
6. **Inverted Structured Output**  
   メタプログラミングで動的に出力スキーマを生成し、LLM 自身に Pydantic モデル定義などを返させるパターン。  
7. **Timeout & Fallback**  
   推論呼び出しにタイムアウトを設定し、代替レスポンスやキャッシュからの応答にフォールバックする仕組み。  
8. **Retry with Adaptive Back-off**  
   一時的な失敗（ネットワーク障害や API レート超過）に対し、指数関数的待機を伴う再試行を行うレジリエンスパターン。  
9. **Structured Logging for LLM Ops**  
   すべての呼び出し・レスポンスを JSON 形式でログ出力し、検索・可視化しやすくするロギング基盤。  
10. **Role-Based Prompt Control**  
    ユーザやシステム権限に応じて、プロンプトのシステム指示文や出力範囲を制限する RBAC 設計。  
11. **Prompt Unit Testing**  
    期待する入力⇔出力をテストケース化し、CI 上で自動回帰テストを回すユニットテストパターン。  
12. **Streaming Output**  
    ストリーミング API を活用し、生成中のトークンを即座に UI にプッシュして応答性を高める UX 強化パターン。

---

## ユースケース例

### 1. カスタマーサポートチャットボット  

- **Dependency Injection** でテストダブルを挿し替え  
- **Timeout & Fallback** で応答遅延時も定型文を返却  
- **Structured Logging** で問い合わせ履歴を可視化  

### 2. パーソナライズドニュース配信  

- **Abstract Factory** で複数モデル（要約／推薦）を統一呼び出し  
- **Role-Based Prompt Control** で購読プラン別に制限  
- **Structured Output** で記事メタデータを安全に解析  

### 3. ドキュメント要約バッチ処理  

- **Retry with Adaptive Back-off** で一時的 API エラーを吸収  
- **Prompt Unit Testing** で要約品質を CI でガード  
- **Inverted Structured Output** で動的スキーマ生成  

### 4. リアルタイム対話型アプリ  

- **Streaming Output** で文字起こしや翻訳を高速表示  
- **Structured Prompt Template** でマルチモーダル入力を整理  
- **Timeout & Fallback** で途中切断時の再接続に対応  
