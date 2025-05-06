# Basic Foundation Patterns

**Overview**
Basic Foundation Patterns are a set of common foundational practices that serve as the "foundation" for safely and reliably integrating LLM APIs into applications.
By adopting these practices, you can build subsequent advanced features and operational practices without risk.

- **Stability**: Design resilient to external API latency and failures
- **Scalability**: Preparation for provider changes and new feature additions
- **Observability**: Ability to monitor quality, cost, and security
- **Testability**: Building automated quality gates

---

## List of Included Practices

1. **Structured Output**
   Design that receives LLM output according to schemas like Pydantic/Protobuf using function-calling or JSON mode.
2. **Structured Logging for LLM Ops**
   Logging infrastructure that outputs all calls and responses in JSON format for easy search and visualization.
3. **Structured Prompt Template**
   Template that defines prompt structures based on YAML/JSON for type-safe and reusable management.
4. **Timeout & Fallback**
   Mechanism to set timeouts for inference calls and fall back to alternative responses or cached responses.
5. **Retry with Adaptive Back-off**
   Resilience practice that performs retries with exponential waiting for temporary failures (network issues or API rate limits).
6. **Streaming Output**
   UX enhancement practice that immediately pushes generated tokens to the UI using streaming APIs to improve responsiveness.
7. **Role-Based Prompt Control**
   RBAC design that restricts system instructions and output ranges based on user and system permissions.
8. **Prompt Unit Testing**
   Unit testing practice that converts expected input⇔output into test cases and runs automated regression tests in CI.
9. **Dependency Injection for LLM Pipelines**
   DI configuration that loosely couples each step (prompt assembly → inference → post-processing) for easier mocking and testing.
10. **Adapter for Unified API Interface**
   Adapter practice that absorbs different vendor API specifications and unifies calls from business logic.
11. **Abstract Factory for Model Clients**
   Factory practice that handles multiple LLM providers (OpenAI, Anthropic, OSS models, etc.) through a common interface.
12. **Inverted Structured Output**
   Practice that dynamically generates output schemas through metaprogramming and makes the LLM itself return Pydantic model definitions.  
