# Structured Prompt Template

## Overview

Structured Prompt Template is a design approach that defines and manages prompts for LLMs as structured templates. By explicitly separating the format and components of prompts into templates, it improves reusability, maintainability, and readability. This practice makes prompt management and operation more efficient and facilitates prompt improvement across the entire team.

## Problems to Solve

Prompts are crucial elements in applications utilizing LLMs. Most prompts are composed of natural language and can sometimes become complex, lengthy texts. Additionally, since the same prompts (or prompts with slightly modified parameters) are often reused in various places, prompts need to be easily editable and reusable.

Keeping prompts as a single large hardcoded string hinders changeability and makes management difficult. Specifically, the following issues arise:

1. **Low Prompt Reusability**
   - The same prompt structure is written slightly differently in multiple places, making it impossible to make consistent modifications or adjustments.

2. **Poor Maintainability**
   - As prompt composition becomes more complex, it becomes unclear which elements produce which effects, making debugging and improvement difficult.

3. **Difficulty in Experimentation and A/B Testing**
   - Switching templates or making partial modifications requires direct code editing, increasing operational risks.

## Solution

Define prompts in structured formats such as YAML, JSON, or Jinja2 templates and manage them as external files. The system injects dynamic variables into these templates and assembles the final prompt string to pass to the LLM.

1. **Template Structuring**
   - Define templates with sections for different roles such as system, user, and assistant using YAML, JSON, etc.

2. **Dynamic Variable Injection**
   - Use placeholders like `{{ user_input }}` or `{{ document_summary }}` for variable parts, injecting values dynamically from business logic.

3. **External File Management**
   - Separate templates as files to make them editable by non-engineers.

![img](./uml/images/structured_prompt_template_pattern.png)

## Applicable Scenarios

This practice is particularly effective in the following situations:

- When switching between multiple prompt practices in conversation systems or chatbots
- When consistent prompt structure is needed for tasks like document summarization or extraction
- When comparing multiple templates for A/B testing or evaluation experiments
- When the operations team wants to freely update and improve prompts

## Benefits

Adopting this practice provides the following benefits:

- Prompt structure becomes explicit, improving readability and maintainability
- Template reuse improves development speed and quality
- Non-engineers can adjust templates, increasing operational flexibility
- Template switching and version control become easier

## Considerations and Trade-offs

When adopting this practice, attention should be paid to the following points:

- Excessive template splitting increases complexity, so balance in granularity is necessary
- Mismatches in variable mapping between templates and logic can risk prompt generation failure
- Template engine introduction may complicate system configuration

## Implementation Tips

Key points for effectively implementing this practice are as follows:

1. Start with a single template and extract common parts for templating
2. Introduce template validation checks to detect invalid structures
3. Manage templates in a separate directory from code and track them in version control
4. Choose formats that are easy for non-engineers to handle (YAML, Markdown with placeholders, etc.)

## Summary

Structured Prompt Template is a powerful design approach that improves quality, maintainability, and flexibility by managing LLM prompts as structured templates. It is strongly recommended for production-quality LLM applications as a foundation supporting team-based prompt design and improvement.
