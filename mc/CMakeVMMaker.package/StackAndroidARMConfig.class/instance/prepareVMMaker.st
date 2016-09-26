as yet unclassified
prepareVMMaker
	| maker |
	maker := super prepareVMMaker.
	maker options: #(
		ObjectMemory Spur32BitMemoryManager
		FailImbalancedPrimitives false
		ISA ARM).
	^ maker