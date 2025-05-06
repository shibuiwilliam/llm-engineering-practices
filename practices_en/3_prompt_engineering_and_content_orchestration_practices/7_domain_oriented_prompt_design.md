# Domain-Oriented Prompt Design

## Overview

Domain-Oriented Prompt Design is a design approach that explicitly incorporates domain-specific knowledge, terminology, and data structures (such as finance, healthcare, legal, manufacturing, etc.) into prompts. By utilizing schemas, glossaries, output examples, and constraint rules, it improves the accuracy and consistency of LLM responses. This practice enables the generation of high-quality outputs while meeting domain-specific requirements and regulations.

## Problems to Solve

LLMs are expected to be utilized for solving various domain challenges due to their broad general knowledge. Different domains require different approaches to using LLMs. While some may prepare domain-specific LLM models, a more accessible approach is to design domain-specific prompts using existing LLM APIs. Domain-specific prompt design is crucial for improving the accuracy and consistency of LLM outputs.

1. **Bias Towards General Context**
   - In the medical field, the term "BP" means "Blood Pressure," but general interpretations are prioritized over domain-specific meanings.

2. **Inconsistent Terminology and Format**
   - Terms like "rent" and "monthly fee" are mixed within the same contract document, compromising document consistency.

3. **Compliance Violation Risks**
   - Medical reports may miss legally required items, creating violation risks.

4. **Insufficient Reusability**
   - Embedding domain definitions in each prompt requires modifying everything when changes occur.

## Solution

The above challenges are addressed by incorporating domain-specific knowledge and structure into prompt design.

1. **Utilizing Domain Schemas**
   - Define data structures using JSON Schema or Pydantic to explicitly specify expected output formats.

2. **Introducing Terminology Lists**
   - Clearly define industry-specific abbreviations and terminology in system prompts to prevent misunderstandings.

3. **Providing Output Examples (few-shot)**
   - Guide style and structure by providing representative output examples as few-shot examples.

4. **Describing Constraint Rules**
   - Reduce violation risks by clearly stating output requirements based on regulations and business rules in checklist format.

![img](uml/images/domain_oriented_prompt_design_pattern.png)

## Applicable Scenarios

This practice is suitable for domain-specific systems such as:

- Report and dashboard generation in enterprise SaaS
- Clinical summaries and test report generation in healthcare
- Draft generation and review assistance for legal documents and contracts
- Automated creation of product specifications and manuals in manufacturing

## Benefits

Utilizing this practice provides the following advantages:

- Minimizes domain-specific misunderstandings for high-precision outputs
- Reduces post-processing and review effort by maintaining consistent output formats and writing styles
- Easier compliance with legal and operational requirements
- Improved maintainability by making schemas and glossaries reusable as shared assets

## Considerations and Trade-offs

The following points require attention when implementing:

- High initial design load and time required for preparing domain schemas and glossaries
- Increased token consumption and costs due to longer prompts
- Models must support schema compliance (JSON mode or function calling)
- Schema, terminology, and output examples need comprehensive review when domain requirements change

## Implementation Tips

Key points for effective implementation:

1. Start with major fields only and gradually expand to reduce implementation load
2. Manage specialized terms and abbreviations in a DB or CSV for dynamic reference during prompt generation
3. Design with a structure combining few-shot and templates, gradually improving accuracy
4. Incorporate schema validation and output example validation unit tests into CI/CD pipelines

## Summary

Domain-Oriented Prompt Design is a powerful approach that enables prompt design optimized for specific domain business needs. Structured domain knowledge and systematic incorporation into prompts are essential for improving the quality, reliability, and compliance of LLM outputs. Proper implementation enables high-quality business automation.
