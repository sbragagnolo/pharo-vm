as yet unclassified
prepareVMMaker
	| maker |
	maker := super prepareVMMaker.
	self halt.
	maker options: #(
		ObjectMemory Spur32BitCoMemoryManager
		FailImbalancedPrimitives false
		CogCompilerClass CogInLineLiteralsARMCompiler
		ISA ARMv5).
	^ maker