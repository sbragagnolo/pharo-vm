bootstrap methods
withExecutableInterpreter: sim do: aBlock
	"With the oldInterpreter ready to execute code, evaluate aBlock,
	 then return the interpreter (and the heap) to the ``just snapshotted'' state."
	| savedpc initialContext finalContext |
	sim
		initStackPages;
		loadInitialContext;
		internalizeIPandSP.
	initialContext := sim frameContext: sim localFP.
	savedpc := sim localIP.
	sim objectMemory hasSpurMemoryManagerAPI ifFalse:
		[sim objectMemory pushRemappableOop: initialContext].
	"sim printHeadFrame."
	aBlock value.
	"sim printHeadFrame."
	sim
		internalPush: sim localIP;
		externalizeIPandSP.
	"now undo the execution state"
	finalContext := sim voidVMStateForSnapshotFlushingExternalPrimitivesIf: false.
	sim objectMemory hasSpurMemoryManagerAPI ifFalse:
		[initialContext := sim objectMemory popRemappableOop].
	self assert: initialContext = finalContext.
	self assert: sim localIP = savedpc.
	sim objectMemory
		storePointer: SuspendedContextIndex
		ofObject: sim activeProcess
		withValue: finalContext