# SPDX-License-Identifier: AGPL-3.0-or-later
# Justfile — estate-ssg build automation
# Usage: just <recipe>

# Default recipe
default:
    @just --list

# ============================================================================
# Core Commands
# ============================================================================

# Build the site from content/ to output/
build:
    @echo "Building site with Forth Estate..."
    gforth src/forth-estate.fs -e 's" content" s" output" build-site bye'

# Clean output directory
clean:
    @echo "Cleaning output directory..."
    rm -rf output/
    @echo "Done."

# Check Forth syntax
check:
    @echo "Checking Forth syntax..."
    gforth src/forth-estate.fs -e 'bye'
    @echo "Syntax OK."

# Start interactive REPL
repl:
    @echo "Starting Forth Estate REPL..."
    gforth src/forth-estate.fs

# ============================================================================
# Testing
# ============================================================================

# Run all unit tests
test:
    @echo "Running Forth tests..."
    gforth src/forth-estate.fs -e 'test-buffer test-markdown test-frontmatter bye'

# Run end-to-end tests
test-e2e:
    @echo "Running E2E tests..."
    gforth src/forth-estate.fs -e 'test-full bye'

# Run all tests
test-all: test test-e2e
    @echo "All tests passed."

# ============================================================================
# Development
# ============================================================================

# Setup development environment
setup:
    @echo "Setting up estate-ssg development environment..."
    @command -v gforth >/dev/null 2>&1 || { echo "Installing gforth..."; sudo apt-get update && sudo apt-get install -y gforth; }
    @echo "Creating directories..."
    mkdir -p content templates output
    @echo "Setup complete."

# Pre-commit checks
pre-commit: check test lint
    @echo "Pre-commit checks passed."

# Lint code style
lint:
    @echo "Checking code style..."
    @# Check for SPDX headers
    @grep -q "SPDX-License-Identifier" src/forth-estate.fs || { echo "Missing SPDX header"; exit 1; }
    @echo "Lint passed."

# Format check (Forth doesn't have a standard formatter)
fmt:
    @echo "Forth formatting is manual - check word alignment and comments."

# ============================================================================
# Adapter Commands
# ============================================================================

# Build ReScript adapter
adapter-build:
    @echo "Building ReScript adapter..."
    cd adapters && npm install && npm run build

# Clean adapter build
adapter-clean:
    @echo "Cleaning adapter build..."
    cd adapters && npm run clean

# Watch adapter for changes
adapter-watch:
    cd adapters && npm run watch

# ============================================================================
# Container Commands
# ============================================================================

# Build container image
container-build:
    @echo "Building container..."
    podman build -t estate-ssg .

# Run container
container-run:
    @echo "Running estate-ssg container..."
    podman run -v ./content:/content:ro -v ./output:/output estate-ssg

# ============================================================================
# CI/CD Commands
# ============================================================================

# Run CI pipeline locally
ci-local: check lint test-all language-check
    @echo "CI pipeline passed locally."

# Check for forbidden languages in src/
language-check:
    @echo "Checking for forbidden languages in src/..."
    @forbidden=$$(find src/ -type f \( -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.c" \) 2>/dev/null || true); \
    if [ -n "$$forbidden" ]; then \
        echo "ERROR: Found forbidden language files:"; \
        echo "$$forbidden"; \
        exit 1; \
    fi
    @echo "Language check passed - only Forth in src/"

# ============================================================================
# Documentation
# ============================================================================

# Generate documentation
docs:
    @echo "Documentation is in README.adoc and cookbook.adoc"
    @echo "View with: asciidoctor README.adoc -o docs/index.html"

# Serve documentation locally
docs-serve:
    @echo "Serving docs on http://localhost:8000"
    python3 -m http.server 8000 --directory docs/

# ============================================================================
# Release Commands
# ============================================================================

# Create release tag
release version:
    @echo "Creating release {{version}}..."
    git tag -a v{{version}} -m "Release {{version}}"
    @echo "Push with: git push origin v{{version}}"

# Show version
version:
    @echo "estate-ssg v1.0.0"
    @gforth --version

# ============================================================================
# Utility Commands
# ============================================================================

# Show project status
status:
    @echo "=== estate-ssg Status ==="
    @echo "Language: Forth (gforth)"
    @gforth --version 2>/dev/null || echo "gforth not installed"
    @echo ""
    @echo "Files:"
    @ls -la src/*.fs 2>/dev/null || echo "No Forth files in src/"
    @echo ""
    @echo "Recent commits:"
    @git log --oneline -5

# Count lines of code
loc:
    @echo "Lines of Forth code:"
    @wc -l src/*.fs
    @echo ""
    @echo "Lines of ReScript (adapter):"
    @wc -l adapters/src/*.res 2>/dev/null || echo "No ReScript files"

# Show help
help:
    @echo "estate-ssg - The Forth Static Site Generator"
    @echo ""
    @echo "Core commands:"
    @echo "  just build      - Build the site"
    @echo "  just clean      - Clean output"
    @echo "  just repl       - Start Forth REPL"
    @echo ""
    @echo "Testing:"
    @echo "  just test       - Run unit tests"
    @echo "  just test-e2e   - Run E2E tests"
    @echo "  just test-all   - Run all tests"
    @echo ""
    @echo "Development:"
    @echo "  just setup      - Setup environment"
    @echo "  just check      - Check syntax"
    @echo "  just lint       - Check style"
    @echo "  just pre-commit - Pre-commit checks"
    @echo ""
    @echo "Run 'just --list' for all recipes"
