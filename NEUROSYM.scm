;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; NEUROSYM.scm — estate-ssg Neurosymbolic Integration

(define-module (estate-ssg neurosym)
  #:export (symbolic-structure neural-integration reasoning-patterns))

;; ============================================================================
;; Symbolic Structure - Forth Semantics
;; ============================================================================

(define symbolic-structure
  '((forth-semantics
     (paradigm . "Concatenative, stack-based")
     (composition . "Words compose by juxtaposition")
     (data-flow . "Implicit through stack")
     (control-flow . "Conditionals, loops, recursion"))

    (word-taxonomy
     (primitives
      (stack-ops . ("dup" "drop" "swap" "over" "rot" "nip" "tuck"))
      (arithmetic . ("+" "-" "*" "/" "mod" "negate"))
      (comparison . ("=" "<>" "<" ">" "<=" ">="))
      (memory . ("@" "!" "c@" "c!" "allocate" "free")))
     (compound-words
      (string-utils . ("trim" "trim-left" "trim-right" "string=" "starts-with?"))
      (buffer-ops . ("init-output" "append-output" "get-output" "reset-output"))
      (parsers . ("parse-frontmatter" "parse-markdown" "process-line"))
      (io . ("read-file-contents" "write-file-contents"))))

    (type-system
     (basic . ("flag" "char" "n" "u" "addr"))
     (pairs . ("addr u" "c-addr u"))
     (conventions . "Stack comments document types"))))

;; ============================================================================
;; Neural Integration Points
;; ============================================================================

(define neural-integration
  '((llm-assistance
     (code-generation
      (input . "Natural language description")
      (output . "Forth word with stack comment")
      (constraint . "Must follow Forth idioms"))
     (code-explanation
      (input . "Forth word definition")
      (output . "Natural language explanation")
      (include . "Stack effect, purpose, usage"))
     (bug-diagnosis
      (input . "Error message + context")
      (output . "Likely cause + fix")
      (method . "Stack trace analysis")))

    (embedding-spaces
     (word-embeddings
      (source . "Forth word names and definitions")
      (use . "Semantic similarity for word discovery"))
     (stack-pattern-embeddings
      (source . "Stack effect signatures")
      (use . "Find words with compatible effects")))

    (hybrid-reasoning
     (symbolic . "Type checking via stack effects")
     (neural . "Intent understanding from comments")
     (combined . "Suggest implementations matching intent + types"))))

;; ============================================================================
;; Reasoning Patterns
;; ============================================================================

(define reasoning-patterns
  '((stack-effect-reasoning
     (inference
      "Given: word1 ( a b -- c ) and word2 ( c -- d e )"
      "Compose: word1 word2 ( a b -- d e )")
     (verification
      "Check: Does composed effect match requirement?")
     (synthesis
      "Find: Words that bridge ( current-stack -- target-stack )"))

    (template-matching
     (pattern . "{{placeholder}}")
     (recognition . "Identify placeholders in template")
     (substitution . "Replace with frontmatter values")
     (verification . "All placeholders resolved"))

    (markdown-parsing
     (state-machine
      (states . ("normal" "in-code-block" "in-paragraph" "in-list"))
      (transitions . "Line-by-line based on markers")
      (output . "HTML elements"))
     (pattern-recognition
      (headers . "^#{1,6} ")
      (lists . "^[-*] |^\\d+\\. ")
      (code . "^```")
      (emphasis . "\\*\\*|\\*|`")))))

;; ============================================================================
;; Knowledge Representation
;; ============================================================================

(define knowledge-representation
  '((project-ontology
     (entities
      (word . "Forth word definition")
      (stack-effect . "( in -- out ) signature")
      (section . "Code section delimited by \\")
      (test . "test-* word for verification"))
     (relations
      (defines . "File defines Word")
      (calls . "Word calls Word")
      (tests . "Test verifies Word")
      (documents . "Comment explains Word")))

    (ssg-domain
     (concepts
      (content . "Source markdown files")
      (frontmatter . "YAML metadata block")
      (template . "HTML with placeholders")
      (output . "Generated HTML files"))
     (transformations
      (parse . "Content -> Frontmatter + Body")
      (render . "Markdown -> HTML")
      (apply . "Template + Content -> Page")
      (write . "Page -> File")))))

;; ============================================================================
;; Inference Rules
;; ============================================================================

(define inference-rules
  '((type-compatibility
     (rule . "If word1 outputs type T and word2 inputs type T, they compose")
     (application . "Stack effect analysis"))

    (side-effect-tracking
     (rule . "Words with ! or write modify state")
     (application . "Identify stateful operations"))

    (error-propagation
     (rule . "throw propagates, catch handles")
     (application . "Error path analysis"))

    (memory-safety
     (rule . "allocate must pair with free")
     (application . "Resource leak detection"))))
