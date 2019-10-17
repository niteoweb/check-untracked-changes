.PHONY: validate
validate:
	circleci orb validate src/orb.yml

.PHONY: dev-release
dev-release:
	@$(MAKE) validate
	circleci orb publish src/orb.yml niteo/check-untracked-changes@dev:${tag}

.PHONY: prod-release
prod-release:
	@$(MAKE) validate
	circleci orb publish src/orb.yml niteo/check-untracked-changes@${tag}
