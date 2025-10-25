# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is "Tifa" - a minimalist Docker-based isolation layer for running Claude Code safely on macOS. The project provides complete isolation between Claude Code and the host system using Docker containers.

## Key Commands

### Build and Run
- `./run` - Builds the Docker image and runs Claude Code in an isolated container with the current directory mounted
- `docker build -t tifa .` - Manually build the Docker image
- `docker run --rm -it -v "$(pwd):/work" -w /work tifa` - Manually run the container

### Global Installation (for system-wide `tifa` command)
To make the `tifa` command available system-wide from any directory, the user needs to:
1. Copy the `run` script to a location in PATH (e.g., `/usr/local/bin/tifa`)
2. Ensure the Docker image is built: `docker build -t tifa /path/to/this/repo`

## Architecture

This project follows a minimalist architecture with only 4 essential files:

- **Dockerfile**: 3-line Alpine Linux container that installs Claude Code CLI
- **run**: Shell script that handles Docker build and run operations
- **.dockerignore**: Prevents unnecessary files from being copied into the Docker context
- **README.md**: User documentation in Chinese

The design philosophy emphasizes:
- Maximum security through Docker isolation
- Minimal complexity (5 lines of actual code)
- Practical usage with current directory mounting
- Dangerous mode for faster operations within the safe container

## Development Principles

The SPEC.md file emphasizes using first principles thinking - focus on essential functionality without unnecessary complexity.