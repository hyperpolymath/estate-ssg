;; SPDX-License-Identifier: AGPL-3.0-or-later
;; ECOSYSTEM.scm - Ecosystem positioning for estate-ssg
;; Media Type: application/vnd.ecosystem+scm

(ecosystem
  (version "1.0.0")
  (name "estate-ssg")
  (type "ssg-engine")
  (purpose "Design by Contract static site generation using Eiffel for formal correctness guarantees through preconditions, postconditions, and invariants")
  
  (position-in-ecosystem
    (role "satellite")
    (hub "poly-ssg-mcp")
    (category "formal-methods")
    (distinguishing-factor "Eiffel's Design by Contract for provably correct site generation"))
  
  (related-projects
    ((name "poly-ssg-mcp")
     (relationship "hub")
     (description "Central MCP hub providing unified SSG orchestration"))
    ((name "odd-ssg")
     (relationship "sibling")
     (description "Forth/betlang SSG for probabilistic content"))
    ((name "my-ssg")
     (relationship "sibling")
     (description "Janet-based SSG for Lisp-style scripting"))
    ((name "baremetal-ssg")
     (relationship "sibling")
     (description "RISC-V assembly SSG for bare metal"))
    ((name "shift-ssg")
     (relationship "sibling")
     (description "Wren-based SSG with fiber concurrency")))
  
  (what-this-is
    ("A static site generator written in Eiffel language"
     "Design by Contract for all operations"
     "Precondition validation on content input"
     "Postcondition verification on generated output"
     "Class invariants for state consistency"
     "Part of the poly-ssg ecosystem"))
  
  (what-this-is-not
    ("Not a dynamically typed SSG"
     "Not ignoring correctness for speed"
     "Not just another Forth-based generator"
     "Not suitable for rapid prototyping without contracts")))
