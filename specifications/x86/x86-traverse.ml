type uarity =
   UA0
 | UA1 of arity1
 | UA2 of arity2
 | UA3 of arity3
 | UA4 of arity4
 | UAF of flow1

val to-uarity va =
  case va of
     VA0: UA0
   | VA1 x: UA1 x
   | VA2 x: UA2 x
   | VA3 x: UA3 x
   | VA4 x: UA4 x
  end

val uarity-of insn = let
  val f a b = b
in
  traverse f insn
end

val traverse f insn = case insn of
   AAA: f "AAA" UA0
 | AAD a: f "AAD" (UA1 a)
 | AAM a: f "AAM" (UA1 a)
 | AAS: f "AAS" UA0
 | ADC a: f "ADC" (UA2 a)
 | ADD a: f "ADD" (UA2 a)
 | ADDPD a: f "ADDPD" (UA2 a)
 | ADDPS a: f "ADDPS" (UA2 a)
 | ADDSD a: f "ADDSD" (UA2 a)
 | ADDSS a: f "ADDSS" (UA2 a)
 | ADDSUBPD a: f "ADDSUBPD" (UA2 a)
 | ADDSUBPS a: f "ADDSUBPS" (UA2 a)
 | AESDEC a: f "AESDEC" (UA2 a)
 | AESDECLAST a: f "AESDECLAST" (UA2 a)
 | AESENC a: f "AESENC" (UA2 a)
 | AESENCLAST a: f "AESENCLAST" (UA2 a)
 | AESIMC a: f "AESIMC" (UA2 a)
 | AESKEYGENASSIST a: f "AESKEYGENASSIST" (UA3 a)
 | AND a: f "AND" (UA2 a)
 | ANDNPD a: f "ANDNPD" (UA2 a)
 | ANDNPS a: f "ANDNPS" (UA2 a)
 | ANDPD a: f "ANDPD" (UA2 a)
 | ANDPS a: f "ANDPS" (UA2 a)
 | ARPL a: f "ARPL" (UA2 a)
 | BLENDPD a: f "BLENDPD" (UA3 a)
 | BLENDPS a: f "BLENDPS" (UA3 a)
 | BLENDVPD a: f "BLENDVPD" (UA3 a)
 | BLENDVPS a: f "BLENDVPS" (UA3 a)
 | BOUND a: f "BOUND" (UA2 a)
 | BSF a: f "BSF" (UA2 a)
 | BSR a: f "BSR" (UA2 a)
 | BSWAP a: f "BSWAP" (UA1 a)
 | BT a: f "BT" (UA2 a)
 | BTC a: f "BTC" (UA2 a)
 | BTR a: f "BTR" (UA2 a)
 | BTS a: f "BTS" (UA2 a)
 | CALL a: f "CALL" (UAF a)
 | CBW: f "CBW" UA0
 | CDQ: f "CDQ" UA0
 | CDQE: f "CDQE" UA0
 | CLC: f "CLC" UA0
 | CLD: f "CLD" UA0
 | CLFLUSH a: f "CLFLUSH" (UA1 a)
 | CLI: f "CLI" UA0
 | CLTS: f "CLTS" UA0
 | CMC: f "CMC" UA0
 | CMOVA a: f "CMOVA" (UA2 a)
 | CMOVAE a: f "CMOVAE" (UA2 a)
 | CMOVB a: f "CMOVB" (UA2 a)
 | CMOVBE a: f "CMOVBE" (UA2 a)
 | CMOVC a: f "CMOVC" (UA2 a)
 | CMOVE a: f "CMOVE" (UA2 a)
 | CMOVG a: f "CMOVG" (UA2 a)
 | CMOVGE a: f "CMOVGE" (UA2 a)
 | CMOVL a: f "CMOVL" (UA2 a)
 | CMOVLE a: f "CMOVLE" (UA2 a)
 | CMOVNA a: f "CMOVNA" (UA2 a)
 | CMOVNAE a: f "CMOVNAE" (UA2 a)
 | CMOVNB a: f "CMOVNB" (UA2 a)
 | CMOVNBE a: f "CMOVNBE" (UA2 a)
 | CMOVNC a: f "CMOVNC" (UA2 a)
 | CMOVNE a: f "CMOVNE" (UA2 a)
 | CMOVNG a: f "CMOVNG" (UA2 a)
 | CMOVNGE a: f "CMOVNGE" (UA2 a)
 | CMOVNL a: f "CMOVNL" (UA2 a)
 | CMOVNLE a: f "CMOVNLE" (UA2 a)
 | CMOVNO a: f "CMOVNO" (UA2 a)
 | CMOVNP a: f "CMOVNP" (UA2 a)
 | CMOVNS a: f "CMOVNS" (UA2 a)
 | CMOVNZ a: f "CMOVNZ" (UA2 a)
 | CMOVO a: f "CMOVO" (UA2 a)
 | CMOVP a: f "CMOVP" (UA2 a)
 | CMOVPE a: f "CMOVPE" (UA2 a)
 | CMOVPO a: f "CMOVPO" (UA2 a)
 | CMOVS a: f "CMOVS" (UA2 a)
 | CMOVZ a: f "CMOVZ" (UA2 a)
 | CMP a: f "CMP" (UA2 a)
 | CMPPD a: f "CMPPD" (UA3 a)
 | CMPPS a: f "CMPPS" (UA3 a)
 | CMPS a: f "CMPS" (UA2 a)
 | CMPSD a: f "CMPSD" (UA3 a)
 | CMPSS a: f "CMPSS" (UA3 a)
 | CMPXCHG a: f "CMPXCHG" (UA2 a)
 | CMPXCHG16B a: f "CMPXCHG16B" (UA1 a)
 | CMPXCHG8B a: f "CMPXCHG8B" (UA1 a)
 | COMISD a: f "COMISD" (UA2 a)
 | COMISS a: f "COMISS" (UA2 a)
 | CPUID: f "CPUID" UA0
 | CQO: f "CQO" UA0
 | CRC32 a: f "CRC32" (UA2 a)
 | CVTDQ2PD a: f "CVTDQ2PD" (UA2 a)
 | CVTDQ2PS a: f "CVTDQ2PS" (UA2 a)
 | CVTPD2DQ a: f "CVTPD2DQ" (UA2 a)
 | CVTPD2PI a: f "CVTPD2PI" (UA2 a)
 | CVTPD2PS a: f "CVTPD2PS" (UA2 a)
 | CVTPI2PD a: f "CVTPI2PD" (UA2 a)
 | CVTPI2PS a: f "CVTPI2PS" (UA2 a)
 | CVTPS2DQ a: f "CVTPS2DQ" (UA2 a)
 | CVTPS2PD a: f "CVTPS2PD" (UA2 a)
 | CVTPS2PI a: f "CVTPS2PI" (UA2 a)
 | CVTSD2SI a: f "CVTSD2SI" (UA2 a)
 | CVTSD2SS a: f "CVTSD2SS" (UA2 a)
 | CVTSI2SD a: f "CVTSI2SD" (UA2 a)
 | CVTSI2SS a: f "CVTSI2SS" (UA2 a)
 | CVTSS2SD a: f "CVTSS2SD" (UA2 a)
 | CVTSS2SI a: f "CVTSS2SI" (UA2 a)
 | CVTTPD2DQ a: f "CVTTPD2DQ" (UA2 a)
 | CVTTPD2PI a: f "CVTTPD2PI" (UA2 a)
 | CVTTPS2DQ a: f "CVTTPS2DQ" (UA2 a)
 | CVTTPS2PI a: f "CVTTPS2PI" (UA2 a)
 | CVTTSD2SI a: f "CVTTSD2SI" (UA2 a)
 | CVTTSS2SI a: f "CVTTSS2SI" (UA2 a)
 | CWD: f "CWD" UA0
 | CWDE: f "CWDE" UA0
 | DAA: f "DAA" UA0
 | DAS: f "DAS" UA0
 | DEC a: f "DEC" (UA1 a)
 | DIV a: f "DIV" (UA1 a)
 | DIVPD a: f "DIVPD" (UA2 a)
 | DIVPS a: f "DIVPS" (UA2 a)
 | DIVSD a: f "DIVSD" (UA2 a)
 | DIVSS a: f "DIVSS" (UA2 a)
 | DPPD a: f "DPPD" (UA3 a)
 | DPPS a: f "DPPS" (UA3 a)
 | EMMS: f "EMMS" UA0
 | ENTER a: f "ENTER" (UA2 a)
 | EXTRACTPS a: f "EXTRACTPS" (UA3 a)
 | F2XM1: f "F2XM1" UA0
 | FABS: f "FABS" UA0
 | FADD a: f "FADD" (UA2 a)
 | FADDP a: f "FADDP" (UA2 a)
 | FBLD a: f "FBLD" (UA1 a)
 | FBSTP a: f "FBSTP" (UA1 a)
 | FCHS: f "FCHS" UA0
 | FCLEX: f "FCLEX" UA0
 | FCMOVB a: f "FCMOVB" (UA2 a)
 | FCMOVBE a: f "FCMOVBE" (UA2 a)
 | FCMOVE a: f "FCMOVE" (UA2 a)
 | FCMOVNB a: f "FCMOVNB" (UA2 a)
 | FCMOVNBE a: f "FCMOVNBE" (UA2 a)
 | FCMOVNE a: f "FCMOVNE" (UA2 a)
 | FCMOVNU a: f "FCMOVNU" (UA2 a)
 | FCMOVU a: f "FCMOVU" (UA2 a)
 | FCOM a: f "FCOM" (UA1 a)
 | FCOMI a: f "FCOMI" (UA2 a)
 | FCOMIP a: f "FCOMIP" (UA2 a)
 | FCOMP a: f "FCOMP" (UA1 a)
 | FCOMPP: f "FCOMPP" UA0
 | FCOS: f "FCOS" UA0
 | FDECSTP: f "FDECSTP" UA0
 | FDIV a: f "FDIV" (UA2 a)
 | FDIVP a: f "FDIVP" (UA2 a)
 | FDIVR a: f "FDIVR" (UA2 a)
 | FDIVRP a: f "FDIVRP" (UA2 a)
 | FFREE a: f "FFREE" (UA1 a)
 | FIADD a: f "FIADD" (UA1 a)
 | FICOM a: f "FICOM" (UA1 a)
 | FICOMP a: f "FICOMP" (UA1 a)
 | FIDIV a: f "FIDIV" (UA2 a)
 | FIDIVR a: f "FIDIVR" (UA1 a)
 | FILD a: f "FILD" (UA1 a)
 | FIMUL a: f "FIMUL" (UA1 a)
 | FINCSTP: f "FINCSTP" UA0
 | FINIT: f "FINIT" UA0
 | FIST a: f "FIST" (UA1 a)
 | FISTP a: f "FISTP" (UA1 a)
 | FISTTP a: f "FISTTP" (UA1 a)
 | FISUB a: f "FISUB" (UA1 a)
 | FISUBR a: f "FISUBR" (UA1 a)
 | FLD a: f "FLD" (UA1 a)
 | FLD1: f "FLD1" UA0
 | FLDCW a: f "FLDCW" (UA1 a)
 | FLDENV a: f "FLDENV" (UA1 a)
 | FLDL2E: f "FLDL2E" UA0
 | FLDL2T: f "FLDL2T" UA0
 | FLDLG2: f "FLDLG2" UA0
 | FLDLN2: f "FLDLN2" UA0
 | FLDPI: f "FLDPI" UA0
 | FLDZ: f "FLDZ" UA0
 | FMUL a: f "FMUL" (UA2 a)
 | FMULP a: f "FMULP" (UA2 a)
 | FNCLEX: f "FNCLEX" UA0
 | FNINIT: f "FNINIT" UA0
 | FNOP: f "FNOP" UA0
 | FNSAVE a: f "FNSAVE" (UA1 a)
 | FNSTCW a: f "FNSTCW" (UA1 a)
 | FNSTENV a: f "FNSTENV" (UA1 a)
 | FNSTSW a: f "FNSTSW" (UA1 a)
 | FPATAN: f "FPATAN" UA0
 | FPREM: f "FPREM" UA0
 | FPREM1: f "FPREM1" UA0
 | FPTAN: f "FPTAN" UA0
 | FRNDINT: f "FRNDINT" UA0
 | FRSTOR a: f "FRSTOR" (UA1 a)
 | FSAVE a: f "FSAVE" (UA1 a)
 | FSCALE: f "FSCALE" UA0
 | FSIN: f "FSIN" UA0
 | FSINCOS: f "FSINCOS" UA0
 | FSQRT: f "FSQRT" UA0
 | FST a: f "FST" (UA1 a)
 | FSTCW a: f "FSTCW" (UA1 a)
 | FSTENV a: f "FSTENV" (UA1 a)
 | FSTP a: f "FSTP" (UA1 a)
 | FSTSW a: f "FSTSW" (UA1 a)
 | FSUB a: f "FSUB" (UA2 a)
 | FSUBP a: f "FSUBP" (UA2 a)
 | FSUBR a: f "FSUBR" (UA2 a)
 | FSUBRP a: f "FSUBRP" (UA2 a)
 | FTST: f "FTST" UA0
 | FUCOM a: f "FUCOM" (UA1 a)
 | FUCOMI a: f "FUCOMI" (UA1 a)
 | FUCOMIP a: f "FUCOMIP" (UA1 a)
 | FUCOMP a: f "FUCOMP" (UA1 a)
 | FUCOMPP: f "FUCOMPP" UA0
 | FXAM: f "FXAM" UA0
 | FXCH a: f "FXCH" (UA1 a)
 | FXRSTOR a: f "FXRSTOR" (UA1 a)
 | FXRSTOR64 a: f "FXRSTOR64" (UA1 a)
 | FXSAVE a: f "FXSAVE" (UA1 a)
 | FXSAVE64 a: f "FXSAVE64" (UA1 a)
 | FXTRACT: f "FXTRACT" UA0
 | FYL2X: f "FYL2X" UA0
 | FYL2XP1: f "FYL2XP1" UA0
 | HADDPD a: f "HADDPD" (UA2 a)
 | HADDPS a: f "HADDPS" (UA2 a)
 | HLT: f "HLT" UA0
 | HSUBPD a: f "HSUBPD" (UA2 a)
 | HSUBPS a: f "HSUBPS" (UA2 a)
 | IDIV a: f "IDIV" (UA1 a)
 | IMUL a: f "IMUL" (to-uarity a)
 | IN a: f "IN" (UA2 a)
 | INC a: f "INC" (UA1 a)
 | INSB: f "INSB" UA0
 | INSD: f "INSD" UA0
 | INSERTPS a: f "INSERTPS" (UA3 a)
 | INSW: f "INSW" UA0
 | INT a: f "INT" (UA1 a)
 | INT0: f "INT0" UA0
 | INT3: f "INT3" UA0
 | INVD: f "INVD" UA0
 | INVLPG a: f "INVLPG" (UA1 a)
 | INVPCID a: f "INVPCID" (UA2 a)
 | IRET: f "IRET" UA0
 | IRETD: f "IRETD" UA0
 | IRETQ: f "IRETQ" UA0
 | JA a: f "JA" (UAF a)
 | JAE a: f "JAE" (UAF a)
 | JB a: f "JB" (UAF a)
 | JBE a: f "JBE" (UAF a)
 | JC a: f "JC" (UAF a)
 | JCXZ a: f "JCXZ" (UAF a)
 | JE a: f "JE" (UAF a)
 | JECXZ a: f "JECXZ" (UAF a)
 | JG a: f "JG" (UAF a)
 | JGE a: f "JGE" (UAF a)
 | JL a: f "JL" (UAF a)
 | JLE a: f "JLE" (UAF a)
 | JMP a: f "JMP" (UAF a)
 | JNA a: f "JNA" (UAF a)
 | JNAE a: f "JNAE" (UAF a)
 | JNB a: f "JNB" (UAF a)
 | JNBE a: f "JNBE" (UAF a)
 | JNC a: f "JNC" (UAF a)
 | JNE a: f "JNE" (UAF a)
 | JNG a: f "JNG" (UAF a)
 | JNGE a: f "JNGE" (UAF a)
 | JNL a: f "JNL" (UAF a)
 | JNLE a: f "JNLE" (UAF a)
 | JNO a: f "JNO" (UAF a)
 | JNP a: f "JNP" (UAF a)
 | JNS a: f "JNS" (UAF a)
 | JNZ a: f "JNZ" (UAF a)
 | JO a: f "JO" (UAF a)
 | JP a: f "JP" (UAF a)
 | JPE a: f "JPE" (UAF a)
 | JPO a: f "JPO" (UAF a)
 | JRCXZ a: f "JRCXZ" (UAF a)
 | JS a: f "JS" (UAF a)
 | JZ a: f "JZ" (UAF a)
 | LAHF: f "LAHF" UA0
 | LAR a: f "LAR" (UA2 a)
 | LDDQU a: f "LDDQU" (UA2 a)
 | LDMXCSR a: f "LDMXCSR" (UA1 a)
 | LDS a: f "LDS" (UA2 a)
 | LEA a: f "LEA" (UA2 a)
 | LEAVE: f "LEAVE" UA0
 | LES a: f "LES" (UA2 a)
 | LFENCE: f "LFENCE" UA0
 | LFS a: f "LFS" (UA2 a)
 | LGDT a: f "LGDT" (UA1 a)
 | LGS a: f "LGS" (UA2 a)
 | LIDT a: f "LIDT" (UA1 a)
 | LLDT a: f "LLDT" (UA1 a)
 | LMSW a: f "LMSW" (UA1 a)
 | LODS a: f "LODS" (UA1 a)
 | LOOP a: f "LOOP" (UAF a)
 | LOOPE a: f "LOOPE" (UAF a)
 | LOOPNE a: f "LOOPNE" (UAF a)
 | LSL a: f "LSL" (UA2 a)
 | LSS a: f "LSS" (UA2 a)
 | LTR a: f "LTR" (UA1 a)
 | MASKMOVDQU a: f "MASKMOVDQU" (UA3 a)
 | MASKMOVQ a: f "MASKMOVQ" (UA3 a)
 | MAXPD a: f "MAXPD" (UA2 a)
 | MAXPS a: f "MAXPS" (UA2 a)
 | MAXSD a: f "MAXSD" (UA2 a)
 | MAXSS a: f "MAXSS" (UA2 a)
 | MFENCE: f "MFENCE" UA0
 | MINPD a: f "MINPD" (UA2 a)
 | MINPS a: f "MINPS" (UA2 a)
 | MINSD a: f "MINSD" (UA2 a)
 | MINSS a: f "MINSS" (UA2 a)
 | MONITOR: f "MONITOR" UA0
 | MOV a: f "MOV" (UA2 a)
 | MOVAPD a: f "MOVAPD" (UA2 a)
 | MOVAPS a: f "MOVAPS" (UA2 a)
 | MOVBE a: f "MOVBE" (UA2 a)
 | MOVD a: f "MOVD" (UA2 a)
 | MOVDDUP a: f "MOVDDUP" (UA2 a)
 | MOVDQ2Q a: f "MOVDQ2Q" (UA2 a)
 | MOVDQA a: f "MOVDQA" (UA2 a)
 | MOVDQU a: f "MOVDQU" (UA2 a)
 | MOVHLPS a: f "MOVHLPS" (UA2 a)
 | MOVHPD a: f "MOVHPD" (UA2 a)
 | MOVHPS a: f "MOVHPS" (UA2 a)
 | MOVLHPS a: f "MOVLHPS" (UA2 a)
 | MOVLPD a: f "MOVLPD" (UA2 a)
 | MOVLPS a: f "MOVLPS" (UA2 a)
 | MOVMSKPD a: f "MOVMSKPD" (UA2 a)
 | MOVMSKPS a: f "MOVMSKPS" (UA2 a)
 | MOVNTDQ a: f "MOVNTDQ" (UA2 a)
 | MOVNTDQA a: f "MOVNTDQA" (UA2 a)
 | MOVNTI a: f "MOVNTI" (UA2 a)
 | MOVNTPD a: f "MOVNTPD" (UA2 a)
 | MOVNTPS a: f "MOVNTPS" (UA2 a)
 | MOVNTQ a: f "MOVNTQ" (UA2 a)
 | MOVQ a: f "MOVQ" (UA2 a)
 | MOVQ2DQ a: f "MOVQ2DQ" (UA2 a)
 | MOVS a: f "MOVS" (UA2 a)
 | MOVSD a: f "MOVSD" (UA2 a)
 | MOVSHDUP a: f "MOVSHDUP" (UA2 a)
 | MOVSLDUP a: f "MOVSLDUP" (UA2 a)
 | MOVSS a: f "MOVSS" (UA2 a)
 | MOVSW a: f "MOVSW" (UA2 a)
 | MOVSX a: f "MOVSX" (UA2 a)
 | MOVSXD a: f "MOVSXD" (UA2 a)
 | MOVUPD a: f "MOVUPD" (UA2 a)
 | MOVUPS a: f "MOVUPS" (UA2 a)
 | MOVZX a: f "MOVZX" (UA2 a)
 | MPSADBW a: f "MPSADBW" (UA3 a)
 | MUL a: f "MUL" (UA1 a)
 | MULPD a: f "MULPD" (UA2 a)
 | MULPS a: f "MULPS" (UA2 a)
 | MULSD a: f "MULSD" (UA2 a)
 | MULSS a: f "MULSS" (UA2 a)
 | MWAIT: f "MWAIT" UA0
 | NEG a: f "NEG" (UA1 a)
 | NOP a: f "NOP" (to-uarity a)
 | NOT a: f "NOT" (UA1 a)
 | OR a: f "OR" (UA2 a)
 | ORPD a: f "ORPD" (UA2 a)
 | ORPS a: f "ORPS" (UA2 a)
 | OUT a: f "OUT" (UA2 a)
 | OUTS: f "OUTS" UA0
 | OUTSB: f "OUTSB" UA0
 | OUTSD: f "OUTSD" UA0
 | OUTSW: f "OUTSW" UA0
 | PABSB a: f "PABSB" (UA2 a)
 | PABSD a: f "PABSD" (UA2 a)
 | PABSW a: f "PABSW" (UA2 a)
 | PACKSSDW a: f "PACKSSDW" (UA2 a)
 | PACKSSWB a: f "PACKSSWB" (UA2 a)
 | PACKUSDW a: f "PACKUSDW" (UA2 a)
 | PACKUSWB a: f "PACKUSWB" (UA2 a)
 | PADDB a: f "PADDB" (UA2 a)
 | PADDD a: f "PADDD" (UA2 a)
 | PADDQ a: f "PADDQ" (UA2 a)
 | PADDSB a: f "PADDSB" (UA2 a)
 | PADDSW a: f "PADDSW" (UA2 a)
 | PADDUSB a: f "PADDUSB" (UA2 a)
 | PADDUSW a: f "PADDUSW" (UA2 a)
 | PADDW a: f "PADDW" (UA2 a)
 | PALIGNR a: f "PALIGNR" (UA3 a)
 | PAND a: f "PAND" (UA2 a)
 | PANDN a: f "PANDN" (UA2 a)
 | PAUSE: f "PAUSE" UA0
 | PAVGB a: f "PAVGB" (UA2 a)
 | PAVGW a: f "PAVGW" (UA2 a)
 | PBLENDVB a: f "PBLENDVB" (UA2 a)
 | PBLENDW a: f "PBLENDW" (UA3 a)
 | PCLMULQDQ a: f "PCLMULQDQ" (UA3 a)
 | PCMPEQB a: f "PCMPEQB" (UA2 a)
 | PCMPEQD a: f "PCMPEQD" (UA2 a)
 | PCMPEQQ a: f "PCMPEQQ" (UA2 a)
 | PCMPEQW a: f "PCMPEQW" (UA2 a)
 | PCMPESTRI a: f "PCMPESTRI" (UA3 a)
 | PCMPESTRM a: f "PCMPESTRM" (UA3 a)
 | PCMPGRD a: f "PCMPGRD" (UA2 a)
 | PCMPGTB a: f "PCMPGTB" (UA2 a)
 | PCMPGTD a: f "PCMPGTD" (UA2 a)
 | PCMPGTQ a: f "PCMPGTQ" (UA2 a)
 | PCMPGTW a: f "PCMPGTW" (UA2 a)
 | PCMPISTRI a: f "PCMPISTRI" (UA3 a)
 | PCMPISTRM a: f "PCMPISTRM" (UA3 a)
 | PEXTRB a: f "PEXTRB" (UA3 a)
 | PEXTRD a: f "PEXTRD" (UA3 a)
 | PEXTRQ a: f "PEXTRQ" (UA3 a)
 | PEXTRW a: f "PEXTRW" (UA3 a)
 | PHADDD a: f "PHADDD" (UA2 a)
 | PHADDSW a: f "PHADDSW" (UA2 a)
 | PHADDW a: f "PHADDW" (UA2 a)
 | PHMINPOSUW a: f "PHMINPOSUW" (UA2 a)
 | PHSUBD a: f "PHSUBD" (UA2 a)
 | PHSUBSW a: f "PHSUBSW" (UA2 a)
 | PHSUBW a: f "PHSUBW" (UA2 a)
 | PINSRB a: f "PINSRB" (UA3 a)
 | PINSRD a: f "PINSRD" (UA3 a)
 | PINSRQ a: f "PINSRQ" (UA3 a)
 | PINSRW a: f "PINSRW" (UA3 a)
 | PMADDUBSW a: f "PMADDUBSW" (UA2 a)
 | PMADDWD a: f "PMADDWD" (UA2 a)
 | PMAXSB a: f "PMAXSB" (UA2 a)
 | PMAXSD a: f "PMAXSD" (UA2 a)
 | PMAXSW a: f "PMAXSW" (UA2 a)
 | PMAXUB a: f "PMAXUB" (UA2 a)
 | PMAXUD a: f "PMAXUD" (UA2 a)
 | PMAXUW a: f "PMAXUW" (UA2 a)
 | PMINSB a: f "PMINSB" (UA2 a)
 | PMINSD a: f "PMINSD" (UA2 a)
 | PMINSW a: f "PMINSW" (UA2 a)
 | PMINUB a: f "PMINUB" (UA2 a)
 | PMINUD a: f "PMINUD" (UA2 a)
 | PMINUW a: f "PMINUW" (UA2 a)
 | PMOVMSKB a: f "PMOVMSKB" (UA2 a)
 | PMOVSXBD a: f "PMOVSXBD" (UA2 a)
 | PMOVSXBQ a: f "PMOVSXBQ" (UA2 a)
 | PMOVSXBW a: f "PMOVSXBW" (UA2 a)
 | PMOVSXDQ a: f "PMOVSXDQ" (UA2 a)
 | PMOVSXWD a: f "PMOVSXWD" (UA2 a)
 | PMOVSXWQ a: f "PMOVSXWQ" (UA2 a)
 | PMOVZXBD a: f "PMOVZXBD" (UA2 a)
 | PMOVZXBQ a: f "PMOVZXBQ" (UA2 a)
 | PMOVZXBW a: f "PMOVZXBW" (UA2 a)
 | PMOVZXDQ a: f "PMOVZXDQ" (UA2 a)
 | PMOVZXWD a: f "PMOVZXWD" (UA2 a)
 | PMOVZXWQ a: f "PMOVZXWQ" (UA2 a)
 | PMULDQ a: f "PMULDQ" (UA2 a)
 | PMULHRSW a: f "PMULHRSW" (UA2 a)
 | PMULHUW a: f "PMULHUW" (UA2 a)
 | PMULHW a: f "PMULHW" (UA2 a)
 | PMULLD a: f "PMULLD" (UA2 a)
 | PMULLW a: f "PMULLW" (UA2 a)
 | PMULUDQ a: f "PMULUDQ" (UA2 a)
 | POP a: f "POP" (UA1 a)
 | POPA: f "POPA" UA0
 | POPAD: f "POPAD" UA0
 | POPCNT a: f "POPCNT" (UA2 a)
 | POPF: f "POPF" UA0
 | POPFD: f "POPFD" UA0
 | POPFQ: f "POPFQ" UA0
 | POR a: f "POR" (UA2 a)
 | PREFETCHNTA a: f "PREFETCHNTA" (UA1 a)
 | PREFETCHT0 a: f "PREFETCHT0" (UA1 a)
 | PREFETCHT1 a: f "PREFETCHT1" (UA1 a)
 | PREFETCHT2 a: f "PREFETCHT2" (UA1 a)
 | PREFETCHW a: f "PREFETCHW" (UA1 a)
 | PSADBW a: f "PSADBW" (UA2 a)
 | PSHUFB a: f "PSHUFB" (UA2 a)
 | PSHUFD a: f "PSHUFD" (UA3 a)
 | PSHUFHW a: f "PSHUFHW" (UA3 a)
 | PSHUFLW a: f "PSHUFLW" (UA3 a)
 | PSHUFW a: f "PSHUFW" (UA3 a)
 | PSIGNB a: f "PSIGNB" (UA2 a)
 | PSIGND a: f "PSIGND" (UA2 a)
 | PSIGNW a: f "PSIGNW" (UA2 a)
 | PSLLD a: f "PSLLD" (UA2 a)
 | PSLLDQ a: f "PSLLDQ" (UA2 a)
 | PSLLQ a: f "PSLLQ" (UA2 a)
 | PSLLW a: f "PSLLW" (UA2 a)
 | PSRAD a: f "PSRAD" (UA2 a)
 | PSRAW a: f "PSRAW" (UA2 a)
 | PSRLD a: f "PSRLD" (UA2 a)
 | PSRLDQ a: f "PSRLDQ" (UA2 a)
 | PSRLQ a: f "PSRLQ" (UA2 a)
 | PSRLW a: f "PSRLW" (UA2 a)
 | PSUBB a: f "PSUBB" (UA2 a)
 | PSUBD a: f "PSUBD" (UA2 a)
 | PSUBQ a: f "PSUBQ" (UA2 a)
 | PSUBSB a: f "PSUBSB" (UA2 a)
 | PSUBSW a: f "PSUBSW" (UA2 a)
 | PSUBUSB a: f "PSUBUSB" (UA2 a)
 | PSUBUSW a: f "PSUBUSW" (UA2 a)
 | PSUBW a: f "PSUBW" (UA2 a)
 | PTEST a: f "PTEST" (UA2 a)
 | PUNPCKHBW a: f "PUNPCKHBW" (UA2 a)
 | PUNPCKHDQ a: f "PUNPCKHDQ" (UA2 a)
 | PUNPCKHQDQ a: f "PUNPCKHQDQ" (UA2 a)
 | PUNPCKHWD a: f "PUNPCKHWD" (UA2 a)
 | PUNPCKLBW a: f "PUNPCKLBW" (UA2 a)
 | PUNPCKLDQ a: f "PUNPCKLDQ" (UA2 a)
 | PUNPCKLQDQ a: f "PUNPCKLQDQ" (UA2 a)
 | PUNPCKLWD a: f "PUNPCKLWD" (UA2 a)
 | PUSH a: f "PUSH" (UA1 a)
 | PUSHA: f "PUSHA" UA0
 | PUSHAD: f "PUSHAD" UA0
 | PUSHF: f "PUSHF" UA0
 | PUSHFD: f "PUSHFD" UA0
 | PUSHFQ: f "PUSHFQ" UA0
 | PXOR a: f "PXOR" (UA2 a)
 | RCL a: f "RCL" (UA2 a)
 | RCPPS a: f "RCPPS" (UA2 a)
 | RCPSS a: f "RCPSS" (UA2 a)
 | RCR a: f "RCR" (UA2 a)
 | RDFSBASE a: f "RDFSBASE" (UA1 a)
 | RDGSBASE a: f "RDGSBASE" (UA1 a)
 | RDMSR: f "RDMSR" UA0
 | RDPMC: f "RDPMC" UA0
 | RDRAND a: f "RDRAND" (UA1 a)
 | RDTSC: f "RDTSC" UA0
 | RDTSCP: f "RDTSCP" UA0
 | RET a: f "RET" (to-uarity a)
 | RET_FAR a: f "RET_FAR" (to-uarity a)
 | ROL a: f "ROL" (UA2 a)
 | ROR a: f "ROR" (UA2 a)
 | ROUNDPD a: f "ROUNDPD" (UA3 a)
 | ROUNDPS a: f "ROUNDPS" (UA3 a)
 | ROUNDSD a: f "ROUNDSD" (UA3 a)
 | ROUNDSS a: f "ROUNDSS" (UA3 a)
 | RSM: f "RSM" UA0
 | RSQRTPS a: f "RSQRTPS" (UA2 a)
 | RSQRTSS a: f "RSQRTSS" (UA2 a)
 | SAHF: f "SAHF" UA0
 | SAL a: f "SAL" (UA2 a)
 | SAR a: f "SAR" (UA2 a)
 | SBB a: f "SBB" (UA2 a)
 | SCASB: f "SCASB" UA0
 | SCASD: f "SCASD" UA0
 | SCASQ: f "SCASQ" UA0
 | SCASW: f "SCASW" UA0
 | SETA a: f "SETA" (UA1 a)
 | SETAE a: f "SETAE" (UA1 a)
 | SETB a: f "SETB" (UA1 a)
 | SETBE a: f "SETBE" (UA1 a)
 | SETC a: f "SETC" (UA1 a)
 | SETE a: f "SETE" (UA1 a)
 | SETG a: f "SETG" (UA1 a)
 | SETGE a: f "SETGE" (UA1 a)
 | SETL a: f "SETL" (UA1 a)
 | SETLE a: f "SETLE" (UA1 a)
 | SETNA a: f "SETNA" (UA1 a)
 | SETNAE a: f "SETNAE" (UA1 a)
 | SETNB a: f "SETNB" (UA1 a)
 | SETNBE a: f "SETNBE" (UA1 a)
 | SETNC a: f "SETNC" (UA1 a)
 | SETNE a: f "SETNE" (UA1 a)
 | SETNG a: f "SETNG" (UA1 a)
 | SETNGE a: f "SETNGE" (UA1 a)
 | SETNL a: f "SETNL" (UA1 a)
 | SETNLE a: f "SETNLE" (UA1 a)
 | SETNO a: f "SETNO" (UA1 a)
 | SETNP a: f "SETNP" (UA1 a)
 | SETNS a: f "SETNS" (UA1 a)
 | SETNZ a: f "SETNZ" (UA1 a)
 | SETO a: f "SETO" (UA1 a)
 | SETP a: f "SETP" (UA1 a)
 | SETPE a: f "SETPE" (UA1 a)
 | SETPO a: f "SETPO" (UA1 a)
 | SETS a: f "SETS" (UA1 a)
 | SETZ a: f "SETZ" (UA1 a)
 | SFENCE: f "SFENCE" UA0
 | SGDT a: f "SGDT" (UA1 a)
 | SHL a: f "SHL" (UA2 a)
 | SHLD a: f "SHLD" (UA3 a)
 | SHR a: f "SHR" (UA2 a)
 | SHRD a: f "SHRD" (UA3 a)
 | SHUFPD a: f "SHUFPD" (UA3 a)
 | SHUFPS a: f "SHUFPS" (UA3 a)
 | SIDT a: f "SIDT" (UA1 a)
 | SLDT a: f "SLDT" (UA1 a)
 | SMSW a: f "SMSW" (UA1 a)
 | SQRTPD a: f "SQRTPD" (UA2 a)
 | SQRTPS a: f "SQRTPS" (UA2 a)
 | SQRTSD a: f "SQRTSD" (UA2 a)
 | SQRTSS a: f "SQRTSS" (UA2 a)
 | STC: f "STC" UA0
 | STD: f "STD" UA0
 | STI: f "STI" UA0
 | STMXCSR a: f "STMXCSR" (UA1 a)
 | STOSB: f "STOSB" UA0
 | STOSD: f "STOSD" UA0
 | STOSQ: f "STOSQ" UA0
 | STOSW: f "STOSW" UA0
 | STR a: f "STR" (UA1 a)
 | SUB a: f "SUB" (UA2 a)
 | SUBPD a: f "SUBPD" (UA2 a)
 | SUBPS a: f "SUBPS" (UA2 a)
 | SUBSD a: f "SUBSD" (UA2 a)
 | SUBSS a: f "SUBSS" (UA2 a)
 | SWAPGS: f "SWAPGS" UA0
 | SYSCALL: f "SYSCALL" UA0
 | SYSENTER: f "SYSENTER" UA0
 | SYSEXIT: f "SYSEXIT" UA0
 | SYSRET: f "SYSRET" UA0
 | TEST a: f "TEST" (UA2 a)
 | UCOMISD a: f "UCOMISD" (UA2 a)
 | UCOMISS a: f "UCOMISS" (UA2 a)
 | UD2: f "UD2" UA0
 | UNPCKHPD a: f "UNPCKHPD" (UA2 a)
 | UNPCKHPS a: f "UNPCKHPS" (UA2 a)
 | UNPCKLPD a: f "UNPCKLPD" (UA2 a)
 | UNPCKLPS a: f "UNPCKLPS" (UA2 a)
 | VADDPD a: f "VADDPD" (to-uarity a)
 | VADDPS a: f "VADDPS" (to-uarity a)
 | VADDSD a: f "VADDSD" (to-uarity a)
 | VADDSS a: f "VADDSS" (to-uarity a)
 | VADDSUBPD a: f "VADDSUBPD" (to-uarity a)
 | VADDSUBPS a: f "VADDSUBPS" (to-uarity a)
 | VAESDEC a: f "VAESDEC" (to-uarity a)
 | VAESDECLAST a: f "VAESDECLAST" (to-uarity a)
 | VAESENC a: f "VAESENC" (to-uarity a)
 | VAESENCLAST a: f "VAESENCLAST" (to-uarity a)
 | VAESIMC a: f "VAESIMC" (to-uarity a)
 | VAESKEYGENASSIST a: f "VAESKEYGENASSIST" (to-uarity a)
 | VANDNPD a: f "VANDNPD" (to-uarity a)
 | VANDNPS a: f "VANDNPS" (to-uarity a)
 | VANDPD a: f "VANDPD" (to-uarity a)
 | VANDPS a: f "VANDPS" (to-uarity a)
 | VBLENDPD a: f "VBLENDPD" (to-uarity a)
 | VBLENDPS a: f "VBLENDPS" (to-uarity a)
 | VBLENDVPD a: f "VBLENDVPD" (to-uarity a)
 | VBLENDVPS a: f "VBLENDVPS" (to-uarity a)
 | VBROADCASTF128 a: f "VBROADCASTF128" (to-uarity a)
 | VBROADCASTSD a: f "VBROADCASTSD" (to-uarity a)
 | VBROADCASTSS a: f "VBROADCASTSS" (to-uarity a)
 | VCMPPD a: f "VCMPPD" (to-uarity a)
 | VCMPPS a: f "VCMPPS" (to-uarity a)
 | VCMPSD a: f "VCMPSD" (to-uarity a)
 | VCMPSS a: f "VCMPSS" (to-uarity a)
 | VCOMISD a: f "VCOMISD" (to-uarity a)
 | VCOMISS a: f "VCOMISS" (to-uarity a)
 | VCVTDQ2PD a: f "VCVTDQ2PD" (to-uarity a)
 | VCVTDQ2PS a: f "VCVTDQ2PS" (to-uarity a)
 | VCVTPD2DQ a: f "VCVTPD2DQ" (to-uarity a)
 | VCVTPD2PS a: f "VCVTPD2PS" (to-uarity a)
 | VCVTPH2PS a: f "VCVTPH2PS" (to-uarity a)
 | VCVTPS2DQ a: f "VCVTPS2DQ" (to-uarity a)
 | VCVTPS2PD a: f "VCVTPS2PD" (to-uarity a)
 | VCVTPS2PH a: f "VCVTPS2PH" (to-uarity a)
 | VCVTSD2SI a: f "VCVTSD2SI" (to-uarity a)
 | VCVTSD2SS a: f "VCVTSD2SS" (to-uarity a)
 | VCVTSI2SD a: f "VCVTSI2SD" (to-uarity a)
 | VCVTSI2SS a: f "VCVTSI2SS" (to-uarity a)
 | VCVTSS2SD a: f "VCVTSS2SD" (to-uarity a)
 | VCVTSS2SI a: f "VCVTSS2SI" (to-uarity a)
 | VCVTTPD2DQ a: f "VCVTTPD2DQ" (to-uarity a)
 | VCVTTPS2DQ a: f "VCVTTPS2DQ" (to-uarity a)
 | VCVTTSD2SI a: f "VCVTTSD2SI" (to-uarity a)
 | VCVTTSS2SI a: f "VCVTTSS2SI" (to-uarity a)
 | VDIVPD a: f "VDIVPD" (to-uarity a)
 | VDIVPS a: f "VDIVPS" (to-uarity a)
 | VDIVSD a: f "VDIVSD" (to-uarity a)
 | VDIVSS a: f "VDIVSS" (to-uarity a)
 | VDPPD a: f "VDPPD" (to-uarity a)
 | VDPPS a: f "VDPPS" (to-uarity a)
 | VERR a: f "VERR" (UA1 a)
 | VERW a: f "VERW" (UA1 a)
 | VEXTRACTF128 a: f "VEXTRACTF128" (to-uarity a)
 | VEXTRACTPS a: f "VEXTRACTPS" (to-uarity a)
 | VHADDPD a: f "VHADDPD" (to-uarity a)
 | VHADDPS a: f "VHADDPS" (to-uarity a)
 | VHSUBPD a: f "VHSUBPD" (to-uarity a)
 | VHSUBPS a: f "VHSUBPS" (to-uarity a)
 | VINSERTF128 a: f "VINSERTF128" (to-uarity a)
 | VINSERTPS a: f "VINSERTPS" (to-uarity a)
 | VLDDQU a: f "VLDDQU" (to-uarity a)
 | VLDMXCSR a: f "VLDMXCSR" (to-uarity a)
 | VMASKMOVDQU a: f "VMASKMOVDQU" (to-uarity a)
 | VMASKMOVPD a: f "VMASKMOVPD" (to-uarity a)
 | VMASKMOVPS a: f "VMASKMOVPS" (to-uarity a)
 | VMAXPD a: f "VMAXPD" (to-uarity a)
 | VMAXPS a: f "VMAXPS" (to-uarity a)
 | VMAXSD a: f "VMAXSD" (to-uarity a)
 | VMAXSS a: f "VMAXSS" (to-uarity a)
 | VMINPD a: f "VMINPD" (to-uarity a)
 | VMINPS a: f "VMINPS" (to-uarity a)
 | VMINSD a: f "VMINSD" (to-uarity a)
 | VMINSS a: f "VMINSS" (to-uarity a)
 | VMOVAPD a: f "VMOVAPD" (to-uarity a)
 | VMOVAPS a: f "VMOVAPS" (to-uarity a)
 | VMOVD a: f "VMOVD" (to-uarity a)
 | VMOVDDUP a: f "VMOVDDUP" (to-uarity a)
 | VMOVDQA a: f "VMOVDQA" (to-uarity a)
 | VMOVDQU a: f "VMOVDQU" (to-uarity a)
 | VMOVHLPS a: f "VMOVHLPS" (to-uarity a)
 | VMOVHPD a: f "VMOVHPD" (to-uarity a)
 | VMOVHPS a: f "VMOVHPS" (to-uarity a)
 | VMOVLHPS a: f "VMOVLHPS" (to-uarity a)
 | VMOVLPD a: f "VMOVLPD" (to-uarity a)
 | VMOVLPS a: f "VMOVLPS" (to-uarity a)
 | VMOVMSKPD a: f "VMOVMSKPD" (to-uarity a)
 | VMOVMSKPS a: f "VMOVMSKPS" (to-uarity a)
 | VMOVNTDQ a: f "VMOVNTDQ" (to-uarity a)
 | VMOVNTDQA a: f "VMOVNTDQA" (to-uarity a)
 | VMOVNTPD a: f "VMOVNTPD" (to-uarity a)
 | VMOVNTPS a: f "VMOVNTPS" (to-uarity a)
 | VMOVQ a: f "VMOVQ" (to-uarity a)
 | VMOVSD a: f "VMOVSD" (to-uarity a)
 | VMOVSHDUP a: f "VMOVSHDUP" (to-uarity a)
 | VMOVSLDUP a: f "VMOVSLDUP" (to-uarity a)
 | VMOVSS a: f "VMOVSS" (to-uarity a)
 | VMOVUPD a: f "VMOVUPD" (to-uarity a)
 | VMOVUPS a: f "VMOVUPS" (to-uarity a)
 | VMPSADBW a: f "VMPSADBW" (to-uarity a)
 | VMULPD a: f "VMULPD" (to-uarity a)
 | VMULPS a: f "VMULPS" (to-uarity a)
 | VMULSD a: f "VMULSD" (to-uarity a)
 | VMULSS a: f "VMULSS" (to-uarity a)
 | VORPD a: f "VORPD" (to-uarity a)
 | VORPS a: f "VORPS" (to-uarity a)
 | VPABSB a: f "VPABSB" (to-uarity a)
 | VPABSD a: f "VPABSD" (to-uarity a)
 | VPABSW a: f "VPABSW" (to-uarity a)
 | VPACKSSDW a: f "VPACKSSDW" (to-uarity a)
 | VPACKSSWB a: f "VPACKSSWB" (to-uarity a)
 | VPACKUSDW a: f "VPACKUSDW" (to-uarity a)
 | VPACKUSWB a: f "VPACKUSWB" (to-uarity a)
 | VPADDB a: f "VPADDB" (to-uarity a)
 | VPADDD a: f "VPADDD" (to-uarity a)
 | VPADDQ a: f "VPADDQ" (to-uarity a)
 | VPADDSB a: f "VPADDSB" (to-uarity a)
 | VPADDSW a: f "VPADDSW" (to-uarity a)
 | VPADDUSB a: f "VPADDUSB" (to-uarity a)
 | VPADDUSW a: f "VPADDUSW" (to-uarity a)
 | VPADDW a: f "VPADDW" (to-uarity a)
 | VPALIGNR a: f "VPALIGNR" (to-uarity a)
 | VPAND a: f "VPAND" (to-uarity a)
 | VPANDN a: f "VPANDN" (to-uarity a)
 | VPAVGB a: f "VPAVGB" (to-uarity a)
 | VPAVGW a: f "VPAVGW" (to-uarity a)
 | VPBLENDVB a: f "VPBLENDVB" (to-uarity a)
 | VPBLENDW a: f "VPBLENDW" (to-uarity a)
 | VPCLMULQDQ a: f "VPCLMULQDQ" (to-uarity a)
 | VPCMPEQB a: f "VPCMPEQB" (to-uarity a)
 | VPCMPEQD a: f "VPCMPEQD" (to-uarity a)
 | VPCMPEQQ a: f "VPCMPEQQ" (to-uarity a)
 | VPCMPEQW a: f "VPCMPEQW" (to-uarity a)
 | VPCMPESTRI a: f "VPCMPESTRI" (to-uarity a)
 | VPCMPESTRM a: f "VPCMPESTRM" (to-uarity a)
 | VPCMPGTB a: f "VPCMPGTB" (to-uarity a)
 | VPCMPGTD a: f "VPCMPGTD" (to-uarity a)
 | VPCMPGTQ a: f "VPCMPGTQ" (to-uarity a)
 | VPCMPGTW a: f "VPCMPGTW" (to-uarity a)
 | VPCMPISTRI a: f "VPCMPISTRI" (to-uarity a)
 | VPCMPISTRM a: f "VPCMPISTRM" (to-uarity a)
 | VPERM2F128 a: f "VPERM2F128" (to-uarity a)
 | VPERMILPD a: f "VPERMILPD" (to-uarity a)
 | VPERMILPS a: f "VPERMILPS" (to-uarity a)
 | VPEXTRB a: f "VPEXTRB" (to-uarity a)
 | VPEXTRD a: f "VPEXTRD" (to-uarity a)
 | VPEXTRQ a: f "VPEXTRQ" (to-uarity a)
 | VPEXTRW a: f "VPEXTRW" (to-uarity a)
 | VPHADDD a: f "VPHADDD" (to-uarity a)
 | VPHADDSW a: f "VPHADDSW" (to-uarity a)
 | VPHADDW a: f "VPHADDW" (to-uarity a)
 | VPHMINPOSUW a: f "VPHMINPOSUW" (to-uarity a)
 | VPHSUBD a: f "VPHSUBD" (to-uarity a)
 | VPHSUBSW a: f "VPHSUBSW" (to-uarity a)
 | VPHSUBW a: f "VPHSUBW" (to-uarity a)
 | VPINSRB a: f "VPINSRB" (to-uarity a)
 | VPINSRD a: f "VPINSRD" (to-uarity a)
 | VPINSRQ a: f "VPINSRQ" (to-uarity a)
 | VPINSRW a: f "VPINSRW" (to-uarity a)
 | VPMADDUBSW a: f "VPMADDUBSW" (to-uarity a)
 | VPMADDWD a: f "VPMADDWD" (to-uarity a)
 | VPMAXSB a: f "VPMAXSB" (to-uarity a)
 | VPMAXSD a: f "VPMAXSD" (to-uarity a)
 | VPMAXSW a: f "VPMAXSW" (to-uarity a)
 | VPMAXUB a: f "VPMAXUB" (to-uarity a)
 | VPMAXUD a: f "VPMAXUD" (to-uarity a)
 | VPMAXUW a: f "VPMAXUW" (to-uarity a)
 | VPMINSB a: f "VPMINSB" (to-uarity a)
 | VPMINSD a: f "VPMINSD" (to-uarity a)
 | VPMINSW a: f "VPMINSW" (to-uarity a)
 | VPMINUB a: f "VPMINUB" (to-uarity a)
 | VPMINUD a: f "VPMINUD" (to-uarity a)
 | VPMINUW a: f "VPMINUW" (to-uarity a)
 | VPMOVMSKB a: f "VPMOVMSKB" (to-uarity a)
 | VPMOVSXBD a: f "VPMOVSXBD" (to-uarity a)
 | VPMOVSXBQ a: f "VPMOVSXBQ" (to-uarity a)
 | VPMOVSXBW a: f "VPMOVSXBW" (to-uarity a)
 | VPMOVSXDQ a: f "VPMOVSXDQ" (to-uarity a)
 | VPMOVSXWD a: f "VPMOVSXWD" (to-uarity a)
 | VPMOVSXWQ a: f "VPMOVSXWQ" (to-uarity a)
 | VPMOVZXBD a: f "VPMOVZXBD" (to-uarity a)
 | VPMOVZXBQ a: f "VPMOVZXBQ" (to-uarity a)
 | VPMOVZXBW a: f "VPMOVZXBW" (to-uarity a)
 | VPMOVZXDQ a: f "VPMOVZXDQ" (to-uarity a)
 | VPMOVZXWD a: f "VPMOVZXWD" (to-uarity a)
 | VPMOVZXWQ a: f "VPMOVZXWQ" (to-uarity a)
 | VPMULDQ a: f "VPMULDQ" (to-uarity a)
 | VPMULHRSW a: f "VPMULHRSW" (to-uarity a)
 | VPMULHUW a: f "VPMULHUW" (to-uarity a)
 | VPMULHW a: f "VPMULHW" (to-uarity a)
 | VPMULLD a: f "VPMULLD" (to-uarity a)
 | VPMULLW a: f "VPMULLW" (to-uarity a)
 | VPMULUDQ a: f "VPMULUDQ" (to-uarity a)
 | VPOR a: f "VPOR" (to-uarity a)
 | VPSADBW a: f "VPSADBW" (to-uarity a)
 | VPSHUFB a: f "VPSHUFB" (to-uarity a)
 | VPSHUFD a: f "VPSHUFD" (to-uarity a)
 | VPSHUFHW a: f "VPSHUFHW" (to-uarity a)
 | VPSHUFLW a: f "VPSHUFLW" (to-uarity a)
 | VPSIGNB a: f "VPSIGNB" (to-uarity a)
 | VPSIGND a: f "VPSIGND" (to-uarity a)
 | VPSIGNW a: f "VPSIGNW" (to-uarity a)
 | VPSLLD a: f "VPSLLD" (to-uarity a)
 | VPSLLDQ a: f "VPSLLDQ" (to-uarity a)
 | VPSLLQ a: f "VPSLLQ" (to-uarity a)
 | VPSLLW a: f "VPSLLW" (to-uarity a)
 | VPSRAD a: f "VPSRAD" (to-uarity a)
 | VPSRAW a: f "VPSRAW" (to-uarity a)
 | VPSRLD a: f "VPSRLD" (to-uarity a)
 | VPSRLDQ a: f "VPSRLDQ" (to-uarity a)
 | VPSRLQ a: f "VPSRLQ" (to-uarity a)
 | VPSRLW a: f "VPSRLW" (to-uarity a)
 | VPSUBB a: f "VPSUBB" (to-uarity a)
 | VPSUBD a: f "VPSUBD" (to-uarity a)
 | VPSUBQ a: f "VPSUBQ" (to-uarity a)
 | VPSUBSB a: f "VPSUBSB" (to-uarity a)
 | VPSUBSW a: f "VPSUBSW" (to-uarity a)
 | VPSUBUSB a: f "VPSUBUSB" (to-uarity a)
 | VPSUBUSW a: f "VPSUBUSW" (to-uarity a)
 | VPSUBW a: f "VPSUBW" (to-uarity a)
 | VPTEST a: f "VPTEST" (to-uarity a)
 | VPUNPCKHBW a: f "VPUNPCKHBW" (to-uarity a)
 | VPUNPCKHDQ a: f "VPUNPCKHDQ" (to-uarity a)
 | VPUNPCKHQDQ a: f "VPUNPCKHQDQ" (to-uarity a)
 | VPUNPCKHWD a: f "VPUNPCKHWD" (to-uarity a)
 | VPUNPCKLBW a: f "VPUNPCKLBW" (to-uarity a)
 | VPUNPCKLDQ a: f "VPUNPCKLDQ" (to-uarity a)
 | VPUNPCKLQDQ a: f "VPUNPCKLQDQ" (to-uarity a)
 | VPUNPCKLWD a: f "VPUNPCKLWD" (to-uarity a)
 | VPXOR a: f "VPXOR" (to-uarity a)
 | VRCPPS a: f "VRCPPS" (to-uarity a)
 | VRCPSS a: f "VRCPSS" (to-uarity a)
 | VROUNDPD a: f "VROUNDPD" (to-uarity a)
 | VROUNDPS a: f "VROUNDPS" (to-uarity a)
 | VROUNDSD a: f "VROUNDSD" (to-uarity a)
 | VROUNDSS a: f "VROUNDSS" (to-uarity a)
 | VRSQRTPS a: f "VRSQRTPS" (to-uarity a)
 | VRSQRTSS a: f "VRSQRTSS" (to-uarity a)
 | VSHUFPD a: f "VSHUFPD" (to-uarity a)
 | VSHUFPS a: f "VSHUFPS" (to-uarity a)
 | VSQRTPD a: f "VSQRTPD" (to-uarity a)
 | VSQRTPS a: f "VSQRTPS" (to-uarity a)
 | VSQRTSD a: f "VSQRTSD" (to-uarity a)
 | VSQRTSS a: f "VSQRTSS" (to-uarity a)
 | VSTMXCSR a: f "VSTMXCSR" (to-uarity a)
 | VSUBPD a: f "VSUBPD" (to-uarity a)
 | VSUBPS a: f "VSUBPS" (to-uarity a)
 | VSUBSD a: f "VSUBSD" (to-uarity a)
 | VSUBSS a: f "VSUBSS" (to-uarity a)
 | VTESTPD a: f "VTESTPD" (to-uarity a)
 | VTESTPS a: f "VTESTPS" (to-uarity a)
 | VUCOMISD a: f "VUCOMISD" (to-uarity a)
 | VUCOMISS a: f "VUCOMISS" (to-uarity a)
 | VUNPCKHPD a: f "VUNPCKHPD" (to-uarity a)
 | VUNPCKHPS a: f "VUNPCKHPS" (to-uarity a)
 | VUNPCKLPD a: f "VUNPCKLPD" (to-uarity a)
 | VUNPCKLPS a: f "VUNPCKLPS" (to-uarity a)
 | VXORPD a: f "VXORPD" (to-uarity a)
 | VXORPS a: f "VXORPS" (to-uarity a)
 | VZEROALL a: f "VZEROALL" (to-uarity a)
 | VZEROUPPER a: f "VZEROUPPER" (to-uarity a)
 | WAIT: f "WAIT" UA0
 | WBINVD: f "WBINVD" UA0
 | WRFSBASE a: f "WRFSBASE" (UA1 a)
 | WRGSBASE a: f "WRGSBASE" (UA1 a)
 | WRMSR: f "WRMSR" UA0
 | XADD a: f "XADD" (UA2 a)
 | XCHG a: f "XCHG" (UA2 a)
 | XGETBV: f "XGETBV" UA0
 | XLATB: f "XLATB" UA0
 | XOR a: f "XOR" (UA2 a)
 | XORPD a: f "XORPD" (UA2 a)
 | XORPS a: f "XORPS" (UA2 a)
 | XRSTOR a: f "XRSTOR" (UA1 a)
 | XRSTOR64 a: f "XRSTOR64" (UA1 a)
 | XSAVE a: f "XSAVE" (UA1 a)
 | XSAVE64 a: f "XSAVE64" (UA1 a)
 | XSAVEOPT a: f "XSAVEOPT" (UA1 a)
 | XSAVEOPT64 a: f "XSAVEOPT64" (UA1 a)
 | XSETBV: f "XSETBV" UA0
end
#:'<,'>s/| \(\S*\)\(.*\): \(.*\)/| \1\2: f "\1" (\3)/g
