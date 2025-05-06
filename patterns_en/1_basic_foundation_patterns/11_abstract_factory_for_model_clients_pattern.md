# Abstract Factory for Model Clients

## Overview

The Abstract Factory for Model Clients pattern is a design approach that provides a common interface for multiple LLM providers (such as OpenAI, Anthropic, Google Gemini, or on-premises open-source models like DeepSeek). This pattern allows the business logic layer to utilize LLM capabilities in a unified manner without being aware of the specific implementation details of each provider.

## Problem to Solve

In many cases, when developing systems that utilize LLMs, projects initially proceed using a single LLM provider (e.g., OpenAI API). The program may only prepare a client to call the OpenAI API and use it throughout. However, since LLMs are not perfect, situations may arise where the initially used LLM becomes problematic, requiring the use of other LLMs to overcome these issues.

Alternatively, when new LLM models are released, it becomes necessary to modify clients to support these models.

While it's possible to create other LLM clients (e.g., Anthropic API client) or new model clients in parallel with the initial LLM client (e.g., OpenAI API client), this approach presents several challenges:

- **Vendor Lock-in Issues**
   - If the implementation directly calls OpenAI's API, switching to Anthropic for cost reduction would require modifying the entire codebase.

- **Code Duplication**
   - Similar request assembly and error handling code is duplicated for each provider, reducing maintainability.

- **Testing Difficulties**
   - Each provider's API needs to be mocked individually, complicating test code.

## Solution

Apply the Abstract Factory for Model Clients pattern by preparing a common interface and Factory class for each LLM provider. LLM clients are generated from a common LLM model client factory and can be used through a common interface. The business logic layer that uses LLMs can use them in the same way without being aware of the differences in LLM interfaces.

- **Define Common Interface**
   - Define a common interface (such as `generate`, `embed`, etc.) that all LLM clients must implement.

- **Implement Factory Class**
   - Create Factory classes for each provider to generate clients with appropriate configurations.

- **Centralize Configuration**
   - Manage settings such as API keys and endpoints in one place, making it possible to switch dynamically at runtime.

![img](./uml/images/abstract_factory_for_model_clients_pattern.png)

## Applicable Scenarios

This pattern is particularly effective in the following situations:

- Systems that use multiple LLM providers
- When you want to dynamically switch providers based on cost or performance
- When failover or backup mechanisms are needed
- When conducting A/B testing between different models

## Benefits

Adopting this pattern provides the following benefits:

- Decouples business logic from provider implementation
- Makes it easy to add new providers
- Facilitates testing by creating mock LLM clients from the interface
- Improves operational efficiency through centralized configuration management

## Considerations and Trade-offs

When adopting this pattern, the following points should be considered:

- In small-scale systems, the overhead from abstraction may become significant
- Attempting to include all provider-specific features in the common interface can lead to interface bloat
- Maintenance costs arise from provider SDK version updates

## Implementation Tips

Key points for effectively implementing this pattern are as follows:

1. Start with minimal common methods and expand as needed
2. Combine with a DI container to make the provider configurable at startup
3. Manage model types and API keys in configuration files (YAML/JSON/Env)

## Summary

The Abstract Factory for Model Clients pattern is a powerful design approach for handling multiple LLM providers uniformly. When implemented appropriately, it can significantly improve system flexibility and maintainability. However, it's important to adjust the level of abstraction appropriately based on the system's scale and requirements.
