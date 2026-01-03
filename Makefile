.PHONY: build run install uninstall clean help

IMAGE_NAME := tifa
INSTALL_PATH := /usr/local/bin/tifa

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build     Build the Docker image"
	@echo "  run       Build and run Claude Code in container"
	@echo "  install   Install 'tifa' command globally"
	@echo "  uninstall Remove 'tifa' command"
	@echo "  clean     Remove Docker image"

build:
	docker buildx build -t $(IMAGE_NAME) .

run: build
	docker run --rm -it -v "$$(pwd):/work" -v tifa-claude:/home/claude/.local -w /work $(IMAGE_NAME)

install: build
	@echo "Installing tifa to $(INSTALL_PATH)..."
	@echo '#!/bin/sh' > /tmp/tifa
	@echo 'docker run --rm -it -v "$$(pwd):/work" -v tifa-claude:/home/claude/.local -w /work tifa "$$@"' >> /tmp/tifa
	sudo mv /tmp/tifa $(INSTALL_PATH)
	sudo chmod +x $(INSTALL_PATH)
	@echo "Done! You can now use 'tifa' from any directory."

uninstall:
	sudo rm -f $(INSTALL_PATH)
	@echo "Removed $(INSTALL_PATH)"

clean:
	docker rmi $(IMAGE_NAME) 2>/dev/null || true
	@echo "Removed Docker image $(IMAGE_NAME)"
