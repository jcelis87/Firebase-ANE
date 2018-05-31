#!/bin/sh

#Get the path to the script and trim to get the directory.
echo "Setting path to current directory to:"
pathtome=$0
pathtome="${pathtome%/*}"


echo $pathtome

PROJECTNAME=FirebaseANE
#fwSuffix="_FW"
libSuffix="_LIB"

AIR_SDK="/Users/User/sdks/AIR/AIRSDK_29"
echo $AIR_SDK

if [ ! -d "$pathtome/../../native_library/apple/$PROJECTNAME/Build/Products/Release-iphonesimulator/" ]; then
echo "No Simulator build. Build using Xcode"
exit
fi

if [ ! -d "$pathtome/../../native_library/apple/$PROJECTNAME/Build/Products/Release-iphoneos/" ]; then
echo "No Device build. Build using Xcode"
exit
fi

#Setup the directory.
echo "Making directories."

if [ ! -d "$pathtome/platforms" ]; then
mkdir "$pathtome/platforms"
fi
if [ ! -d "$pathtome/platforms/android" ]; then
mkdir "$pathtome/platforms/android"
fi
if [ ! -d "$pathtome/platforms/ios" ]; then
mkdir "$pathtome/platforms/ios"
fi
if [ ! -d "$pathtome/platforms/ios/simulator" ]; then
mkdir "$pathtome/platforms/ios/simulator"
fi
if [ ! -d "$pathtome/platforms/ios/simulator/Frameworks" ]; then
mkdir "$pathtome/platforms/ios/simulator/Frameworks"
fi
if [ ! -d "$pathtome/platforms/ios/device" ]; then
mkdir "$pathtome/platforms/ios/device"
fi
if [ ! -d "$pathtome/platforms/ios/device/Frameworks" ]; then
mkdir "$pathtome/platforms/ios/device/Frameworks"
fi
if [ ! -d "$pathtome/platforms/default" ]; then
mkdir "$pathtome/platforms/default"
fi


#Copy SWC into place.
echo "Copying SWC into place."
cp "$pathtome/../bin/$PROJECTNAME.swc" "$pathtome/"

#Extract contents of SWC.
echo "Extracting files form SWC."
unzip "$pathtome/$PROJECTNAME.swc" "library.swf" -d "$pathtome"

#Copy library.swf to folders.
echo "Copying library.swf into place."
cp "$pathtome/library.swf" "$pathtome/platforms/ios/simulator"
cp "$pathtome/library.swf" "$pathtome/platforms/ios/device"
cp "$pathtome/library.swf" "$pathtome/platforms/android"
cp "$pathtome/library.swf" "$pathtome/platforms/default"

# Copying Android aars into place
cp "$pathtome/../../native_library/android/$PROJECTNAME/Firebase/build/outputs/aar/Firebase-release.aar" "$pathtome/platforms/android/Firebase-release.aar"
echo "getting Android jars"
unzip "$pathtome/platforms/android/Firebase-release.aar" "classes.jar" -d "$pathtome/platforms/android"
unzip "$pathtome/platforms/android/Firebase-release.aar" "res/*" -d "$pathtome/platforms/android"
mv "$pathtome/platforms/android/res" "$pathtome/platforms/android/com.tuarua.firebase.$PROJECTNAME-res"

#Copy native libraries into place.
echo "Copying native libraries into place."
cp -R -L "$pathtome/../../native_library/apple/$PROJECTNAME/Build/Products/Release-iphonesimulator/lib$PROJECTNAME$libSuffix.a" "$pathtome/platforms/ios/simulator/lib$PROJECTNAME.a"
cp -R -L "$pathtome/../../native_library/apple/$PROJECTNAME/Build/Products/Release-iphoneos/lib$PROJECTNAME$libSuffix.a" "$pathtome/platforms/ios/device/lib$PROJECTNAME.a"


cp -R -L "$pathtome/../../example/ios_dependencies/simulator/Frameworks/FreSwift.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../example/ios_dependencies/device/Frameworks/FreSwift.framework" "$pathtome/platforms/ios/device/Frameworks"

cp -R -L "$pathtome/../../firebase_frameworks/simulator/Firebase.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../firebase_frameworks/device/Firebase.framework" "$pathtome/platforms/ios/device/Frameworks"

cp -R -L "$pathtome/../../firebase_frameworks/simulator/FirebaseCore.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../firebase_frameworks/device/FirebaseCore.framework" "$pathtome/platforms/ios/device/Frameworks"

cp -R -L "$pathtome/../../firebase_frameworks/simulator/FirebaseCoreDiagnostics.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../firebase_frameworks/device/FirebaseCoreDiagnostics.framework" "$pathtome/platforms/ios/device/Frameworks"

cp -R -L "$pathtome/../../firebase_frameworks/simulator/nanopb.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../firebase_frameworks/device/nanopb.framework" "$pathtome/platforms/ios/device/Frameworks"

cp -R -L "$pathtome/../../firebase_frameworks/simulator/FirebaseCore.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../firebase_frameworks/device/FirebaseCore.framework" "$pathtome/platforms/ios/device/Frameworks"

cp -R -L "$pathtome/../../firebase_frameworks/simulator/FirebaseInstanceID.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../firebase_frameworks/device/FirebaseInstanceID.framework" "$pathtome/platforms/ios/device/Frameworks"

cp -R -L "$pathtome/../../firebase_frameworks/simulator/FirebaseNanoPB.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../firebase_frameworks/device/FirebaseNanoPB.framework" "$pathtome/platforms/ios/device/Frameworks"

cp -R -L "$pathtome/../../firebase_frameworks/simulator/GoogleToolboxForMac.framework" "$pathtome/platforms/ios/simulator/Frameworks"
cp -R -L "$pathtome/../../firebase_frameworks/device/GoogleToolboxForMac.framework" "$pathtome/platforms/ios/device/Frameworks"


#Run the build command.
echo "Building ANE."
"$AIR_SDK"/bin/adt -package \
-target ane "$pathtome/$PROJECTNAME.ane" "$pathtome/extension_multi.xml" \
-swc "$pathtome/$PROJECTNAME.swc" \
-platform iPhone-x86  -C "$pathtome/platforms/ios/simulator" "library.swf" "Frameworks" "lib$PROJECTNAME.a" \
-platformoptions "$pathtome/platforms/ios/platform.xml" \
-platform iPhone-ARM  -C "$pathtome/platforms/ios/device" "library.swf" "Frameworks" "lib$PROJECTNAME.a" \
-platformoptions "$pathtome/platforms/ios/platform.xml" \
-platform Android-ARM \
-C "$pathtome/platforms/android" "library.swf" "classes.jar" \
com.tuarua.firebase.$PROJECTNAME-res/. \
-platformoptions "$pathtome/platforms/android/platform.xml" \
-platform Android-x86 \
-C "$pathtome/platforms/android" "library.swf" "classes.jar" \
com.tuarua.firebase.$PROJECTNAME-res/. \
-platformoptions "$pathtome/platforms/android/platform.xml" \
-platform default -C "$pathtome/platforms/default" "library.swf"

echo "Packaging docs into ANE."
zip "$pathtome/$PROJECTNAME.ane" -u docs/*

echo "Packaging Google Services values into ANE."
zip "$pathtome/$PROJECTNAME.ane" META-INF/ANE/Android-ARM/com.tuarua.firebase.FirebaseANE-res/values/values.xml

#remove the frameworks from sim and device, as not needed any more
rm "$pathtome/platforms/android/classes.jar"
rm "$pathtome/platforms/android/Firebase-release.aar"
rm "$pathtome/platforms/android/library.swf"
rm -r "$pathtome/platforms/ios/simulator"
rm -r "$pathtome/platforms/ios/device"
rm -r "$pathtome/platforms/default"
rm "$pathtome/$PROJECTNAME.swc"
rm "$pathtome/library.swf"
rm -r "$pathtome/platforms/android/com.tuarua.firebase.$PROJECTNAME-res"
echo "Finished."
