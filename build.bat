@echo off

REM Windows Build Script for MeteoStack (BATCH Script)
REM ---------------------------------------------------------
REM Options:
REM     build.bat Debug/Release "vcpkg/toolchain/file.cmake"
REM Example:
REM     build.bat Debug "path/to/vcpkg/toolchain/file.cmake"

if not exist "build" (
    echo build does not exist, creating...
    mkdir build
)

if not %1 == Debug if not %1 == Release (
    echo %1 is not a valid option
    exit /B 1
)

cd build

if %1 == Debug (
    echo Building with Debug configuration

    cmake .. -G "Ninja" -DCMAKE_TOOLCHAIN_FILE="%2" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DVCPKG_TARGET_TRIPLET=x64-mingw-static
    cmake --build . --config Debug
) else if %1 == Release (
    echo Building with Release configuration

    cmake .. -G "Ninja" -DCMAKE_TOOLCHAIN_FILE="%2" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DVCPKG_TARGET_TRIPLET=x64-mingw-static
    cmake --build . --config Release
)

cd ..