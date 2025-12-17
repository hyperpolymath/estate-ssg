;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; ROADMAP.scm — estate-ssg Development Roadmap

(define-module (estate-ssg roadmap)
  #:export (roadmap-version milestones completed-milestones))

(define roadmap-version "2025-12-17")

(define completed-milestones
  '((v1.0
     (title . "Forth Implementation Complete")
     (status . "complete")
     (completion-date . "2025-12-16")
     (deliverables
      ("Core Forth SSG engine" . complete)
      ("Markdown parser with headers, bold, italic, code" . complete)
      ("Frontmatter parser (YAML-style)" . complete)
      ("Template system with placeholder substitution" . complete)
      ("File I/O and directory handling" . complete)
      ("REPL-driven test utilities" . complete)
      ("RSR compliance (AGPL-3.0, SPDX headers)" . complete)
      ("CI/CD with language enforcement" . complete)))))

(define milestones
  '((v1.1
     (title . "MCP Adapter Integration")
     (status . "in-progress")
     (target . "Q1 2026")
     (priority . "high")
     (deliverables
      ("ReScript MCP adapter implementation" . in-progress)
      ("poly-ssg-mcp hub connection" . pending)
      ("estate_build tool integration" . in-progress)
      ("estate_clean tool integration" . in-progress)
      ("estate_version tool integration" . complete)
      ("End-to-end hub testing" . pending)))

    (v1.2
     (title . "Enhanced Markdown Support")
     (status . "planned")
     (target . "Q2 2026")
     (priority . "medium")
     (deliverables
      ("Link parsing [text](url)" . pending)
      ("Image embedding ![alt](src)" . pending)
      ("Blockquote support" . pending)
      ("Nested list support" . pending)
      ("Table parsing" . pending)
      ("Footnote support" . pending)))

    (v1.3
     (title . "Advanced Features")
     (status . "planned")
     (target . "Q3 2026")
     (priority . "medium")
     (deliverables
      ("Custom template loading from files" . pending)
      ("Multi-file site builds with glob patterns" . pending)
      ("Tag index generation" . pending)
      ("RSS/Atom feed generation" . pending)
      ("Sitemap XML generation" . pending)))

    (v2.0
     (title . "Performance and Polish")
     (status . "future")
     (target . "Q4 2026")
     (priority . "low")
     (deliverables
      ("Incremental builds" . pending)
      ("Watch mode for development" . pending)
      ("Syntax highlighting in code blocks" . pending)
      ("Plugin/extension system" . pending)
      ("Comprehensive documentation" . pending)))))

(define technical-debt
  '((items
     ("Add comprehensive unit tests" . medium)
     ("Improve error messages with line numbers" . medium)
     ("Memory optimization for large files" . low)
     ("Add --help command line interface" . low))))

(define security-roadmap
  '((completed
     ("SECURITY.md with reporting procedures" . complete)
     (".well-known/security.txt RFC 9110" . complete)
     ("AIBDP v0.2 AI policy manifest" . complete)
     ("SHA-pinned GitHub Actions" . complete)
     ("CodeQL scanning for adapters" . complete))
    (planned
     ("SBOM generation" . pending)
     ("Signed releases" . pending)
     ("Dependency audit automation" . pending))))

(define ecosystem-integration
  '((poly-ssg-mcp
     (status . "adapter-ready")
     (description . "Hub for 28+ SSG satellites")
     (integration-status . "pending"))
    (rhodium-standard
     (status . "gold-target")
     (compliance . "RSR 1.0")
     (badges . ("AGPL-3.0" "SPDX" "SHA-pinned-actions")))))
