as yet unclassified
prepareVMMaker
	| maker |
	maker := super prepareVMMaker.
	maker options: #(
		ObjectMemory Spur32BitMemoryManager
		FailImbalancedPrimitives false
		CogCompilerClass CogInLineLiteralsARMCompiler
		ISA ARMv5).
	^ maker