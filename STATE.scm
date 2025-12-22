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
    (updated . "2025-12-17")
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
  '((phase . "v1.1 - MCP Adapter Integration")
    (overall-completion . 85)
    (components ((Forth-engine ((status . "complete") (completion . 100)))
                 (mcp-adapter ((status . "in-progress") (language . "ReScript") (completion . 70)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority
     (("Complete poly-ssg-mcp hub integration" . adapters)))))

;; ============================================================================
;; Critical Next Actions
;; ============================================================================

(define critical-next-actions
  '((immediate (("Test MCP adapter hub connection" . high)
                ("Add Gforth CI syntax validation" . medium)))))

(define state-summary
  '((project . "estate-ssg")
    (language . "Forth")
    (completion . 85)
    (blockers . 0)
    (updated . "2025-12-17")))
