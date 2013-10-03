# This file maps syntactic registers to semantic registers used in RREIL.

# define functions that generate EFLAGS variables
val fCF = return (_var Sem_FLAGS _offset 0)
val fPF = return (_var Sem_FLAGS _offset 2)
val fAF = return (_var Sem_FLAGS _offset 4)
val fZF = return (_var Sem_FLAGS _offset 6)
val fSF = return (_var Sem_FLAGS _offset 7)
val fDF = return (_var Sem_FLAGS _offset 10)
val fOF = return (_var Sem_FLAGS _offset 11)

#val fEQ = return (_var VIRT_EQ)
#val fNEQ = return (_var VIRT_NEQ)
val fLES = return (_var VIRT_LES)
val fLEU = return (_var VIRT_LEU)
val fLTS = return (_var VIRT_LTS)
#val fLTU = return (_var VIRT_LTU)

val rflags = do
  flags <- return {id=Sem_FLAGS,offset=0,size=64};

  #Set missing bits according to manual
  mov 1 (at-offset flags 1) (imm 1);
  mov 1 (at-offset flags 3) (imm 0);
  mov 1 (at-offset flags 5) (imm 0);

  return flags
end

type sem_id
   = Sem_IP
   | Sem_FLAGS
   | Sem_MXCSR
   | Sem_A
   | Sem_B
   | Sem_C
   | Sem_D
   | Sem_SI
   | Sem_DI
   | Sem_SP
   | Sem_BP
   | Sem_R8
   | Sem_R9
   | Sem_R10
   | Sem_R11
   | Sem_R12
   | Sem_R13
   | Sem_R14
   | Sem_R15
   | Sem_CS_Base    # the segment registers represent their entry in the segment table
   | Sem_DS_Base
   | Sem_SS_Base
   | Sem_ES_Base
   | Sem_FS_Base
   | Sem_GS_Base
   | Sem_CS
   | Sem_DS
   | Sem_SS
   | Sem_ES
   | Sem_FS
   | Sem_GS
   | Sem_ST0
   | Sem_ST1
   | Sem_ST2
   | Sem_ST3
   | Sem_ST4
   | Sem_ST5
   | Sem_ST6
   | Sem_ST7
   | Sem_MM0
   | Sem_MM1
   | Sem_MM2
   | Sem_MM3
   | Sem_MM4
   | Sem_MM5
   | Sem_MM6
   | Sem_MM7
   | Sem_MM8
   | Sem_XMM0
   | Sem_XMM1
   | Sem_XMM2
   | Sem_XMM3
   | Sem_XMM4
   | Sem_XMM5
   | Sem_XMM6
   | Sem_XMM7
   | Sem_XMM8
   | Sem_XMM9
   | Sem_XMM10
   | Sem_XMM11
   | Sem_XMM12
   | Sem_XMM13
   | Sem_XMM14
   | Sem_XMM15
#   | VIRT_EQ  # ==
#   | VIRT_NEQ # /=
   | VIRT_LES # <=s
   | VIRT_LEU # <=u
   | VIRT_LTS # <s
#   | VIRT_LTU # <u

val semantic-register-of r = semantic-register-of-mr '0' r

val semantic-register-of-mr is-mem r = case r of
   AL    : {id=Sem_A,offset=0,size=8}
 | AH    : {id=Sem_A,offset=8,size=8}
 | AX    : {id=Sem_A,offset=0,size=16}
 | EAX   : {id=Sem_A,offset=0,size=32}
 | RAX   : {id=Sem_A,offset=0,size=64}
 | BL    : {id=Sem_B,offset=0,size=8}
 | BH    : {id=Sem_B,offset=8,size=8}
 | BX    : {id=Sem_B,offset=0,size=16}
 | EBX   : {id=Sem_B,offset=0,size=32}
 | RBX   : {id=Sem_B,offset=0,size=64}
 | CL    : {id=Sem_C,offset=0,size=8}
 | CH    : {id=Sem_C,offset=8,size=8}
 | CX    : {id=Sem_C,offset=0,size=16}
 | ECX   : {id=Sem_C,offset=0,size=32}
 | RCX   : {id=Sem_C,offset=0,size=64}
 | DL    : {id=Sem_D,offset=0,size=8}
 | DH    : {id=Sem_D,offset=8,size=8}
 | DX    : {id=Sem_D,offset=0,size=16}
 | EDX   : {id=Sem_D,offset=0,size=32}
 | RDX   : {id=Sem_D,offset=0,size=64}
 | R8L   : {id=Sem_R8,offset=0,size=8}
 | R8W   : {id=Sem_R8,offset=0,size=16}
 | R8D   : {id=Sem_R8,offset=0,size=32}
 | R8    : {id=Sem_R8,offset=0,size=64}
 | R9L   : {id=Sem_R9,offset=0,size=8}
 | R9W   : {id=Sem_R9,offset=0,size=16}
 | R9D   : {id=Sem_R9,offset=0,size=32}
 | R9    : {id=Sem_R9,offset=0,size=64}
 | R10L  : {id=Sem_R10,offset=0,size=8}
 | R10W  : {id=Sem_R10,offset=0,size=16}
 | R10D  : {id=Sem_R10,offset=0,size=32}
 | R10   : {id=Sem_R10,offset=0,size=64}
 | R11L  : {id=Sem_R11,offset=0,size=8}
 | R11W  : {id=Sem_R11,offset=0,size=16}
 | R11D  : {id=Sem_R11,offset=0,size=32}
 | R11   : {id=Sem_R11,offset=0,size=64}
 | R12L  : {id=Sem_R12,offset=0,size=8}
 | R12W  : {id=Sem_R12,offset=0,size=16}
 | R12D  : {id=Sem_R12,offset=0,size=32}
 | R12   : {id=Sem_R12,offset=0,size=64}
 | R13L  : {id=Sem_R13,offset=0,size=8}
 | R13W  : {id=Sem_R13,offset=0,size=16}
 | R13D  : {id=Sem_R13,offset=0,size=32}
 | R13   : {id=Sem_R13,offset=0,size=64}
 | R14L  : {id=Sem_R14,offset=0,size=8}
 | R14W  : {id=Sem_R14,offset=0,size=16}
 | R14D  : {id=Sem_R14,offset=0,size=32}
 | R14   : {id=Sem_R14,offset=0,size=64}
 | R15L  : {id=Sem_R15,offset=0,size=8}
 | R15W  : {id=Sem_R15,offset=0,size=16}
 | R15D  : {id=Sem_R15,offset=0,size=32}
 | R15   : {id=Sem_R15,offset=0,size=64}
 | SPL   : {id=Sem_SP, offset=0,size=8}
 | SP    : {id=Sem_SP, offset=0,size=16}
 | ESP   : {id=Sem_SP, offset=0,size=32}
 | RSP   : {id=Sem_SP, offset=0,size=64}
 | BPL   : {id=Sem_BP, offset=0,size=8}
 | BP    : {id=Sem_BP, offset=0,size=16}
 | EBP   : {id=Sem_BP, offset=0,size=32}
 | RBP   : {id=Sem_BP, offset=0,size=64}
 | SIL   : {id=Sem_SI, offset=0,size=8}
 | SI    : {id=Sem_SI, offset=0,size=16}
 | ESI   : {id=Sem_SI, offset=0,size=32}
 | RSI   : {id=Sem_SI, offset=0,size=64}
 | DIL   : {id=Sem_DI, offset=0,size=8}
 | DI    : {id=Sem_DI, offset=0,size=16}
 | EDI   : {id=Sem_DI, offset=0,size=32}
 | RDI   : {id=Sem_DI, offset=0,size=64}
 | XMM0  : {id=Sem_XMM0, offset=0,size=128}
 | XMM1  : {id=Sem_XMM1, offset=0,size=128}
 | XMM2  : {id=Sem_XMM2, offset=0,size=128}
 | XMM3  : {id=Sem_XMM3, offset=0,size=128}
 | XMM4  : {id=Sem_XMM4, offset=0,size=128}
 | XMM5  : {id=Sem_XMM5, offset=0,size=128}
 | XMM6  : {id=Sem_XMM6, offset=0,size=128}
 | XMM7  : {id=Sem_XMM7, offset=0,size=128}
 | XMM8  : {id=Sem_XMM8, offset=0,size=128}
 | XMM9  : {id=Sem_XMM9, offset=0,size=128}
 | XMM10 : {id=Sem_XMM10, offset=0,size=128}
 | XMM11 : {id=Sem_XMM11, offset=0,size=128}
 | XMM12 : {id=Sem_XMM12, offset=0,size=128}
 | XMM13 : {id=Sem_XMM13, offset=0,size=128}
 | XMM14 : {id=Sem_XMM14, offset=0,size=128}
 | XMM15 : {id=Sem_XMM15, offset=0,size=128}
 | YMM0  : {id=Sem_XMM0, offset=0,size=256}
 | YMM1  : {id=Sem_XMM1, offset=0,size=256}
 | YMM2  : {id=Sem_XMM2, offset=0,size=256}
 | YMM3  : {id=Sem_XMM3, offset=0,size=256}
 | YMM4  : {id=Sem_XMM4, offset=0,size=256}
 | YMM5  : {id=Sem_XMM5, offset=0,size=256}
 | YMM6  : {id=Sem_XMM6, offset=0,size=256}
 | YMM7  : {id=Sem_XMM7, offset=0,size=256}
 | YMM8  : {id=Sem_XMM8, offset=0,size=256}
 | YMM9  : {id=Sem_XMM9, offset=0,size=256}
 | YMM10 : {id=Sem_XMM10, offset=0,size=256}
 | YMM11 : {id=Sem_XMM11, offset=0,size=256}
 | YMM12 : {id=Sem_XMM12, offset=0,size=256}
 | YMM13 : {id=Sem_XMM13, offset=0,size=256}
 | YMM14 : {id=Sem_XMM14, offset=0,size=256}
 | YMM15 : {id=Sem_XMM15, offset=0,size=256}
 | MM0   : {id=Sem_MM0, offset=0, size=64}
 | MM1   : {id=Sem_MM1, offset=0, size=64}
 | MM2   : {id=Sem_MM2, offset=0, size=64}
 | MM3   : {id=Sem_MM3, offset=0, size=64}
 | MM4   : {id=Sem_MM4, offset=0, size=64}
 | MM5   : {id=Sem_MM5, offset=0, size=64}
 | MM6   : {id=Sem_MM6, offset=0, size=64}
 | MM7   : {id=Sem_MM7, offset=0, size=64}
 | ES    : if is-mem then {id=Sem_ES_Base, offset=0, size=64} else {id=Sem_ES, offset=0, size=16} # content of segment table
 | SS    : if is-mem then {id=Sem_SS_Base, offset=0, size=64} else {id=Sem_SS, offset=0, size=16}
 | DS    : if is-mem then {id=Sem_DS_Base, offset=0, size=64} else {id=Sem_DS, offset=0, size=16}
 | FS    : if is-mem then {id=Sem_FS_Base, offset=0, size=64} else {id=Sem_FS, offset=0, size=16}
 | GS    : if is-mem then {id=Sem_GS_Base, offset=0, size=64} else {id=Sem_GS, offset=0, size=16}
 | CS    : if is-mem then {id=Sem_CS_Base, offset=0, size=64} else {id=Sem_CS, offset=0, size=16}
 | ST0   : {id=Sem_ST0, offset=0, size=80}
 | ST1   : {id=Sem_ST1, offset=0, size=80}
 | ST2   : {id=Sem_ST2, offset=0, size=80}
 | ST3   : {id=Sem_ST3, offset=0, size=80}
 | ST4   : {id=Sem_ST4, offset=0, size=80}
 | ST5   : {id=Sem_ST5, offset=0, size=80}
 | ST6   : {id=Sem_ST6, offset=0, size=80}
 | ST7   : {id=Sem_ST7, offset=0, size=80}
 | RIP   : {id=Sem_IP, offset=0, size=64}
 | FLAGS : {id=Sem_FLAGS,offset=0,size=64}
end

val semantic-register-of-offset r offset = let
  val q = semantic-register-of r
in
  {id=q.id,offset=offset,size=q.size}
end

val semantic-register-of-operand-with-size opnd size =
  case opnd of
     REG r: @{size=size} (semantic-register-of r)
  end

val semantic-register id offset size = {id=id,offset=offset,size=size}

val is-avx-sse id =
  case id of
     Sem_XMM0 : '1'
   | Sem_XMM1 : '1'
   | Sem_XMM2 : '1'
   | Sem_XMM3 : '1'
   | Sem_XMM4 : '1'
   | Sem_XMM5 : '1'
   | Sem_XMM6 : '1'
   | Sem_XMM7 : '1'
   | Sem_XMM8 : '1'
   | Sem_XMM9 : '1'
   | Sem_XMM10 : '1'
   | Sem_XMM11 : '1'
   | Sem_XMM12 : '1'
   | Sem_XMM13 : '1'
   | Sem_XMM14 : '1'
   | Sem_XMM15 : '1'
   | _: '0'
end

type register-without-size =
   A
 | B
 | C
 | D
 | SI_
 | DI_
 | BP_
 | SP_

val high reg =
  case reg of
     A: AH
   | B: BH
   | C: CH
   | D: DH
  end

val low reg =
  case reg of
     A: AL
   | B: BL
   | C: CL
   | D: DL
  end
 

val register-by-size modifier reg-unsized size =
  case reg-unsized of
     A:
       case size of
          8: modifier A
        | 16: AX
        | 32: EAX
        | 64: RAX
       end
   | B:
       case size of
          8: modifier B
        | 16: BX
        | 32: EBX
        | 64: RBX
       end
   | C:
       case size of
          8: modifier C
        | 16: CX
        | 32: ECX
        | 64: RCX
       end
   | D:
       case size of
          8: modifier D
        | 16: DX
        | 32: EDX
        | 64: RDX
       end
   | SI_:
       case size of
          16: SI
        | 32: ESI
        | 64: RSI
       end
   | DI_:
       case size of
          16: DI
        | 32: EDI
        | 64: RDI
       end
   | BP_:
       case size of
          16: BP
        | 32: EBP
        | 64: RBP
       end
   | SP_:
       case size of
          16: SP
        | 32: ESP
        | 64: RSP
       end
  end

val registers-live-map = let #Todo: Segment base addresses
	val add map r = do
	 reg-sem <- return (semantic-register-of r);
   return (fmap-add-range map reg-sem.id reg-sem.size reg-sem.offset)
	end
in do
  map <- return (fmap-empty {});

#  map <- add map AL;
#  map <- add map AH;
#  map <- add map AX;
#  map <- add map EAX;
  map <- add map RAX;
#  map <- add map BL;
#  map <- add map BH;
#  map <- add map BX;
#  map <- add map EBX;
  map <- add map RBX;
#  map <- add map CL;
#  map <- add map CH;
#  map <- add map CX;
#  map <- add map ECX;
  map <- add map RCX;
#  map <- add map DL;
#  map <- add map DH;
#  map <- add map DX;
#  map <- add map EDX;
  map <- add map RDX;
#  map <- add map R8B;
#  map <- add map R8L;
#  map <- add map R8D;
  map <- add map R8;
#  map <- add map R9B;
#  map <- add map R9L;
#  map <- add map R9D;
  map <- add map R9;
#  map <- add map R10B;
#  map <- add map R10L;
#  map <- add map R10D;
  map <- add map R10;
#  map <- add map R11B;
#  map <- add map R11L;
#  map <- add map R11D;
  map <- add map R11;
#  map <- add map R12B;
#  map <- add map R12L;
#  map <- add map R12D;
  map <- add map R12;
#  map <- add map R13B;
#  map <- add map R13L;
#  map <- add map R13D;
  map <- add map R13;
#  map <- add map R14B;
#  map <- add map R14L;
#  map <- add map R14D;
  map <- add map R14;
#  map <- add map R15B;
#  map <- add map R15L;
#  map <- add map R15D;
  map <- add map R15;
#  map <- add map SP;
#  map <- add map ESP;
  map <- add map RSP;
#  map <- add map BP;
#  map <- add map EBP;
  map <- add map RBP;
#  map <- add map SI;
#  map <- add map ESI;
  map <- add map RSI;
#  map <- add map DI;
#  map <- add map EDI;
  map <- add map RDI;
#  map <- add map XMM0;
#  map <- add map XMM1;
#  map <- add map XMM2;
#  map <- add map XMM3;
#  map <- add map XMM4;
#  map <- add map XMM5;
#  map <- add map XMM6;
#  map <- add map XMM7;
#  map <- add map XMM8;
#  map <- add map XMM9;
#  map <- add map XMM10;
#  map <- add map XMM11;
#  map <- add map XMM12;
#  map <- add map XMM13;
#  map <- add map XMM14;
#  map <- add map XMM15;
  map <- add map YMM0;
  map <- add map YMM1;
  map <- add map YMM2;
  map <- add map YMM3;
  map <- add map YMM4;
  map <- add map YMM5;
  map <- add map YMM6;
  map <- add map YMM7;
  map <- add map YMM8;
  map <- add map YMM9;
  map <- add map YMM10;
  map <- add map YMM11;
  map <- add map YMM12;
  map <- add map YMM13;
  map <- add map YMM14;
  map <- add map YMM15;
  map <- add map MM0;
  map <- add map MM1;
  map <- add map MM2;
  map <- add map MM3;
  map <- add map MM4;
  map <- add map MM5;
  map <- add map MM6;
  map <- add map MM7;
  map <- add map ES;
  map <- add map SS;
  map <- add map DS;
  map <- add map FS;
  map <- add map GS;
  map <- add map CS;
  map <- add map ST0;
  map <- add map ST1;
  map <- add map ST2;
  map <- add map ST3;
  map <- add map ST4;
  map <- add map ST5;
  map <- add map ST6;
  map <- add map ST7;
  map <- add map RIP;
  map <- add map FLAGS;

	return map
end end
