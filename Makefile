all: help

help:
	@echo "Usage: make <target>"
	@echo
	@echo "Available targets are:"
	@echo "  setup             set up the dotfiles"
	@echo "  test              run shellcheck on shell scripts"

setup:
	./setup.sh

test:
	shellcheck -xs sh setup.sh
	shellcheck -xs bash files/bashrc
