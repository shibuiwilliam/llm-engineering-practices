# LLM Service Interface Segregation

## Overview

LLM Service Interface Segregation is a practice that involves designing service layer interfaces for LLM-related functionality by separating them according to their features. Based on the Interface Segregation Principle (ISP), it defines fine-grained interfaces that allow users to depend only on the minimum set of methods they need. This enables minimization of dependencies, simplification of testing, and flexibility in permission management.

## Problems to Solve

LLMs provide diverse natural language processing capabilities. Even just for text generation, they can perform chat, text classification, tagging, program generation, and more. Additionally, they enable similar search using text vectors and external service calls through MCP (Model Context Protocol).

While LLMs provide these various different functionalities, adopting a single large service interface for LLMs can lead to the following challenges:

- **Interface Bloat**
  - Packing all LLM functionalities like text generation, embeddings, chat, tool calling, etc., into a single interface forces dependencies on unused features, complicating class design.

- **Testing Complexity**
  - Using a single mock across all unit tests requires implementing and managing unnecessary methods.

- **Widespread Impact of Changes**
  - Adding or modifying new LLM features affects the existing interface, leading to impacts on a wide range of builds and tests.

- **Lack of Flexibility in Permission Management and Rate Limiting**
  - Controlling fine-grained authorization and rate limiting per API becomes difficult with a single interface.

## Solution

Based on the Interface Segregation Principle (ISP), we define independent interfaces for each functionality and structure services according to their responsibilities. For example, the following separation is effective:

- **Text Generation Interface**
  - `ITextGenerationService.generate(prompt, options)`
  - An interface specialized for text generation based on prompts.

- **Embedding Interface**
  - `IEmbeddingService.embed(text)`
  - An interface specialized for text vectorization.

- **Chat Interface**
  - `IChatConversationService.sendMessage(sessionId, message)`
  - An interface specialized for chat functionality that maintains conversation context.

- **Function Calling Interface**
  - Function calling / tool calling, or relying on MCP client and MCP server.
  - An interface specialized for calling tools and functions.
  - See **External Service** reference.

![img](uml/images/llm_service_interface_segregation_pattern.png)

## Applicable Scenarios

This practice is effective in the following situations:

- Multi-functional enterprise chat systems (generation, summarization, RAG, tool calling, etc.)
- AI platforms or microservice architectures with modular separation
- Multi-tenant SaaS that provides different LLM feature sets per tenant
- Large-scale development projects with established test automation and CI/CD

## Benefits

Adopting this practice provides the following benefits:

- Enables clear separation of responsibilities and loosely coupled design, improving reusability and maintainability.
- Makes unit testing and mocking easier, enhancing development productivity.
- Allows fine-grained authorization and rate control, making security policy implementation easier.
- Enables highly extensible configurations and safe addition of new features.

## Considerations and Trade-offs

When adopting this practice, attention should be paid to the following points:

- The increase in interfaces raises design and management costs.
- Dependency injection (DI) configuration becomes more complex, potentially requiring more setup time depending on project scale.
- Poor granularity design of features may require later integration or re-separation.
- Documentation maintenance burden increases, potentially raising learning costs for developers.

## Implementation Tips

Key points for effectively implementing this practice are as follows:

1. Start with identifying functional classifications, categorize LLM features by use case, and design by separating into interface units.
2. Gradually split existing monolithic interfaces, proceeding with migration while ensuring tests don't break.
3. Use DI mechanisms like Spring, Guice, or NestJS to set up dependency injection per interface.
4. Design common middleware to consistently apply authorization and rate limiting to each functional interface.
5. Document and share usage examples for each interface to help new developers understand the system.

## Summary

LLM Service Interface Segregation is an effective approach for implementing LLM services in a scalable and maintainable structure. By separating interfaces by functionality, it improves the efficiency of testing, extension, and permission control. While careful consideration of granularity is needed in initial design, proper implementation can yield significant benefits in large-scale systems.
