as yet unclassified
commonCompilerFlags
	^ {
	'-DLSB_FIRST=1' . 
	'-DUSE_GLOBAL_STRUCT=0' .
	 '-DCOGMTVM=0' . 
	'-DSPURVM' . 
	'-DIMAGE_DIALECT_NAME="Spur32CogVM" '.
	'-DIMAGE_ENV_NAME="PHARO_IMAGE"' .
	'-DDEFAULT_IMAGE_NAME="Spur32CogVM.image"' . 
	'-DCOGVM=1' .
	'-DPharoVM'}