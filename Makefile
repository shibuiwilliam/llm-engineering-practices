PATTERN_DIR=patterns_ja
BASE_FOUNDATION_PATTERN_DIR=$(PATTERN_DIR)/1_basic_foundation_patterns
PLATFORM_INTEGRATION_AND_ABSTRACTION_PATTERN_DIR=$(PATTERN_DIR)/2_platform_integration_and_abstraction_patterns
PROMPT_ENGINEERING_AND_CONTENT_ORCHESTRATION_PATTERN_DIR=$(PATTERN_DIR)/3_prompt_engineering_and_content_orchestration_patterns
RELIABILITY_AND_OBSERVABILITY_PATTERN_DIR=$(PATTERN_DIR)/4_reliability_and_observability_patterns
SECURITY_AND_GOVERNANCE_PATTERN_DIR=$(PATTERN_DIR)/5_security_and_governance_patterns
COST_OPTIMIZATION_AND_SCALABILITY_PATTERN_DIR=$(PATTERN_DIR)/6_cost_optimization_and_scalability_patterns
DATA_PERSISTENCE_AND_MEMORY_MANAGEMENT_PATTERN_DIR=$(PATTERN_DIR)/7_data_persistence_and_memory_management_patterns
TESTING_AND_RELEASE_QUALITY_UX_PATTERN_DIR=$(PATTERN_DIR)/8_testing_and_release_quality_ux_patterns

.PHONY: plantuml_base
plantuml_base:
	plantuml -o ./images/ -t png -overwrite $(BASE_FOUNDATION_PATTERN_DIR)/uml/*.puml

.PHONY: plantuml_platform
plantuml_platform:
	plantuml -o ./images/ -t png -overwrite $(PLATFORM_INTEGRATION_AND_ABSTRACTION_PATTERN_DIR)/uml/*.puml

.PHONY: plantuml_prompt
plantuml_prompt:
	plantuml -o ./images/ -t png -overwrite $(PROMPT_ENGINEERING_AND_CONTENT_ORCHESTRATION_PATTERN_DIR)/uml/*.puml

.PHONY: rm_ds_store
rm_ds_store:
	find . -name ".DS_Store" -delete

.PHONY: format_markdown
format_markdown:
	find $(PATTERN_DIR) -name "*.md" -exec markdownlint-cli2 {} \;
	find $(PATTERN_DIR) -name "*.md" -exec markdownlint-cli2 --fix {} \;
