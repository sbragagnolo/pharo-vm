primitive generators
genSmallFloatArithmetic: arithmeticOperator preOpCheck: preOpCheckOrNil
	"Stack looks like
		receiver (also in ResultReceiverReg)
		arg
		return address"
	<var: #preOpCheckOrNil declareC: 'AbstractInstruction *(*preOpCheckOrNil)(int rcvrReg, int argReg)'>
	| jumpFailClass jumpFailAlloc jumpFailCheck jumpImmediate jumpNonInt doOp fail |
	<var: #jumpFailClass type: #'AbstractInstruction *'>
	<var: #jumpFailAlloc type: #'AbstractInstruction *'>
	<var: #jumpNonInt type: #'AbstractInstruction *'>
	<var: #jumpImmediate type: #'AbstractInstruction *'>
	<var: #jumpFailCheck type: #'AbstractInstruction *'>
	<var: #doOp type: #'AbstractInstruction *'>
	<var: #fail type: #'AbstractInstruction *'>
	self genLoadArgAtDepth: 0 into: ClassReg.
	objectRepresentation genGetSmallFloatValueOf: ReceiverResultReg scratch: SendNumArgsReg into: DPFPReg0.
	jumpImmediate := objectRepresentation genJumpImmediate: ClassReg.
	objectRepresentation genGetCompactClassIndexNonImmOf: ClassReg into: SendNumArgsReg.
	objectRepresentation genCmpClassFloatCompactIndexR: SendNumArgsReg.
	jumpFailClass := self JumpNonZero: 0.
	objectRepresentation genGetDoubleValueOf: ClassReg into: DPFPReg1.
	doOp := self Label.
	preOpCheckOrNil ifNotNil:
		[jumpFailCheck := self perform: preOpCheckOrNil with: DPFPReg0 with: DPFPReg1].
	self gen: arithmeticOperator operand: DPFPReg1 operand: DPFPReg0.
	jumpFailAlloc := objectRepresentation
					genAllocFloatValue: DPFPReg0
					into: SendNumArgsReg
					scratchReg: ClassReg
					scratchReg: TempReg.
	self MoveR: SendNumArgsReg R: ReceiverResultReg.
	self RetN: (self primRetNOffsetFor: 1).
	jumpImmediate jmpTarget: self Label.
	objectRepresentation maybeGenConvertIfSmallFloatIn: Arg0Reg scratchReg: TempReg into: DPFPReg1 andJumpTo: doOp.
	objectRepresentation smallIntegerIsOnlyImmediateType ifFalse:
		[jumpNonInt := objectRepresentation genJumpNotSmallInteger: ClassReg scratchReg: TempReg].
	objectRepresentation genConvertSmallIntegerToIntegerInReg: ClassReg.
	self ConvertR: ClassReg Rd: DPFPReg1.
	self Jump: doOp.
	jumpFailAlloc jmpTarget: self Label.
	self compileFallbackToInterpreterPrimitive: 0.
	fail := self Label.
	jumpFailClass jmpTarget: fail.
	preOpCheckOrNil ifNotNil:
		[jumpFailCheck jmpTarget: fail].
	objectRepresentation smallIntegerIsOnlyImmediateType ifFalse:
		[jumpNonInt jmpTarget: fail].
	^0