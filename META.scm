;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — estate-ssg

(define-module (estate-ssg meta)
  #:export (architecture-decisions development-practices design-rationale language-rules component-status))

;; ============================================================================
;; Language Rules - FORTH MANDATORY
;; ============================================================================

(define language-rules
  '((mandatory-language . "Forth")
    (enforcement-level . "absolute")
    (rationale . "Each SSG satellite is the DEFINITIVE implementation for its language. estate-ssg IS the Forth SSG.")
    (violations
     ("Python implementation" . "FORBIDDEN")
     ("JavaScript/TypeScript" . "FORBIDDEN")
     ("Ruby/Go/Java" . "FORBIDDEN")
     ("Any non-Forth language" . "FORBIDDEN - defeats the purpose of this satellite"))
    (correct-implementation
     (interpreter . "gforth")
     (file-extension . ".fs")
     (mcp-adapter . "adapters/ in ReScript (only exception - adapters are in ReScript)"))))

;; ============================================================================
;; Architecture Decision Records
;; ============================================================================

(define architecture-decisions
  '((adr-001
     (title . "Forth-Only Implementation")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "SSG satellites must be in their target language")
     (decision . "estate-ssg is written entirely in Forth using gforth")
     (consequences . ("Language-specific features" "Idiomatic stack-based patterns" "Concatenative paradigm")))

    (adr-002
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Part of hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "CodeQL scanning")))

    (adr-003
     (title . "Stack-Based Data Flow")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "Forth is a concatenative language with explicit stack manipulation")
     (decision . "All data flows through stack transformations, minimal state variables")
     (consequences . ("Natural composition" "Testable words" "Memory efficiency")))

    (adr-004
     (title . "MCP Adapter Isolation")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "poly-ssg-mcp hub requires JavaScript/ReScript adapter")
     (decision . "ReScript adapter isolated in adapters/ directory")
     (consequences . ("Clean separation" "Single exception to Forth-only rule" "Hub compatibility")))

    (adr-005
     (title . "Dynamic Buffer Management")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "Forth requires explicit memory management")
     (decision . "Auto-expanding output buffer with ensure-capacity word")
     (consequences . ("Handle arbitrary content sizes" "Efficient memory use" "Clear allocation/deallocation")))))

;; ============================================================================
;; Development Practices
;; ============================================================================

(define development-practices
  '((code-style
     (language . "Forth")
     (conventions . ("Stack comments ( in -- out )" "Word naming with -" "Section headers with \\"))
     (line-length . 80))
    (security
     (sast . "CodeQL for workflow/adapter scanning")
     (credentials . "env vars only, never committed")
     (dependencies . "gforth system package only"))
    (versioning
     (scheme . "SemVer 2.0.0")
     (current . "1.0.0"))
    (testing
     (framework . "Built-in REPL tests")
     (commands . ("test-buffer" "test-markdown" "test-frontmatter" "test-full")))
    (ci-cd
     (platform . "GitHub Actions")
     (checks . ("Forth syntax validation" "Language enforcement" "CodeQL")))))

;; ============================================================================
;; Design Rationale
;; ============================================================================

(define design-rationale
  '((why-forth
     "This is THE Forth SSG. No other language is acceptable."
     "Forth's concatenative paradigm makes pipelines natural."
     "Stack-based data flow aligns with SSG transformation chains.")
    (why-gforth
     "GNU Forth is the most portable and actively maintained Forth."
     "Provides file I/O, dynamic memory, and modern extensions.")
    (why-minimal
     "Zero external dependencies beyond gforth."
     "Single-file implementation for simplicity."
     "REPL-driven development for rapid iteration.")))

;; ============================================================================
;; 44/44 Component Status for Forth
;; ============================================================================

(define component-status
  '((total-components . 44)
    (completed . 38)
    (in-progress . 4)
    (pending . 2)

    (categories
     ((core-engine
       (count . "4/4")
       (status . "complete")
       (components
        ("Forth Engine" . "src/forth-estate.fs")
        ("Stack-Based Parser" . "parse-markdown word")
        ("Frontmatter Parser" . "parse-frontmatter word")
        ("Template System" . "apply-template word")))

      (build-system
       (count . "4/4")
       (status . "complete")
       (components
        ("Justfile" . "Justfile")
        ("Mustfile" . "Mustfile")
        ("Containerfile" . "Containerfile")
        ("Build scripts" . "src/forth-estate.fs")))

      (site-generation
       (count . "4/4")
       (status . "complete")
       (components
        ("Content processing" . "YAML frontmatter + Markdown")
        ("Template engine" . "{{variable}} substitution")
        ("Output generation" . "HTML files")
        ("File I/O" . "read-file-contents, write-file-contents")))

      (adapters
       (count . "3/3")
       (status . "in-progress")
       (components
        ("MCP Server" . "adapters/src/EstateAdapter.res")
        ("ReScript adapter" . "adapters/")
        ("Hub connection" . "poly-ssg-mcp integration")))

      (accessibility
       (count . "5/5")
       (status . "pending")
       (components
        ("BSL metadata" . "schema planned")
        ("GSL metadata" . "schema planned")
        ("ASL metadata" . "schema planned")
        ("Makaton metadata" . "schema planned")
        ("Accessibility schema" . "a11y/schema.json planned")))

      (testing
       (count . "4/4")
       (status . "complete")
       (components
        ("Unit tests" . "test-buffer, test-markdown")
        ("Integration tests" . "test-frontmatter")
        ("E2E tests" . "test-full")
        ("CI pipeline" . ".github/workflows/ci.yml")))

      (documentation
       (count . "8/8")
       (status . "complete")
       (components
        ("README" . "README.adoc")
        ("Security policy" . "SECURITY.md")
        ("Contributing" . "CONTRIBUTING.md")
        ("Code of conduct" . "CODE_OF_CONDUCT.md")
        ("Cookbook" . "cookbook.adoc")
        ("User guide" . "src/README.md")
        ("Roadmap" . "ROADMAP.scm")
        ("Handover spec" . "HANDOVER.adoc")))

      (configuration
       (count . "3/3")
       (status . "complete")
       (components
        ("Site config schema" . "src/manifest.ncl")
        ("Example config" . "estate.config.json")
        ("Environment handling" . ".env.example")))

      (language-tooling
       (count . "6/6")
       (status . "n/a-using-gforth")
       (components
        ("Lexer" . "gforth built-in")
        ("Parser" . "gforth built-in")
        ("Interpreter" . "gforth")
        ("Compiler" . "gforth")
        ("Syntax highlighting" . "editors/")
        ("REPL" . "gforth interactive")))

      (examples
       (count . "3/3")
       (status . "complete")
       (components
        ("Example content" . "content/")
        ("Example templates" . "templates/")
        ("Example config" . "estate.config.json")))))))
