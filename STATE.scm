;;; STATE.scm — estate-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "1.0.0")
    (updated . "2025-12-16")
    (project . "estate-ssg")
    (required-language . "Forth")))

(define language-enforcement
  '((primary-language . "Forth")
    (file-extension . ".fs")
    (interpreter . "gforth")
    (forbidden-languages . ("Python" "JavaScript" "TypeScript" "Ruby" "Go"))
    (rationale . "estate-ssg is the DEFINITIVE Forth static site generator. It MUST be written entirely in Forth. No other implementation languages are permitted.")
    (enforcement . "strict")))

(define current-position
  '((phase . "v1.0 - Forth Implementation Complete")
    (overall-completion . 100)
    (components ((Forth-engine ((status . "complete") (completion . 100)))
                 (mcp-adapter ((status . "pending") (language . "ReScript") (completion . 0)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority ())))

(define critical-next-actions
  '((immediate (("Connect MCP adapter in ReScript" . high)))))

(define state-summary
  '((project . "estate-ssg")
    (language . "Forth")
    (completion . 100)
    (blockers . 0)
    (updated . "2025-12-16")))
