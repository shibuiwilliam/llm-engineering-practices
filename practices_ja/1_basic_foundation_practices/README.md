# Basic Foundation Practices

**概要**
Basic Foundation Practices は、LLMのAPIを安全かつ確実にアプリケーションに組み込むための“土台”となる共通基盤プラクティス群です。
これらのプラクティスを採用することで、後続の高度な機能や運用プラクティスをリスクなく積み上げることができます。

- **安定性**：外部 API の遅延・障害に強い設計
- **拡張性**：プロバイダ変更や新機能追加への備え
- **可観測性**：品質・コスト・セキュリティをモニタ可能
- **テスト容易性**：自動化された品質ゲートを構築

---

## 含まれるプラクティス一覧

1. **Structured Output**
   Function-calling や JSON モードを使って、LLM の出力を Pydantic／Protobuf などのスキーマに沿って受け取る設計。
2. **Structured Logging for LLM Ops**
   すべての呼び出し・レスポンスを JSON 形式でログ出力し、検索・可視化しやすくするロギング基盤。
3. **Structured Prompt Template**
   YAML／JSON ベースでプロンプト構造を定義し、型安全かつ再利用可能に管理するテンプレート。
4. **Timeout & Fallback**
   推論呼び出しにタイムアウトを設定し、代替レスポンスやキャッシュからの応答にフォールバックする仕組み。
5. **Retry with Adaptive Back-off**
   一時的な失敗（ネットワーク障害や API レート超過）に対し、指数関数的待機を伴う再試行を行うレジリエンスプラクティス。
6. **Streaming Output**
    ストリーミング API を活用し、生成中のトークンを即座に UI にプッシュして応答性を高める UX 強化プラクティス。
7. **Role-Based Prompt Control**
    ユーザやシステム権限に応じて、プロンプトのシステム指示文や出力範囲を制限する RBAC 設計。
8. **Prompt Unit Testing**
    期待する入力⇔出力をテストケース化し、CI 上で自動回帰テストを回すユニットテストプラクティス。
9. **Dependency Injection for LLM Pipelines**
   各ステップ（プロンプト組立→推論→後処理）を疎結合にし、モック／テストしやすくする DI 構成。
10. **Adapter for Unified API Interface**
   異なるベンダー API 仕様を吸収し、業務ロジックからの呼び出しを統一するアダプタプラクティス。
11. **Abstract Factory for Model Clients**
   複数の LLM プロバイダ（OpenAI, Anthropic, OSS モデルなど）を共通インターフェースで扱うファクトリプラクティス。
12. **Inverted Structured Output**
   メタプログラミングで動的に出力スキーマを生成し、LLM 自身に Pydantic モデル定義などを返させるプラクティス。
13. **Inverted Flexibility**
   自由度の高いLLMをそのままユーザに使わせるのではなく、特定用途に特化したUIやAPIを通じてその力を引き出す設計手法。