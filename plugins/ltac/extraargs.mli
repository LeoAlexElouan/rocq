(************************************************************************)
(*         *      The Rocq Prover / The Rocq Development Team           *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

open Genintern
open Tacexpr
open Names
open Constrexpr

val wit_orient : bool Genarg.uniform_genarg_type
val orient : bool Procq.Entry.t
val pr_orient : bool -> Pp.t

val wit_rename : (Id.t * Id.t) Genarg.uniform_genarg_type

val occurrences : (int list Locus.or_var) Procq.Entry.t
val wit_occurrences : (int list Locus.or_var, int list Locus.or_var, int list) Genarg.genarg_type
val pr_occurrences : int list Locus.or_var -> Pp.t
val occurrences_of : int list -> Locus.occurrences

val wit_natural : int Genarg.uniform_genarg_type

val wit_glob :
  (constr_expr,
  glob_constr_and_expr,
  Ltac_pretype.closed_glob_constr) Genarg.genarg_type

val wit_lglob :
  (constr_expr,
  glob_constr_and_expr,
  Ltac_pretype.closed_glob_constr) Genarg.genarg_type

val wit_lconstr :
  (constr_expr,
  glob_constr_and_expr,
  EConstr.t) Genarg.genarg_type

val glob : constr_expr Procq.Entry.t
val lglob : constr_expr Procq.Entry.t

type 'id gen_place= ('id * Locus.hyp_location_flag) option

type loc_place = lident gen_place
type place = Id.t gen_place

val wit_hloc : (loc_place, loc_place, place) Genarg.genarg_type
val hloc : loc_place Procq.Entry.t
val pr_hloc : loc_place -> Pp.t

val by_arg_tac : Tacexpr.raw_tactic_expr option Procq.Entry.t
val wit_by_arg_tac :
  (raw_tactic_expr option,
  glob_tactic_expr option,
  Geninterp.Val.t option) Genarg.genarg_type

val pr_by_arg_tac :
  Environ.env -> Evd.evar_map ->
  (Environ.env -> Evd.evar_map -> Constrexpr.entry_relative_level -> raw_tactic_expr -> Pp.t) ->
  raw_tactic_expr option -> Pp.t

val test_lpar_id_colon : unit Procq.Entry.t

val wit_test_lpar_id_colon : (unit, unit, unit) Genarg.genarg_type

val wit_in_clause :
  (lident Locus.clause_expr,
   lident Locus.clause_expr,
   Id.t   Locus.clause_expr) Genarg.genarg_type

val wit_strategy_level : Conv_oracle.level Genarg.uniform_genarg_type

val wit_strategy_level_or_var : (Conv_oracle.level Locus.or_var, Conv_oracle.level Locus.or_var, Conv_oracle.level) Genarg.genarg_type
