PATTERN_DIR=patterns
BASE_FOUNDATION_PATTERN_DIR=patterns/1_basic_foundation_patterns_group
PLATFORM_INTEGRATION_AND_ABSTRACTION_PATTERN_DIR=patterns/2_platform_integration_and_abstraction_patterns_group
PROMPT_ENGINEERING_AND_CONTENT_ORCHESTRATION_PATTERN_DIR=patterns/3_prompt_engineering_and_content_orchestration_patterns_group
RELIABILITY_AND_OBSERVABILITY_PATTERN_DIR=patterns/4_reliability_and_observability_patterns_group
SECURITY_AND_GOVERNANCE_PATTERN_DIR=patterns/5_security_and_governance_patterns_group
COST_OPTIMIZATION_AND_SCALABILITY_PATTERN_DIR=patterns/6_cost_optimization_and_scalability_patterns_group
DATA_PERSISTENCE_AND_MEMORY_MANAGEMENT_PATTERN_DIR=patterns/7_data_persistence_and_memory_management_patterns_group
TESTING_AND_RELEASE_QUALITY_UX_PATTERN_DIR=patterns/8_testing_and_release_quality__ux_patterns_group

.PHONY: plantuml
plantuml:
	plantuml -o ./images/ -t png -overwrite $(BASE_FOUNDATION_PATTERN_DIR)/uml/*.puml

.PHONY: rm_ds_store
rm_ds_store:
	find . -name ".DS_Store" -delete

.PHONY: format_markdown
format_markdown:
	find $(PATTERN_DIR) -name "*.md" -exec markdownlint {} \;
	find $(PATTERN_DIR) -name "*.md" -exec markdownlint --fix {} \;
