# Structured Prompt Template Pattern

## Overview

The Structured Prompt Template Pattern is a design approach for defining and managing prompts passed to LLMs as structured templates. By explicitly separating prompt formats and items in templates, it improves reusability, maintainability, and readability. This pattern enables efficient prompt management and operations, making prompt improvements easier across the entire team.

## Problems to Solve

Prompts are very important elements in applications utilizing LLMs. Most prompts are composed of natural language and can sometimes become complex long texts. Additionally, since the same prompt (or prompts with slightly different parameters) may be reused in various places, prompts need to be easily editable and reusable.

Keeping prompts as one huge hardcoded string hinders changeability and makes management difficult. Specifically, the following challenges arise:

1. **Low Prompt Reusability**
   - The same prompt structure is written slightly differently in multiple places, making it impossible to make consistent modifications or adjustments.

2. **Poor Maintainability**
   - As prompt composition becomes complex, it becomes unclear which elements produce which effects, making debugging and improvement difficult.

3. **Difficulty in Experimentation and AB Testing**
   - Switching templates or making partial modifications requires direct code editing, increasing operational risks.

## Solution

Define prompts in structured formats like YAML, JSON, or Jinja2 templates and manage them as external files. The system embeds dynamic variables into these templates and assembles the final prompt string to pass to the LLM.

1. **Template Structuring**
   - Define templates with sections for each role (system, user, assistant, etc.) in YAML or JSON.

2. **Dynamic Variable Injection**
   - Use placeholders like `{{ user_input }}` or `{{ document_summary }}` for variable parts, injecting values dynamically from business logic.

3. **External File Management**
   - Separate templates as files to make them editable by non-engineers.

![img](./uml/images/structured_prompt_template_pattern.png)

## Applicable Scenarios

This pattern is particularly effective in the following situations:

- When switching between multiple prompt patterns in conversation systems or chatbots
- When consistent prompt structure is needed for tasks like document summarization or extraction
- When comparing multiple templates for AB testing or evaluation experiments
- When operations teams want to freely update and improve prompts

## Benefits

Adopting this pattern provides the following benefits:

- Prompt structure becomes explicit, improving readability and maintainability.
- Template reuse improves development speed and quality.
- Non-engineers can adjust templates, increasing operational flexibility.
- Template switching and version management become easier.

## Considerations and Trade-offs

When adopting this pattern, the following points require attention:

- Over-segmentation of templates may increase complexity, so attention to granularity balance is needed.
- If there are discrepancies in role determination or authorization logic, incorrect prompts may be used, leading to output errors or information leakage.
- When role definitions depend on external applications (e.g., IdP), attention is needed for synchronization mismatches.
- Excessive role branching may increase system complexity.

## Implementation Tips

Key points for effectively implementing this pattern are as follows:

1. Start with a single template and extract common parts for templating.
2. Introduce template validation checks to detect invalid structures.
3. Manage templates in a directory separate from code and track them in version control.
4. Choose formats that are easy for non-engineers to handle (YAML, Markdown with placeholders, etc.).

## Summary

The Structured Prompt Template Pattern is a powerful design approach for improving quality, maintainability, and flexibility by managing LLM prompts as structured templates. As a foundation supporting team-based prompt design and improvement, it is strongly recommended for production-quality LLM applications.
