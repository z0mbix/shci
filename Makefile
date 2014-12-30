NAME=shci
GIT_COMMIT=$(shell git rev-parse HEAD)
GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

build:
	@echo "Building $(GIT_COMMIT) on $(GIT_BRANCH)"
	@chmod 644 README.md
	@chmod 755 $(NAME)

clean:
	@echo "Cleaning stuff up..."

test:
	@echo "Running tests..."
	@bash -n $(NAME) || exit 1

release:
	@echo "Creating tarball release: $(NAME)-$(GIT_COMMIT).tar.gz"
	@tar czf $(NAME)-$(GIT_COMMIT).tar.gz shci README.md

.PHONY: build clean test release
