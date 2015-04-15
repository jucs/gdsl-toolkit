val revision/traverse f insn = 
   case insn of
      ADDIUPC x: f "ADDIUPC" (BINOP_LR x)
    | ALIGN x: f "ALIGN" (QUADOP_LRRR x)
    | ALUIPC x: f "ALUIPC" (BINOP_LR x)
    | AUI x: f "AUI" (TERNOP_LRR x)
    | AUIPC x: f "AUIPC" (BINOP_LR x)
    | BALC x: f "BALC" (UNOP_R x)
    | BC x: f "BC" (UNOP_R x)
    | BC1EQZ x: f "BC1EQZ" (BINOP_RR x)
    | BC1NEZ x: f "BC1NEZ" (BINOP_RR x)
    | BC2EQZ x: f "BC2EQZ" (BINOP_RR x)
    | BC2NEZ x: f "BC2NEZ" (BINOP_RR x)
    | BLEZALC x: f "BLEZALC" (BINOP_RR x)
    | BGEZALC x: f "BGEZALC" (BINOP_RR x)
    | BGTZALC x: f "BGTZALC" (BINOP_RR x)
    | BLTZALC x: f "BLTZALC" (BINOP_RR x)
    | BEQZALC x: f "BEQZALC" (BINOP_RR x)
    | BNEZALC x: f "BNEZALC" (BINOP_RR x)
    | BLEZC x: f "BLEZC" (BINOP_RR x)
    | BGEZC x: f "BGEZC" (BINOP_RR x)
    | BGEC x: f "BGEC" (TERNOP_RRR x)
    | BGTZC x: f "BGTZC" (BINOP_RR x)
    | BLTZC x: f "BLTZC" (BINOP_RR x)
    | BLTC x: f "BLTC" (TERNOP_RRR x)
    | BGEUC x: f "BGEUC" (TERNOP_RRR x)
    | BLTUC x: f "BLTUC" (TERNOP_RRR x)
    | BEQC x: f "BEQC" (TERNOP_RRR x)
    | BNEC x: f "BNEC" (TERNOP_RRR x)
    | BEQZC x: f "BEQZC" (BINOP_RR x)
    | BNEZC x: f "BNEZC" (BINOP_RR x)
    | BITSWAP x: f "BITSWAP" (BINOP_LR x)
    | BOVC x: f "BOVC" (TERNOP_RRR x)
    | BNVC x: f "BNVC" (TERNOP_RRR x)
    | CLASS-fmt x: f "CLASS" (BINOP_FLR x)
    | CMP-condn-fmt x: f "CMP" (TERNOP_CFLRR x)
    | DIV x: f "DIV" (TERNOP_LRR x)
    | MOD x: f "MOD" (TERNOP_LRR x)
    | DIVU x: f "DIVU" (TERNOP_LRR x)
    | MODU x: f "MODU" (TERNOP_LRR x)
    | DVP x: f "DVP" (UNOP_L x)
    | EVP x: f "EVP" (UNOP_L x)
    | JIALC x: f "JIALC" (BINOP_RR x)
    | JIC x: f "JIC" (BINOP_RR x)
    | LSA x: f "LSA" (QUADOP_LRRR x)
    | MADDF-fmt x: f "MADDF" (TERNOP_FLRR x)
    | MSUBF-fmt x: f "MSUBF" (TERNOP_FLRR x)
    | MAX-fmt x: f "MAX" (TERNOP_FLRR x)
    | MAXA-fmt x: f "MAXA" (TERNOP_FLRR x)
    | MIN-fmt x: f "MIN" (TERNOP_FLRR x)
    | MINA-fmt x: f "MINA" (TERNOP_FLRR x)
    | MUL x: f "MUL" (TERNOP_LRR x)
    | MUH x: f "MUH" (TERNOP_LRR x)
    | MULU x: f "MULU" (TERNOP_LRR x)
    | MUHU x: f "MUHU" (TERNOP_LRR x)
    | NAL: f "NAL" (NULLOP)
    | RINT-fmt x: f "RINT" (BINOP_FLR x)
    | SEL-fmt x: f "SEL" (TERNOP_FLRR x)
    | SELEQZ x: f "SELEQZ" (TERNOP_LRR x)
    | SELNEZ x: f "SELNEZ" (TERNOP_LRR x)
    | SELEQZ-fmt x: f "SELEQZ" (TERNOP_FLRR x)
    | SELNEQZ-fmt x: f "SELNEQZ" (TERNOP_FLRR x)
    | SIGRIE x: f "SIGRIE" (UNOP_R x)
   end
