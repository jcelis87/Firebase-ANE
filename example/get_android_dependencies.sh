#!/bin/sh

AneVersion="0.0.2"
PlayerServicesVersion="15.0.1"
SupportV4Version="27.1.0"
FirebaseVersion="16.0.0"

wget -O ../native_extension/ane/FirebaseANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/FirebaseANE.ane?raw=true
wget -O ../native_extension/AnalyticsANE/ane/AnalyticsANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/AnalyticsANE.ane?raw=true
wget -O ../native_extension/AuthANE/ane/AuthANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/AuthANE.ane?raw=true
wget -O ../native_extension/DynamicLinksANE/ane/DynamicLinksANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/DynamicLinksANE.ane?raw=true
wget -O ../native_extension/FirestoreANE/ane/FirestoreANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/FirestoreANE.ane?raw=true
wget -O ../native_extension/MessagingANE/ane/MessagingANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/MessagingANE.ane?raw=true
wget -O ../native_extension/PerformanceANE/ane/PerformanceANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/PerformanceANE.ane?raw=true
wget -O ../native_extension/RemoteConfigANE/ane/RemoteConfigANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/RemoteConfigANE.ane?raw=true
wget -O ../native_extension/StorageANE/ane/StorageANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/StorageANE.ane?raw=true
wget -O ../native_extension/GoogleSignInANE/ane/GoogleSignInANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/GoogleSignInANE.ane?raw=true
wget -O ../native_extension/InvitesANE/ane/InvitesANE.ane https://github.com/tuarua/Firebase-ANE/releases/download/$AneVersion/InvitesANE.ane?raw=true

wget -O android_dependencies/com.tuarua.frekotlin.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/kotlin/com.tuarua.frekotlin.ane?raw=true
wget -O android_dependencies/org.greenrobot.eventbus-3.0.0.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/misc/org.greenrobot.eventbus-3.0.0.ane?raw=true
wget -O android_dependencies/com.google.code.gson.gson-2.8.4.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/misc/com.google.code.gson.gson-2.8.4.ane?raw=true
wget -O android_dependencies/com.squareup.okhttp.okhttp-2.7.2.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/misc/com.squareup.okhttp.okhttp-2.7.2.ane?raw=true
wget -O android_dependencies/com.android.support.support-v4-$SupportV4Version.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/support/com.android.support.support-v4-$SupportV4Version.ane?raw=true
wget -O android_dependencies/com.google.guava.guava-20.0.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/misc/com.google.guava.guava-20.0.ane?raw=true
wget -O android_dependencies/com.google.android.gms.play-services-base-$PlayerServicesVersion.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/play-services/com.google.android.gms.play-services-base-$PlayerServicesVersion.ane?raw=true
wget -O android_dependencies/com.google.android.gms.play-services-auth-$PlayerServicesVersion.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/play-services/com.google.android.gms.play-services-auth-$PlayerServicesVersion.ane?raw=true
wget -O android_dependencies/android.arch.lifecycle.runtime-1.1.1.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/play-services/android.arch.lifecycle.runtime-1.1.1.ane?raw=true

wget -O android_dependencies/com.google.firebase.firebase-analytics-$FirebaseVersion.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-analytics-$FirebaseVersion.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-auth-16.0.1.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-auth-16.0.1.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-config-16.0.0.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-config-$FirebaseVersion.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-dynamic-links-$FirebaseVersion.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-dynamic-links-$FirebaseVersion.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-invites-$FirebaseVersion.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-invites-$FirebaseVersion.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-firestore-17.0.1.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-firestore-17.0.1.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-iid-$FirebaseVersion.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-iid-$FirebaseVersion.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-messaging-17.0.0.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-messaging-17.0.0.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-perf-15.0.0.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-perf-15.0.0.ane?raw=true
wget -O android_dependencies/com.google.firebase.firebase-storage-16.0.1.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/firebase/com.google.firebase.firebase-storage-16.0.1.ane?raw=true
