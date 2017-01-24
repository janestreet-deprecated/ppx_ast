(* This file is used to control what we use from the current compiler and what is embed in
   this library.

   It must be opened in all modules, especially the ones coming from the compiler.
*)

module Selected_ast = struct
  open Migrate_parsetree

  include Ast_403

  let to_generic_ast x = Ast_403 x
  let of_generic_ast = migrate_to_403

  let of_ocaml_ast x = of_generic_ast (ast_of_current x)
  let to_ocaml_ast x = current_of_ast (to_generic_ast x)
end

(* Modules from migrate_parsetree *)
module Parsetree = Selected_ast.Parsetree
module Asttypes  = Selected_ast.Asttypes

(* Modules imported directly from the compiler *)
module Clflags    = Ocaml_common.Clflags
module Location   = Ocaml_common.Location
module Longident  = Ocaml_common.Longident
module Misc       = Ocaml_common.Misc
module Warnings   = Ocaml_common.Warnings
