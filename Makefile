PRACTICE_DIR=practices_ja
BASE_FOUNDATION_PRACTICE_DIR=$(PRACTICE_DIR)/1_basic_foundation_practices
PLATFORM_INTEGRATION_AND_ABSTRACTION_PRACTICE_DIR=$(PRACTICE_DIR)/2_platform_integration_and_abstraction_practices
PROMPT_ENGINEERING_AND_CONTENT_ORCHESTRATION_PRACTICE_DIR=$(PRACTICE_DIR)/3_prompt_engineering_and_content_orchestration_practices
RELIABILITY_AND_OBSERVABILITY_PRACTICE_DIR=$(PRACTICE_DIR)/4_reliability_and_observability_practices
SECURITY_AND_GOVERNANCE_PRACTICE_DIR=$(PRACTICE_DIR)/5_security_and_governance_practices
COST_OPTIMIZATION_AND_SCALABILITY_PRACTICE_DIR=$(PRACTICE_DIR)/6_cost_optimization_and_scalability_practices
DATA_PERSISTENCE_AND_MEMORY_MANAGEMENT_PRACTICE_DIR=$(PRACTICE_DIR)/7_data_persistence_and_memory_management_practices
TESTING_AND_RELEASE_QUALITY_UX_PRACTICE_DIR=$(PRACTICE_DIR)/8_testing_and_release_quality_ux_practices

.PHONY: plantuml_base
plantuml_base:
	plantuml -o ./images/ -t png -overwrite $(BASE_FOUNDATION_PRACTICE_DIR)/uml/*.puml

.PHONY: plantuml_platform
plantuml_platform:
	plantuml -o ./images/ -t png -overwrite $(PLATFORM_INTEGRATION_AND_ABSTRACTION_PRACTICE_DIR)/uml/*.puml

.PHONY: plantuml_prompt
plantuml_prompt:
	plantuml -o ./images/ -t png -overwrite $(PROMPT_ENGINEERING_AND_CONTENT_ORCHESTRATION_PRACTICE_DIR)/uml/*.puml

.PHONY: plantuml_reliability
plantuml_reliability:
	plantuml -o ./images/ -t png -overwrite $(RELIABILITY_AND_OBSERVABILITY_PRACTICE_DIR)/uml/*.puml

.PHONY: rm_ds_store
rm_ds_store:
	find . -name ".DS_Store" -delete

.PHONY: format_markdown
format_markdown:
	find $(PRACTICE_DIR) -name "*.md" -exec markdownlint-cli2 {} \;
	find $(PRACTICE_DIR) -name "*.md" -exec markdownlint-cli2 --fix {} \;
