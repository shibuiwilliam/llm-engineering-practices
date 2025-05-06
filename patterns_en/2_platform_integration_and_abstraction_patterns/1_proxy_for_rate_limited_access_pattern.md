# Proxy for Rate-Limited Access Pattern

## Overview

The Proxy for Rate-Limited Access pattern is a design approach to address rate limit constraints in LLM API usage. Instead of sending requests directly to the API, it routes them through a proxy server equipped with rate control, retry, and caching capabilities to ensure stable API usage and maximize throughput. This pattern allows applications to use LLM APIs stably without being concerned about rate limit details.

## Problems to Solve

Many LLM APIs (e.g., OpenAI API) have restrictions on requests per second (QPS) and token counts. When providing applications that incorporate LLM APIs, you will likely use a common LLM API contract for the application or project. The quotas (usage limits) set by LLM providers are often determined per contract. If a specific user of the application uses the service heavily and hits the quota, the LLM API becomes unavailable for all users, including others.

- **Error Occurrence During High-Frequency Access**
   - When multiple users access simultaneously, `429 Too Many Requests` is returned, causing processing to fail.

- **Batch Processing Interruption**
   - When attempting to process thousands of data items in a nightly batch, the process may be interrupted due to reaching the limit.

- **Implementation Duplication and Inconsistency**
   - Different retry logic and throttling implementations across services lead to reduced maintainability. As each team implements their own error handling, consistent behavior cannot be guaranteed.

## Solution

Implement a design where a proxy server is placed between the application and LLM API, routing all requests through it. This proxy handles the following functions:

- **Request Throttling Control**
   - Controls requests per second for each user or user group to ensure the overall contract doesn't exceed the LLM API quota.

- **Retry and Backoff Processing**
   - Retries according to policies like exponential backoff when temporary errors occur. When a 429 error occurs, retries with gradually increasing wait times of 2, 4, 8 seconds. If LLM API 429 errors persist, temporarily stops retrying and restricts application usage while waiting for recovery.

- **Cache Utilization**
   - Caches results for identical prompts for a short period to reduce API call frequency.

- **Load Balancing and Queue Management**
   - Uses queues to process requests sequentially even when many requests arrive simultaneously.

![img](uml/images/proxy_for_rate_limited_access_pattern_class_diagram.png)
![img](uml/images/proxy_for_rate_limited_access_pattern_sequence_diagram.png)

## Applicable Scenarios

This pattern is particularly effective in the following situations:

- Web services with many users and frequent simultaneous requests
- Backend processes that frequently call LLM APIs, such as batch processing or data pipelines
- Internal infrastructure where multiple services share LLM usage
- Mission-critical systems that need to avoid unstable behavior due to rate limit exceedance

## Benefits

Adopting this pattern provides the following benefits:

- Reduces the frequency of rate limit errors and achieves stable operation.
- Centralizes retry logic, preventing implementation duplication and consistency issues.
- Enables simultaneous implementation of caching strategies and log collection in the proxy, improving operational efficiency.
- Enables centralized visualization and analysis of usage patterns, aiding future scaling decisions.

## Considerations and Trade-offs

When adopting this pattern, the following points require attention:

- The proxy implementation itself becomes a new source of complexity and latency.
- Without proper retry control and queue design, risks of delay and request loss increase.
- Incorrect caching strategies can lead to loss of information freshness or incorrect responses.
- Proxy availability directly affects overall system reliability, making redundancy and monitoring essential.

## Implementation Tips

Key points for effectively implementing this pattern are as follows:

- Start with a lightweight proxy that only includes queue + throttling control, gradually expanding functionality.
- Utilizing open-source API Gateways or reverse proxies (like Envoy) makes construction easier.
- Record metadata for each request (user ID, prompt content, retry count, etc.) for future analysis.
- Design appropriate buffers and queues according to rate limit units (seconds, minutes, hours).

## Summary

The Proxy for Rate-Limited Access pattern is an important design approach to absorb instability associated with LLM API rate limits and achieve stable service provision. By centralizing responsibilities such as retry, caching, throttling, and log management, it enhances overall system reliability and maintainability. Early implementation is recommended for systems where high-load, high-frequency LLM usage is expected.
