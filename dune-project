(lang dune 3.7)

(name adventocaml)
(version 0.1.0)

(generate_opam_files true)

(source
 (github BIRSAx2/adventocaml))

(authors "BIRSAx2")

(maintainers "BIRSAx2")

(license BSD-3-Clause)

(documentation https://github.com/BIRSAx2/adventocaml)

(package
 (name adventocaml)
 (synopsis "OCaml Advent of Code starter project")
 (depends
  ocaml
  reason
  dune
  (cmdliner(>= 1.2.0))
  (piaf (>= 0.2.0))
  (fmt (>= 0.9.0)))
 (tags ("advent-of-code")))
