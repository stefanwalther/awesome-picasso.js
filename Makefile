help:								## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

ci:
	docker run -it --rm -v $PWD:/mnt:ro dkhamsing/awesome_bot --white-list "test.com" --allow-dupe --allow-redirect --skip-save-results `find . -name "*.md"`
.PHONY: ci
