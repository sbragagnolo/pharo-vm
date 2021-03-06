bytecode generator support
genJumpIf: boolean to: targetBytecodePC
	"The heart of performance counting in Sista.  Conditional branches are 6 times less
	 frequent than sends and can provide basic block frequencies (send counters can't).
	 Each conditional has a 32-bit counter split into an upper 16 bits counting executions
	 and a lower half counting untaken executions of the branch.  Executing the branch
	 decrements the upper half, tripping if the count goes negative.  Not taking the branch
	 decrements the lower half.  N.B. We *do not* eliminate dead branches (true ifTrue:/true ifFalse:)
	 so that scanning for send and branch data is simplified and that branch data is correct."
	<inline: false>
	| ok counterAddress countTripped retry nextPC nextDescriptor |
	<var: #ok type: #'AbstractInstruction *'>
	<var: #retry type: #'AbstractInstruction *'>
	<var: #countTripped type: #'AbstractInstruction *'>
	<var: #nextDescriptor type: #'BytecodeDescriptor *'>

	(coInterpreter isOptimizedMethod: methodObj) ifTrue: [ ^ super genJumpIf: boolean to: targetBytecodePC ].
	
	branchReachedOnlyForCounterTrip ifTrue: 
		[ branchReachedOnlyForCounterTrip := false.
		^ self genCounterTripOnlyJumpIf: boolean to: targetBytecodePC ].
	
	boolean == objectMemory falseObject ifTrue:
		[ "detection of and: / or:"
		nextPC := bytecodePC + (self generatorAt: byte0) numBytes.
		nextDescriptor := self generatorAt: (objectMemory fetchByte: nextPC ofObject: methodObj) + bytecodeSetOffset.
		nextDescriptor generator ==  #genPushConstantTrueBytecode ifTrue: [ ^ super genJumpIf: boolean to: targetBytecodePC ].
		nextDescriptor := self generatorAt: (objectMemory fetchByte: targetBytecodePC ofObject: methodObj) + bytecodeSetOffset.
		nextDescriptor generator ==  #genPushConstantFalseBytecode ifTrue: [ ^ super genJumpIf: boolean to: targetBytecodePC ].  ].

	extA := 0.

	self ssFlushTo: simStackPtr - 1.
	self ssTop popToReg: TempReg.
	self ssPop: 1.

	"We need SendNumArgsReg because of the mustBeBooleanTrampoline"
	self ssAllocateRequiredReg: SendNumArgsReg.

	retry := self Label.
	self 
		genExecutionCountLogicInto: [ :cAddress :countTripBranch | 
			counterAddress := cAddress. 
			countTripped := countTripBranch ] 
		counterReg: SendNumArgsReg.
	counterIndex := counterIndex + 1.

	"Cunning trick by LPD.  If true and false are contiguous subtract the smaller.
	 Correct result is either 0 or the distance between them.  If result is not 0 or
	 their distance send mustBeBoolean."
	self assert: (objectMemory objectAfter: objectMemory falseObject) = objectMemory trueObject.
	self genSubConstant: boolean R: TempReg.
	self JumpZero: (self ensureFixupAt: targetBytecodePC - initialPC).

	self genFallsThroughCountLogicCounterReg: SendNumArgsReg counterAddress: counterAddress.

	self CmpCq: (boolean == objectMemory falseObject
					ifTrue: [objectMemory trueObject - objectMemory falseObject]
					ifFalse: [objectMemory falseObject - objectMemory trueObject])
		R: TempReg.
	ok := self JumpZero: 0.
	self MoveCq: 0 R: SendNumArgsReg. "if counterReg is 0 this is a mustBeBoolean, not a counter trip."
	
	countTripped jmpTarget:
		(self CallRT: (boolean == objectMemory falseObject
						ifTrue: [ceSendMustBeBooleanAddFalseTrampoline]
						ifFalse: [ceSendMustBeBooleanAddTrueTrampoline])).
						
	"If we're in an image which hasn't got the Sista code loaded then the ceCounterTripped:
	 trampoline will return directly to machine code, returning the boolean.  So the code should
	 jump back to the retry point. The trampoline makes sure that TempReg has been reloaded."
	self annotateBytecode: self Label.

	self Jump: retry.
	
	ok jmpTarget: self Label.
	^0