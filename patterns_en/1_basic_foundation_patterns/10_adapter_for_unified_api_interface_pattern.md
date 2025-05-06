# Adapter for Unified API Interface Pattern

## Overview

The Adapter for Unified API Interface pattern is a design approach that abstracts diverse API specifications provided by different LLM providers and vendors (such as OpenAI, Anthropic, Google Gemini, or on-premises open-source models like DeepSeek) through a common interface. By applying this pattern, applications can utilize LLMs in a unified manner without being aware of vendor-specific implementations in their business logic.

## Problems to Solve

Each LLM provider has its own strengths and weaknesses, and systems utilizing LLMs often need to combine them to complement each other. In such cases, the challenge is that LLM providers adopt different API specifications, request formats, and error handling designs, requiring the system to absorb these differences. Specifically, the following issues arise:

1. **Implementation becomes vendor-dependent**
   - The structure differs significantly between OpenAI's `chat/completions` endpoint and Anthropic's `messages` endpoint, making direct implementation difficult to switch between.

2. **Logic duplication increases**
   - Example: Code for prompt construction and response formatting for each API becomes scattered, significantly reducing maintainability.

3. **Testing and debugging become complex**
   - The existence of multiple API clients requires testing and mocking for each pattern, increasing testing overhead.

## Solution

To address these challenges, we define a common API interface and implement vendor-specific API implementations as adapters. The adapter implements the common interface and internally converts and calls the vendor-specific specifications. This allows the application to deal with only a single interface.

1. Prepare specific adapters such as OpenAIAdapter, AnthropicAdapter, and OSSAdapter.
2. Define common methods like `generate(prompt)`, `embed(texts)`, `chat(messages)` in the Adapter.
3. The logic side can transparently switch vendors by depending on the Adapter.

![img](./uml/images/adapter_for_unified_api_interface_pattern.png)

## Applicable Scenarios

This pattern is particularly effective in the following situations:

- Products that need to utilize different LLM vendors across the board
- Cases where you want to try multiple providers for failover or performance comparison
- When design is required to break free from vendor dependency and consider future migration or integration
- Environments where multiple models need to be used differently, such as in RAG or multi-agent architectures

## Benefits

Adopting this pattern provides the following benefits:

- Can hide the specification differences of each LLM vendor from the application
- Can easily switch LLM vendors without changing business logic
- Makes unit testing and performance verification using mocks easier
- Makes it easier to maintain common specifications between frontend and backend

## Considerations and Trade-offs

When adopting this pattern, the following points need attention:

- Adapter implementation may become complex. Particularly when abstracting vendor-specific advanced features (tool calls, file operations, etc.), interface design requires careful consideration
- Features that cannot be expressed in a single common interface require design using options or polymorphism to maintain extensibility
- The addition of the Adapter layer may deepen the processing flow, making debugging more difficult

## Implementation Tips

Key points for effectively implementing this pattern are as follows:

- It's good to define minimal core interfaces (`generate`, `embed`, `chat`) and expand functionality gradually
- It's even more effective to combine with mechanisms that abstract different prompt structures for each LLM (such as prompt template managers)
- Preparing unit tests for major vendors like OpenAI, Claude, and Gemini in advance can ensure consistency in Adapter implementation

## Summary

The Adapter for Unified API Interface pattern is a design approach that realizes development efficiency and operational flexibility by handling diverse LLM APIs uniformly. It's recommended to implement from the initial stages to eliminate vendor dependency and increase freedom in future technology selection. However, it's desirable to take an approach of gradual expansion while being careful not to over-abstract.
