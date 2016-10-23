#!/usr/local/bin/scale

	| ndkURL sdkURL destination packageVerifierInstaller |

	" General variables "
	ndkURL := 'http://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip'.
	sdkURL := 'http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz'.
	
	" Functions "
	
	
	" It checks if the global exists. if the package is installed and allows to download it "
	packageVerifierInstaller := [ :package :url :extractFolderName :donwloader |
	((system environment: package) isEmptyOrNil or: [ (system environment: package) asFileReference exists not ]) ifTrue: [
		destination := system uimanager request: package asString , ' address or #download' initialAnswer: #download title: package.
		destination = #download ifTrue: [
			destination := system uimanager request: 'Download destination (folder)' initialAnswer: (system pwd / package) fullName title: package.
			destination asFileReference ensureCreateDirectory.
		 	donwloader value: url value: destination.
			destination := destination ,'/' , extractFolderName.
		].
		(system home / #'.bashrc') writeStream setToEnd 
			<< 'export '<< package asString << '=' << destination ; lf; flush; close.
		destination
	 ] ifFalse: [ system environment:  package ] .
	].
	" Program "
	
	packageVerifierInstaller
		 	value: #ANDROID_NDK_HOME 
			value: ndkURL 
			value: 'android-ndk-r10e' 
			value: (system messageSend:#wget:andUnzip:).
			
	destination := packageVerifierInstaller 
			value: #ANDROID_SDK_HOME 
			value: sdkURL 
			value: 'android-sdk-linux' 
			value: (system messageSend:#wget:andUntargz:).
	
	system call: destination, '/tools/android'.
 	
	
	
	
	
	
	
	
	
	
	
	
