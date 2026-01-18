;; SPDX-License-Identifier: AGPL-3.0-or-later
;; META.scm - Project metadata for estate-ssg
;; Media Type: application/meta+scheme

(define project-meta
  `((version . "1.0.0")
    
    (architecture-decisions
      ((adr-001
        (title . "Eiffel as Primary Language")
        (status . "accepted")
        (date . "2024-12-01")
        (context . "Need formal correctness guarantees for site generation")
        (decision . "Use Eiffel for core SSG logic with Design by Contract")
        (consequences
          ("Formal correctness through contracts"
           "Precondition/postcondition enforcement"
           "Class invariants"
           "Smaller community than mainstream languages")))
       
       (adr-002
        (title . "Design by Contract Architecture")
        (status . "accepted")
        (date . "2024-12-01")
        (context . "Site generation errors should be caught early with clear messages")
        (decision . "Enforce contracts on all content operations")
        (consequences
          ("Early error detection"
           "Self-documenting interfaces"
           "Runtime overhead for checks"
           "Requires contract thinking")))
       
       (adr-003
        (title . "Forth as Secondary Processor")
        (status . "accepted")
        (date . "2024-12-01")
        (context . "Stack-based processing natural for content transformation")
        (decision . "Include Forth processor for stack-based template operations")
        (consequences
          ("Natural content flow"
           "Interactive REPL development"
           "Two languages to maintain"
           "Concatenative expressiveness")))
       
       (adr-004
        (title . "Contract-First Development")
        (status . "accepted")
        (date . "2024-12-01")
        (context . "Traditional SSGs fail silently or with cryptic errors")
        (decision . "Define contracts before implementing features")
        (consequences
          ("Clear interface specifications"
           "Better error messages"
           "Slower initial development"
           "Higher confidence in correctness")))))
    
    (development-practices
      ((code-style . "eiffel-standard")
       (security . "openssf-scorecard")
       (testing . "autotest")
       (versioning . "semver")
       (documentation . "asciidoc")
       (branching . "trunk-based")))
    
    (design-rationale
      ((why-eiffel . "The language that pioneered Design by Contract")
       (why-contracts . "Formal specifications catch errors before they become bugs")
       (why-forth . "Stack-based processing complements contract-driven design")
       (why-formal . "Site generation benefits from provable correctness")))))
