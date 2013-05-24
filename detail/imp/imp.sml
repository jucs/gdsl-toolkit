(**
 * ## Simple imperative intermediate representation.
 *)
structure Imp = struct
   
   type sym = SymbolTable.symid

   (* types of values *)
   datatype vtype =
         VOIDvtype
       | BITvtype
       | INTvtype
       | STRINGvtype
       | OBJvtype
       | FUNvtype of (vtype * bool * vtype list) (* flag is true if function contains closure arguments *) 

   type arg = vtype * sym

   datatype prim =
         GETSTATEprim
       | SETSTATEprim
       | IPGETprim
       | CONSUME8prim
       | CONSUME16prim
       | CONSUME32prim
       | UNCONSUME8prim
       | UNCONSUME16prim
       | UNCONSUME32prim
       | PRINTLNprim
       | RAISEprim
       | ANDprim
       | ORprim
       | SIGNEDprim
       | UNSIGNEDprim
       | ADDprim
       | SUBprim
       | EQprim
       | MULprim
       | LTprim
       | LEprim
       | NOT_VECprim
       | EQ_VECprim
       | CONCAT_VECprim
       | INT_TO_STRINGprim
       | BITVEC_TO_STRINGprim
       | CONCAT_STRINGprim
       | SLICEprim
       | GET_CON_IDXprim
       | GET_CON_ARGprim

   (* information on how to print primitives, the name is the C name
      and the priority is the operator precedence, 0 if not infix *)
   fun prim_info GETSTATEprim = { name = "__get_state", prio = 0 }
     | prim_info SETSTATEprim = { name = "__set_state", prio = 0 }
     | prim_info IPGETprim = { name = "__ipget", prio = 0 }
     | prim_info CONSUME8prim = { name = "__consume8", prio = 0 }
     | prim_info CONSUME16prim = { name = "__consume16", prio = 0 }
     | prim_info CONSUME32prim = { name = "__consume32", prio = 0 }
     | prim_info UNCONSUME8prim = { name = "__unconsume8", prio = 0 }
     | prim_info UNCONSUME16prim = { name = "__unconsume16", prio = 0 }
     | prim_info UNCONSUME32prim = { name = "__consume32", prio = 0 }
     | prim_info PRINTLNprim = { name = "__println", prio = 0 }
     | prim_info RAISEprim = { name = "__raise", prio = 0 }
     | prim_info ANDprim = { name = "&", prio = 10 }
     | prim_info ORprim = { name = "|", prio = 12 }
     | prim_info SIGNEDprim = { name = "__sx", prio = 0 }
     | prim_info UNSIGNEDprim = { name = "__zx", prio = 0 }
     | prim_info ADDprim = { name = "+", prio = 6 }
     | prim_info SUBprim = { name = "-", prio = 6 }
     | prim_info EQprim = { name = "==", prio = 9 }
     | prim_info MULprim = { name = "*", prio = 5 }
     | prim_info LTprim = { name = "<", prio = 8 }
     | prim_info LEprim = { name = "<=", prio = 8 }
     | prim_info NOT_VECprim = { name = "__not", prio = 0 }
     | prim_info EQ_VECprim = {name = "__equal", prio = 0 }
     | prim_info CONCAT_VECprim = { name = "__concat", prio = 0 }
     | prim_info INT_TO_STRINGprim = { name = "__showint", prio = 0 }
     | prim_info BITVEC_TO_STRINGprim  = { name = "__showbitvec", prio = 0 }
     | prim_info CONCAT_STRINGprim = { name = "__concatstring", prio = 0 }
     | prim_info SLICEprim = { name = "__slice", prio = 0 }
     | prim_info GET_CON_IDXprim = { name = "__get_con_idx", prio = 0 }
     | prim_info GET_CON_ARGprim = { name = "__get_con_arg", prio = 0 }

   (*
   * fun f x =
   *   let fun g y = x * y          g = closure(g_closure, [x])
   *   in
   *     g 4                        invoke(g,[y])
   *   end
   *
   * int g_closure(x, y) {
   *   return x * y;
   * }
   *
   * int f(int x) {
   *   return g_closure(x, 4);
   * }
   *)
   datatype monkind =
      PUREmonkind
    | INmonkind
    | INOUTmonkind

   datatype decl =
      FUNCdecl of {
        funcMonadic : monkind,
        funcClosure : arg list,
        funcType : vtype,
        funcName : sym,
        funcArgs : arg list,
        funcLocals : arg list,
        funcBody : stmt list,
        funcRes : exp
      }
    | SELECTdecl of {
        selectName : sym,
        selectField : sym
      }
    | UPDATEdecl of {
        updateName : sym,
        updateFields : sym list
      }
    | CONdecl of {
        conName : sym,
        conArg : sym
      }

   and exp =
      IDexp of sym
    | PRIexp of monkind * prim * vtype * exp list
    | CALLexp of monkind * sym * exp list (* callee is unboxed *)
    | INVOKEexp of monkind * exp * exp list (* callee is a closure *)
    | RECORDexp of (sym * exp) list
    | LITexp of vtype * lit
    | BOXexp of vtype * exp
    | UNBOXexp of vtype * exp
    | VEC2INTexp of int option * exp
    | INT2VECexp of int * exp
    | CLOSUREexp of vtype * sym * exp list
    | STATEexp of exp (* generate closure that expects a state *)
    | EXECexp of exp (* apply the state to the closure *)

   and stmt =
      ASSIGNstmt of sym option * exp
    | IFstmt of exp * stmt list * stmt list
    | CASEstmt of exp * (pat * stmt list) list

   and pat =
      VECpat of String.string
    | CONpat of sym
    | INTpat of IntInf.int
    | WILDpat

   and lit = 
      VEClit of String.string
    | STRlit of String.string
    | INTlit of IntInf.int
    | CONlit of sym

   type decls = decl list

   type imp = {
      decls : decl list
   }
   structure Spec = struct
      open Spec
      type t = imp Spec.t
   end

   structure PP = struct
      open Layout Pretty
      fun var sym = SpecAbstractTree.PP.var_use sym
      fun con sym = SpecAbstractTree.PP.con_use sym
      fun fld sym = SpecAbstractTree.PP.field_use sym
      fun vars xs = seq [lp, seq (separate (map var xs, ",")), rp]
      fun args (lp,arg,xs,rp) = [str lp, seq (separate (map arg xs, ",")), str rp]
      fun vtype VOIDvtype = str "void"
        | vtype OBJvtype = str "obj"
        | vtype BITvtype = str "bitvec"
        | vtype INTvtype = str "int"
        | vtype STRINGvtype = str "string"
        | vtype (FUNvtype (res, cl, atys)) =
            seq (args (if cl then "(...," else "(",vtype,atys,")") @
                [str "->", vtype res])
      fun arg (t,n) = seq [vtype t, space, var n]
      fun monarg PUREmonkind = ")"
        | monarg INmonkind = ",$)"
        | monarg INOUTmonkind = ",$$)"
      fun decl (FUNCdecl {
           funcMonadic,
           funcClosure,
           funcType,
           funcName,
           funcArgs,
           funcLocals,
           funcBody,
           funcRes
         }) =
            align [
               seq ([vtype funcType, space,
                   var funcName] @
                   (if null funcClosure then [] else
                     args ("[", arg, funcClosure, "]")) @
                   (args ("(", arg, funcArgs, monarg funcMonadic))
               ),
               indent 3 (align (
                  map vardecl funcLocals @
                  map stmt funcBody @
                  [seq [str "return ", exp funcRes]] ))
               ]
        | decl (SELECTdecl { selectName = name, selectField = f }) =
            seq [var name, str ";"]
        | decl (UPDATEdecl { updateName = name, updateFields = fs }) =
            seq [var name, str ";"]
        | decl (CONdecl { conName = name, conArg = arg }) =
            seq [var name, str "(", var arg, str ");"]
      and vardecl (ty, sym) = seq [vtype ty, space, var sym]
      and lit (t,VEClit s) = seq [str "0b", str s] 
        | lit (t,STRlit s) = seq [str "\"", str s, str "\""]
        | lit (t,INTlit i) = str (IntInf.toString i)
        | lit (t,CONlit s) = con s
      and exp (IDexp sym) = var sym
        | exp (PRIexp (m,p,t,es)) =
            seq (vtype t :: space :: str "prim" :: space ::
              str (#name (prim_info p)) :: args ("(",exp,es,monarg m))
        | exp (CALLexp (m,f,es)) = seq (var f :: args ("(",exp,es,monarg m))
        | exp (INVOKEexp (m,f,es)) = seq (str "*" :: exp f :: args ("(",exp,es,monarg m))
        | exp (RECORDexp fs) = seq (args ("{",field,fs,"}"))
        | exp (LITexp l) = lit l
        | exp (BOXexp (t,e)) = seq [str "box[", vtype t, str "](", exp e, str ")"]
        | exp (UNBOXexp (t,e)) = seq [str "unbox[", vtype t, str "](", exp e, str ")"]
        | exp (VEC2INTexp (NONE,e)) = seq [str "vec2int(", exp e, str ")"]
        | exp (VEC2INTexp (SOME s,e)) = seq [str "vec2int[", str (Int.toString s), str "](", exp e, str ")"]
        | exp (INT2VECexp (s,e)) = seq [str "int2vec[", str (Int.toString s), str "](", exp e, str ")"]
        | exp (CLOSUREexp (t,s,es)) =
         seq ([vtype t, space, str "closure", space, var s] @
              args ("[",exp,es,"]"))
        | exp (STATEexp e) = seq [str "(fn $ => ", exp e, str ")"]
        | exp (EXECexp e) = seq [exp e, str "($)"]
      and stmts ss = align (map stmt ss)
      and stmt (ASSIGNstmt (SOME s,e)) = seq [var s, space, str "=", space, exp e]
        | stmt (ASSIGNstmt (NONE,e)) = exp e
        | stmt (IFstmt (c,t,e)) =
            align [
               seq [str "if", space, exp c, space, str "then"],
               indent 3 (stmts t),
               str "else",
               indent 3 (stmts e)
            ]
        | stmt (CASEstmt (e, cs)) = align
            [seq [str "case", space, exp e, space, str "of"], cases cs]
      and pat (VECpat s) = seq [str "0b", str s]
        | pat (CONpat s) = con s
        | pat (INTpat i) = str (IntInf.toString i)
        | pat WILDpat = str "_"
      and casee (p, ss) =
         align
            [seq [pat p, space, str ":"],
             indent 3 (stmts ss)]
      and cases cs =
         case cs of [] => str "<empty>" | cs =>
            indent 3 (alignPrefix (map casee cs, "| "))
      and field (f, e) = seq [fld f, space, str "=", space, exp e]
      and def (intro, body) =
         align [seq [intro, space, str "="], indent 3 body]
      fun decls ds = align (map decl ds)
      fun imp { decls = ds } = decls ds
      val pretty = Pretty.pretty o imp
      val spec = Spec.PP.spec imp
   end
end
