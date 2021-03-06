$AneVersion = "0.11.0"
$FreKotlinVersion = "1.10.0"
$PlayerServicesBaseVersion = "17.1.0"
$SupportV4Version = "1.0.0"
$AnalyticsVersion = "17.3.0"
$IidVersion = "20.1.5"
$VisionVersion = "24.0.1"
$ImageLabelVersion = "19.0.0"
$NaturalLanguageVersion = "22.0.0"
$ModelInterpreterVersion = "22.0.1"
$FaceModelVersion = "19.0.0"
$BarcodeModelVersion = "16.0.2"
$KotlinxCoroutinesVersion = "1.3.5"
$EventBusVersion = "3.0.0"
$GsonVersion = "2.8.6"

$currentDir = (Get-Item -Path ".\" -Verbose).FullName
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/assets.zip?raw=true -OutFile "$currentDir\assets.zip"

Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/FirebaseANE.ane?raw=true -OutFile "$currentDir\..\native_extension\ane\FirebaseANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/AnalyticsANE.ane?raw=true -OutFile "$currentDir\..\native_extension\AnalyticsANE\ane\AnalyticsANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionFaceANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionFaceANE\ane\VisionFaceANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionBarcodeANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionBarcodeANE\ane\VisionBarcodeANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionANE\ane\VisionANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionTextANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionTextANE\ane\VisionTextANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionCloudTextANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionCloudTextANE\ane\VisionCloudTextANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionCloudDocumentANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionCloudTextANE\ane\VisionCloudDocumentANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionLabelANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionLabelANE\ane\VisionLabelANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionCloudLabelANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionCloudLabelANE\ane\VisionCloudLabelANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/VisionLandmarkANE.ane?raw=true -OutFile "$currentDir\..\native_extension\VisionLandmarkANE\ane\VisionLandmarkANE.ane"
Invoke-WebRequest -Uri https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/ModelInterpreterANE.ane?raw=true -OutFile "$currentDir\..\native_extension\ModelInterpreterANE\ane\ModelInterpreterANE.ane"


Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.tuarua.frekotlin-$FreKotlinVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/kotlin/com.tuarua.frekotlin-$FreKotlinVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\org.jetbrains.kotlinx.kotlinx-coroutines-android-$KotlinxCoroutinesVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/kotlin/org.jetbrains.kotlinx.kotlinx-coroutines-android-$KotlinxCoroutinesVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\org.greenrobot.eventbus-$EventBusVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/misc/org.greenrobot.eventbus-$EventBusVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.code.gson.gson-$GsonVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/misc/com.google.code.gson.gson-$GsonVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\androidx.legacy.legacy-support-v4-$SupportV4Version.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/support/androidx.legacy.legacy-support-v4-$SupportV4Version.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.android.gms.play-services-base-$PlayerServicesBaseVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/play-services/com.google.android.gms.play-services-base-$PlayerServicesBaseVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.firebase.firebase-analytics-$AnalyticsVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-analytics-$AnalyticsVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.firebase.firebase-iid-$IidVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-iid-$IidVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.firebase.firebase-ml-vision-$VisionVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-ml-vision-$VisionVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.firebase.firebase-ml-vision-image-label-model-$ImageLabelVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-ml-vision-image-label-model-$ImageLabelVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.firebase.firebase-ml-natural-language-$NaturalLanguageVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-ml-natural-language-$NaturalLanguageVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.firebase.firebase-ml-vision-face-model-$FaceModelVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-ml-vision-face-model-$FaceModelVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.firebase.firebase-ml-vision-barcode-model-$BarcodeModelVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-ml-vision-barcode-model-$BarcodeModelVersion.ane?raw=true
Invoke-WebRequest -OutFile "$currentDir\android_dependencies\com.google.firebase.firebase-ml-model-interpreter-$ModelInterpreterVersion.ane" -Uri https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-ml-model-interpreter-$ModelInterpreterVersion.ane?raw=true