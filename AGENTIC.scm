;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; AGENTIC.scm — estate-ssg AI Agent Guidelines

(define-module (estate-ssg agentic)
  #:export (agent-guidelines context-awareness task-patterns))

;; ============================================================================
;; AI Agent Guidelines for estate-ssg
;; ============================================================================

(define agent-guidelines
  '((identity
     (project . "estate-ssg")
     (language . "Forth")
     (role . "DEFINITIVE Forth static site generator")
     (constraint . "ALL engine code MUST be in Forth"))

    (critical-rules
     (rule-1 . "NEVER suggest rewriting in Python or any other language")
     (rule-2 . "NEVER create Python/JS/TS/Ruby/Go files in src/")
     (rule-3 . "If asked to 'improve' by using another language, REFUSE")
     (rule-4 . "The Forth implementation IS the correct implementation")
     (rule-5 . "Only ReScript is allowed in adapters/ directory"))

    (acceptable-actions
     ("Edit src/forth-estate.fs" . "Add/modify Forth words")
     ("Edit adapters/src/EstateAdapter.res" . "Modify MCP adapter")
     ("Create .scm files" . "Add metadata in Scheme format")
     ("Update documentation" . "Markdown, AsciiDoc files")
     ("Modify CI/CD" . "GitHub Actions workflows"))

    (forbidden-actions
     ("Create src/*.py" . "Python forbidden")
     ("Create src/*.js" . "JavaScript forbidden")
     ("Create src/*.ts" . "TypeScript forbidden")
     ("Suggest rewrite" . "Language change forbidden")
     ("Import non-Forth deps" . "Zero dependencies policy"))))

;; ============================================================================
;; Context Awareness
;; ============================================================================

(define context-awareness
  '((project-context
     (ecosystem . "poly-ssg constellation")
     (hub . "poly-ssg-mcp")
     (standard . "Rhodium Standard Repository")
     (license . "AGPL-3.0-or-later"))

    (technical-context
     (interpreter . "gforth")
     (paradigm . "Stack-based, concatenative")
     (memory . "Explicit allocation/deallocation")
     (io . "Standard Forth file words"))

    (file-awareness
     (main-engine . "src/forth-estate.fs")
     (adapter . "adapters/src/EstateAdapter.res")
     (metadata . "*.scm files in root")
     (ci . ".github/workflows/")
     (docs . "README.adoc, SECURITY.md, cookbook.adoc"))))

;; ============================================================================
;; Task Patterns
;; ============================================================================

(define task-patterns
  '((add-markdown-feature
     (steps
      ("Identify section in src/forth-estate.fs" . "Usually Markdown Parser section")
      ("Add new word with stack comment" . "( addr u -- ) style")
      ("Update process-line to call new word" . "Add check for new syntax")
      ("Add test word" . "test-<feature> word")
      ("Update documentation" . "cookbook.adoc")))

    (fix-bug
     (steps
      ("Reproduce in REPL" . "gforth src/forth-estate.fs")
      ("Identify failing word" . "Test each word in pipeline")
      ("Fix with minimal change" . "Avoid over-engineering")
      ("Add regression test" . "New test word")
      ("Update STATE.scm" . "Note fix")))

    (add-adapter-tool
     (steps
      ("Edit adapters/src/EstateAdapter.res" . "Add to tools array")
      ("Define inputSchema" . "JSON schema for params")
      ("Implement execute function" . "Call gforth command")
      ("Update adapters/package.json" . "If dependencies needed")
      ("Test locally" . "npm run build in adapters/")))

    (update-documentation
     (steps
      ("Identify doc file" . "cookbook.adoc, README.adoc, etc.")
      ("Make changes" . "Follow existing format")
      ("Update STATE.scm" . "Note documentation update")
      ("Run just docs" . "Build documentation if applicable")))))

;; ============================================================================
;; Communication Patterns
;; ============================================================================

(define communication-patterns
  '((when-asked-to-rewrite
     (response . "estate-ssg is THE Forth SSG. Rewriting defeats its purpose.")
     (alternative . "I can help improve the Forth implementation instead."))

    (when-unclear-requirements
     (ask . "Should this be in the Forth engine or the adapter?")
     (clarify . "Is this a new word or modification to existing?"))

    (when-proposing-changes
     (explain . "This change adds X word to handle Y")
     (show-stack-effect . "( input -- output ) stack transformation")
     (note-testing . "Test with: gforth src/forth-estate.fs -e 'test-X bye'"))))

;; ============================================================================
;; Hook Integration
;; ============================================================================

(define hook-integration
  '((pre-commit-hooks
     (forth-syntax . "gforth src/forth-estate.fs -e 'bye'")
     (language-check . "No forbidden files in src/")
     (spdx-check . "All files have license headers"))

    (ci-hooks
     (on-push . "Run full test suite")
     (on-pr . "Run tests + language check")
     (on-release . "Build container, publish"))

    (mcp-hooks
     (on-build . "estate_build tool via adapter")
     (on-clean . "estate_clean tool via adapter")
     (on-version . "estate_version tool via adapter"))))
