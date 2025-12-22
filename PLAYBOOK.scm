;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; PLAYBOOK.scm — estate-ssg Development Playbook

(define-module (estate-ssg playbook)
  #:export (development-workflow testing-strategy deployment-procedures))

;; ============================================================================
;; Development Workflow
;; ============================================================================

(define development-workflow
  '((setup
     (prerequisites
      ("gforth" . "GNU Forth interpreter - apt install gforth")
      ("just" . "Command runner - cargo install just")
      ("podman" . "Container runtime - optional"))
     (initial-setup
      "git clone https://github.com/hyperpolymath/estate-ssg"
      "cd estate-ssg"
      "just setup"))

    (daily-workflow
     (start-session
      ("just check" . "Verify Forth syntax")
      ("just test" . "Run all tests")
      ("just repl" . "Start interactive REPL"))
     (development-cycle
      ("Edit src/forth-estate.fs" . "Make changes in Forth")
      ("just test" . "Run tests")
      ("just lint" . "Check code style")
      ("just build" . "Build example site"))
     (commit-cycle
      ("just pre-commit" . "Run all checks")
      ("git add -A" . "Stage changes")
      ("git commit -m 'message'" . "Commit with message")
      ("just ci-local" . "Verify CI locally")))

    (branching-strategy
     (main . "Protected, requires PR review")
     (feature/* . "Feature branches")
     (fix/* . "Bug fix branches")
     (claude/* . "AI assistant branches"))))

;; ============================================================================
;; Testing Strategy
;; ============================================================================

(define testing-strategy
  '((test-levels
     (unit-tests
      (location . "src/forth-estate.fs")
      (command . "just test")
      (words . ("test-buffer" "test-markdown" "test-frontmatter" "test-full")))
     (integration-tests
      (description . "Full pipeline tests")
      (command . "just test-e2e")
      (coverage . "frontmatter -> markdown -> template -> output"))
     (e2e-tests
      (description . "End-to-end site build")
      (command . "just build && just serve")
      (validation . "Manual browser inspection")))

    (test-commands
     (("just test" . "Run unit tests in gforth REPL")
      ("just test-e2e" . "Run end-to-end tests")
      ("just test-all" . "Run all test suites")
      ("just ci-local" . "Run full CI pipeline locally")))

    (coverage-goals
     (unit . "All public words tested")
     (integration . "All pipelines tested")
     (e2e . "Example site builds successfully"))))

;; ============================================================================
;; Deployment Procedures
;; ============================================================================

(define deployment-procedures
  '((release-process
     (pre-release
      ("just test-all" . "All tests pass")
      ("just lint" . "No style violations")
      ("Update ROADMAP.scm" . "Mark milestone complete")
      ("Update STATE.scm" . "Update version and date"))
     (release
      ("git tag vX.Y.Z" . "Create version tag")
      ("git push origin vX.Y.Z" . "Push tag")
      ("GitHub release" . "Create release notes"))
     (post-release
      ("Update STATE.scm" . "Start next version")
      ("Update ROADMAP.scm" . "Plan next milestone")))

    (ci-cd-pipeline
     (triggers . ("push to main" "pull_request"))
     (jobs
      (("forth-syntax" . "Validate Forth with gforth")
       ("language-check" . "Ensure no forbidden languages")
       ("codeql" . "Security scanning")
       ("adapter-build" . "Build ReScript adapter"))))

    (container-deployment
     (build . "podman build -t estate-ssg .")
     (run . "podman run -v ./content:/content estate-ssg"))))

;; ============================================================================
;; Forth-Specific Practices
;; ============================================================================

(define forth-practices
  '((stack-discipline
     (always . "Document stack effects ( in -- out )")
     (prefer . "Pure stack transformations over variables")
     (avoid . "Deep stack manipulation, use locals if needed"))

    (word-design
     (naming . "Use hyphen-separated lowercase")
     (size . "Keep words small and composable")
     (testing . "Every word should be testable in REPL"))

    (memory-management
     (allocate . "Always pair with free or throw")
     (buffers . "Use ensure-capacity for dynamic sizing")
     (cleanup . "Free resources in error paths"))))

;; ============================================================================
;; Emergency Procedures
;; ============================================================================

(define emergency-procedures
  '((ci-failure
     (diagnose . "Check GitHub Actions logs")
     (common-issues
      (("gforth not found" . "Update apt cache in workflow")
       ("syntax error" . "Run just check locally")
       ("language violation" . "Remove forbidden file from src/"))))

    (security-incident
     (immediate . "Report via SECURITY.md procedures")
     (contact . "security@hyperpolymath.org")
     (disclosure . "Follow coordinated disclosure policy"))

    (rollback
     (procedure . "git revert <commit>")
     (hotfix . "Create fix/* branch from tag"))))
