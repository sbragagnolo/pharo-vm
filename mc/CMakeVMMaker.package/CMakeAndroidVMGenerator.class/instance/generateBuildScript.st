building
generateBuildScript
	config write: '
	#/bin/sh
export NDK=$ANDROID_NDK_HOME
export SDK=$ANDROID_SDK_HOME
export NDK_PROJECT_PATH=', self buildDir pathString, '
export ROOTSOURCE=$NDK_PROJECT_PATH
export PATH=$PATH:$SDK/tools:$NDK
cd ..
./scripts/extract-commit-info.sh
cd build
android update project -p . -t ', config androidVersion ,' 
ndk-build NDK_DEBUG=0'
	
	 toFile: 'build.sh'.
	
	config write: '
		#/bin/sh
export NDK=$ANDROID_NDK_HOME
export SDK=$ANDROID_SDK_HOME
export NDK_PROJECT_PATH=', self buildDir pathString, '
export ROOTSOURCE=$NDK_PROJECT_PATH
export PATH=$PATH:$SDK/tools:$NDK	
ant clean debug -verbose
'
	
	 toFile: 'package.sh'
	
.config write: '
	#/bin/sh
export NDK=$ANDROID_NDK_HOME
export SDK=$ANDROID_SDK_HOME
export NDK_PROJECT_PATH=', self buildDir pathString, '
export ROOTSOURCE=$NDK_PROJECT_PATH
export PATH=$PATH:$SDK/tools:$NDK
cd ..
./scripts/extract-commit-info.sh
cd build
android update project -p . -t ', config androidVersion ,' 
ndk-build NDK_DEBUG=0 clean'
	
	 toFile: 'clean.sh'.