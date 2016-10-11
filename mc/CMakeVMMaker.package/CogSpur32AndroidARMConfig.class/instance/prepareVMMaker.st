as yet unclassified
prepareVMMaker
	| maker |
	maker := super prepareVMMaker.
	maker options: #(
		ObjectMemory Spur32BitCoMemoryManager
		CogCompilerClass CogOutOfLineLiteralsARMCompiler
		ISA ARMv5).
	^ maker