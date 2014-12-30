NAME=shci
GIT_COMMIT=$(shell git rev-parse HEAD)
GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)

build:
	@echo "Building $(GIT_COMMIT) on $(GIT_BRANCH)"
	@chmod 644 README.md
	@chmod 755 $(NAME)

clean:
	@echo "Cleaning stuff up..."
	@rm $(NAME)-$(GIT_COMMIT).tar.gz

test:
	@echo "Running tests..."
	@bash -n $(NAME) || exit 1

release:
	@tar czf $(NAME)-$(GIT_COMMIT).tar.gz shci README.md

.PHONY: build release
