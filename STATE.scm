;;; STATE.scm — estate-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define-module (estate-ssg state)
  #:export (metadata language-enforcement current-position component-completion))

;; ============================================================================
;; Project Metadata
;; ============================================================================

(define metadata
  '((version . "1.0.0")
    (updated . "2025-12-22")
    (project . "estate-ssg")
    (required-language . "Forth")
    (license . "AGPL-3.0-or-later")
    (rsr-compliance . "Gold")))

;; ============================================================================
;; Language Enforcement
;; ============================================================================

(define language-enforcement
  '((primary-language . "Forth")
    (file-extension . ".fs")
    (interpreter . "gforth")
    (forbidden-languages . ("Python" "JavaScript" "TypeScript" "Ruby" "Go" "Java"))
    (rationale . "estate-ssg is the DEFINITIVE Forth static site generator. It MUST be written entirely in Forth. No other implementation languages are permitted.")
    (enforcement . "strict")
    (ci-validation . "GitHub Actions language-check job")))

;; ============================================================================
;; Current Position - 44/44 Components
;; ============================================================================

(define current-position
  '((phase . "v1.1 - Full Component Implementation")
    (overall-completion . 86)
    (total-components . 44)
    (completed-components . 38)
    (components
     ((core-engine ((status . "complete") (completion . 100) (count . "4/4")))
      (build-system ((status . "complete") (completion . 100) (count . "4/4")))
      (site-generation ((status . "complete") (completion . 100) (count . "4/4")))
      (adapters ((status . "in-progress") (completion . 70) (count . "2/3")))
      (accessibility ((status . "pending") (completion . 0) (count . "0/5")))
      (testing ((status . "complete") (completion . 100) (count . "4/4")))
      (documentation ((status . "complete") (completion . 100) (count . "8/8")))
      (configuration ((status . "complete") (completion . 100) (count . "3/3")))
      (language-tooling ((status . "n/a-gforth") (completion . 100) (count . "6/6")))
      (examples ((status . "complete") (completion . 100) (count . "3/3")))))))

;; ============================================================================
;; Component Completion Detail
;; ============================================================================

(define component-completion
  '((core-engine
     (status . "COMPLETE")
     (items
      (("Forth Engine" . "src/forth-estate.fs" . complete)
       ("Stack-Based Markdown Parser" . "parse-markdown" . complete)
       ("Frontmatter Parser" . "parse-frontmatter" . complete)
       ("Template System" . "apply-template" . complete))))

    (build-system
     (status . "COMPLETE")
     (items
      (("Justfile" . "Justfile" . complete)
       ("Mustfile" . "Mustfile" . complete)
       ("Containerfile" . "Containerfile" . complete)
       ("Build words" . "build-site, process-file" . complete))))

    (site-generation
     (status . "COMPLETE")
     (items
      (("Content processing" . "YAML frontmatter + Markdown" . complete)
       ("Template engine" . "{{variable}} substitution" . complete)
       ("Output generation" . "HTML files" . complete)
       ("File I/O" . "read-file-contents, write-file-contents" . complete))))

    (adapters
     (status . "IN-PROGRESS")
     (items
      (("MCP Server" . "adapters/src/EstateAdapter.res" . complete)
       ("ReScript build" . "adapters/package.json" . complete)
       ("Hub connection" . "poly-ssg-mcp" . pending))))

    (testing
     (status . "COMPLETE")
     (items
      (("Unit tests" . "test-buffer" . complete)
       ("Markdown tests" . "test-markdown" . complete)
       ("Integration tests" . "test-frontmatter" . complete)
       ("E2E tests" . "test-full" . complete))))

    (documentation
     (status . "COMPLETE")
     (items
      (("README" . "README.adoc" . complete)
       ("Security" . "SECURITY.md" . complete)
       ("Contributing" . "CONTRIBUTING.md" . complete)
       ("Cookbook" . "cookbook.adoc" . complete)
       ("Roadmap" . "ROADMAP.scm" . complete)
       ("Handover" . "HANDOVER.adoc" . complete)
       ("User guide" . "src/README.md" . complete)
       ("Code of conduct" . "CODE_OF_CONDUCT.md" . complete))))

    (configuration
     (status . "COMPLETE")
     (items
      (("Site schema" . "src/manifest.ncl" . complete)
       ("Example config" . "estate.config.json" . complete)
       ("Environment" . ".env.example" . complete))))))

;; ============================================================================
;; Blockers and Issues
;; ============================================================================

(define blockers-and-issues
  '((critical ())
    (high-priority
     (("Complete poly-ssg-mcp hub integration" . adapters)))))

;; ============================================================================
;; Critical Next Actions
;; ============================================================================

(define critical-next-actions
  '((immediate
     (("Test MCP adapter hub connection" . high)
      ("Add accessibility schemas" . medium)
      ("Verify CI pipeline with actual Gforth" . medium)))
    (next-sprint
     (("Enhanced markdown features" . medium)
      ("Link and image parsing" . medium)))))

;; ============================================================================
;; State Summary
;; ============================================================================

(define state-summary
  '((project . "estate-ssg")
    (language . "Forth")
    (completion . 86)
    (components . "38/44")
    (blockers . 0)
    (critical-issues . 0)
    (updated . "2025-12-22")))
