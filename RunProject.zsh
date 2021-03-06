#!/bin/zsh

BUILD_PATH=$(dirname $0)

while [[ -z $BUILD_FILE && $BUILD_PATH != "/" ]]; do
    BUILD_FILE=$(find $BUILD_PATH -name '*.xcodeproj' -maxdepth 1)
    BUILD_PATH=$(dirname $BUILD_PATH)
done

if [[ -z $BUILD_FILE ]]; then
    echo "Couldn't find an xcode project file in directory"
    exit 1
fi

# Applescript likes's : instead of / (because it's insane)
BUILD_FILE=${BUILD_FILE//\//:}

# Find the latest Simulator SDK
SIMULATOR_SDKS=( /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/*.sdk )

SIMULATOR_SDK=${SIMULATOR_SDKS[-1]} 
SIMULATOR_SDK_STRING=$(basename ${(L)SIMULATOR_SDK%.[a-z]*})

if [[ -z $SIMULATOR_SDK ]]; then
    echo "Couldn't find a simulator SDK"
    exit 1
fi


osascript <<SCRIPT
application "iPhone Simulator" quit
application "iPhone Simulator" activate

tell application "Xcode"
    open "$BUILD_FILE"
    set targetProject to project of active project document

    tell targetProject
        set active build configuration type to build configuration type "Debug"
        set active SDK to "$SIMULATOR_SDK_STRING"
        set value of build setting "SDKROOT" of build configuration "Debug" of active target to "$SIMULATOR_SDK"

        if (build targetProject) is equal to "Build succeeded" then
                launch targetProject
        else
                application "iPhone Simulator" quit
        end if
    end tell
end tell
SCRIPT