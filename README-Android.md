Build Status 
============
  [![Build Status](https://travis-ci.org/sbragagnolo/pharo-vm.svg?branch=spur64)](https://travis-ci.org/sbragagnolo/pharo-vm)

REQUIREMENTS
============
 The building for android is only available from Linux systems 
 
 It requires an android-23 SDK
 It requires an r10 NDK
 It requires Scale (https://github.com/guillep/Scale)
 ```bash
 - wget -O- https://raw.githubusercontent.com/guillep/Scale/master/setupScale.sh | sudo bash
```

Building the  Stack AndroidVM
============================


1. Download the sources from [github](https://github.com/sbragagnolo/pharo-vm)
 
  ```bash
  git clone --depth=1 https://github.com/sbragagnolo/pharo-vm
  cd pharo-vm
  ```
2. Set-up your environment: This script will download the SDK installer and NDK R10
 ```bash
 cd android/scripts
 ./setupAndroidEnvironment.st
 ```
  This script downloads the content from
	* 'http://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip'.
	* 'http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz'.
 
  After this process you should have available the environment variables ANDROID_NDK_HOME and ANDROID_SDK_HOME.
  Ensure this by checking your .bashrc file at the user's home directory. 
  
  
3. Create a new image: this image will be created by pointing to this local git repository
 ```bash
 cd android/scripts
 ./newImage.st
 ```
 
4. Link sources to the build folder: The Android vm relies on a Java wrapper. This sources must be accessible from the build folder. 
 ```bash
 cd android/scripts
 ./linkSources.st
 ```

5. Generate the sources of the stack vm: This script executes the generator of the image created on int the 3rd step. 
 ```bash
 cd android/scripts
 ./generateStackAndroidMake.st
 ```

6. Generate the resource image for deployment: This script download and suites up an image for deployment on the folder build/assets/SmalltalkRessources
 ```bash
 cd android/scripts
 ./newResourceImage.st
 ```

  This image created in this point is downloaded with it related VM for editing and loading the code you want to deploy, or configure the things you want. 


7. The VM compilation: This script generates the libraries with the VM code. 
  ```bash
  cd build
  ./build.sh
 ```

8. The Java wrapper compilation and Android Application packaging 
  ```bash
 cd build
 ./package.sh
 ```

9. Installing into your device. If you want to generate an APK file with your custom name, you will need to deal with the AndroidManifest.xml before runing the package.sh script :)
  ```bash
 cd build/bin
 adb install -r StackActivity-debug.apk
 ```


Building the  JIT AndroidVM
============================

DISCLAIMER: This VM is not yet working. But you can still compile it and deploy it.

1. Download the sources from [github](https://github.com/pharo-project/pharo-vm)
 
  ```bash
   git clone --depth=1 https://github.com/pharo-project/pharo-vm.git
   cd pharo-vm
  ```
2. Set-up your environment: This script will download the SDK installer and NDK R10
 ```bash
 cd android/scripts
 ./setupAndroidEnvironment.st
 ```
  This script downloads the content from
	* 'http://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip'.
	* 'http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz'.
 
  After this process you should have available the environment variables ANDROID_NDK_HOME and ANDROID_SDK_HOME.
  Ensure this by checking your .bashrc file at the user's home directory. 
  
  
3. Create a new image: this image will be created by pointing to this local git repository
 ```bash
 cd android/scripts
 ./newImage.st
 ```
 
4. Link sources to the build folder: The Android vm relies on a Java wrapper. This sources must be accessible from the build folder. 
 ```bash
 cd android/scripts
 ./linkSources.st
 ```

5. Generate the sources of the stack vm: This script executes the generator of the image created on int the 3rd step. 
 ```bash
 cd android/scripts
 ./generateAndroidMake.st
 ```

6. Generate the resource image for deployment: This script download and suites up an image for deployment on the folder build/assets/SmalltalkRessources
 ```bash
 cd android/scripts
 ./newResourceImage.st
 ```

  This image created in this point is downloaded with it related VM for editing and loading the code you want to deploy, or configure the things you want. 


7. The VM compilation: This script generates the libraries with the VM code. 
  ```bash
 cd build
 ./build.sh
 ```

8. The Java wrapper compilation and Android Application packaging 
  ```bash
 cd build
 ./package.sh
 ```

9. Installing into your device. If you want to generate an APK file with your custom name, you will need to deal with the AndroidManifest.xml before runing the package.sh script :)
  ```bash
 cd build/bin
 adb install -r StackActivity-debug.apk
 ```

