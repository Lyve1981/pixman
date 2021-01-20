set ABI=armeabi-v7a
set OUTDIR=cmake_out\android_%ABI%
set ANDROID_NDK=c:\android\android-ndk-r21d

set ARGS=-DANDROID_ARM_NEON=FALSE -DCMAKE_TOOLCHAIN_FILE=%ANDROID_NDK%/build/cmake/android.toolchain.cmake -DCMAKE_MAKE_PROGRAM=%ANDROID_NDK%/prebuilt/windows-x86_64/bin/make.exe -DANDROID_NATIVE_API_LEVEL=16 -B "%OUTDIR%" -G "MinGW Makefiles"

cmake %ARGS% "-DANDROID_ABI=%ABI%"

IF %ERRORLEVEL% NEQ 0 exit /B 1
pushd %OUTDIR%
cmake --build . --config Release
popd
