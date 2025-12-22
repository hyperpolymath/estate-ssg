;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; ECOSYSTEM.scm — estate-ssg

(define-module (estate-ssg ecosystem)
  #:export (ecosystem-info position-in-ecosystem related-projects integration-points))

;; ============================================================================
;; Ecosystem Identity
;; ============================================================================

(ecosystem
  (version "1.0.0")
  (name "estate-ssg")
  (type "satellite-ssg")
  (purpose "The DEFINITIVE Forth static site generator")
  (tagline "Forth Estate - Stack-based publishing")

  (language-identity
    (primary "Forth")
    (implementation "gforth")
    (file-extension ".fs")
    (rationale "estate-ssg exists to be THE Forth SSG. The entire engine is written in Forth.")
    (forbidden ("Python" "JavaScript" "TypeScript" "Ruby" "Go" "Java" "C" "C++"))
    (enforcement "This is not negotiable. Any non-Forth implementation will be rejected."))

  (position-in-ecosystem
    "Satellite SSG in the poly-ssg constellation. Each satellite is the definitive SSG for its language."
    "One of 28+ language-specific SSG implementations.")

  (what-this-is
    "- The DEFINITIVE static site generator written in Forth"
    "- Part of the poly-ssg satellite constellation"
    "- Stack-based, concatenative, minimal")

  (what-this-is-not
    "- NOT a template that can be reimplemented in other languages"
    "- NOT optional about being in Forth"
    "- NOT a port from another language"))

;; ============================================================================
;; Related Projects
;; ============================================================================

(define related-projects
  '((poly-ssg-mcp
     (name . "poly-ssg-mcp")
     (url . "https://github.com/hyperpolymath/poly-ssg-mcp")
     (relationship . "hub")
     (description . "Unified MCP server for 28+ SSGs - provides adapter interface")
     (integration . "via adapters/src/EstateAdapter.res"))

    (rhodium-standard-repositories
     (name . "rhodium-standard-repositories")
     (url . "https://github.com/hyperpolymath/rhodium-standard-repositories")
     (relationship . "standard")
     (description . "Repository quality standards for RSR compliance")
     (target . "Gold"))

    (hyperpolymath-org
     (name . "hyperpolymath.org")
     (url . "https://hyperpolymath.org")
     (relationship . "parent-org")
     (description . "Parent organization for all poly-ssg satellites"))))

;; ============================================================================
;; Integration Points
;; ============================================================================

(define integration-points
  '((mcp-adapter
     (location . "adapters/src/EstateAdapter.res")
     (language . "ReScript")
     (tools . ("estate_build" "estate_clean" "estate_version"))
     (status . "in-progress"))

    (ci-cd
     (platform . "GitHub Actions")
     (workflows . (".github/workflows/ci.yml" ".github/workflows/codeql.yml"))
     (checks . ("forth-syntax" "language-enforcement" "codeql-analysis")))

    (security
     (policy . "SECURITY.md")
     (contact . "security@hyperpolymath.org")
     (scanning . ("CodeQL" "Dependabot"))
     (manifests . (".well-known/security.txt" ".well-known/aibdp.json")))

    (documentation
     (readme . "README.adoc")
     (cookbook . "cookbook.adoc")
     (roadmap . "ROADMAP.scm")
     (state . "STATE.scm"))))

;; ============================================================================
;; Satellite Constellation Position
;; ============================================================================

(define constellation-position
  '((satellite-id . "estate-ssg")
    (language . "Forth")
    (constellation . "poly-ssg")
    (hub . "poly-ssg-mcp")
    (sibling-satellites
     ("noteg-ssg" . "Ada/SPARK")
     ("meridian-ssg" . "Elixir")
     ("lapis-ssg" . "Ruby")
     ("forge-ssg" . "Rust")
     ("spire-ssg" . "Haskell")
     ("nexus-ssg" . "Go"))))
