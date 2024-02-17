# Sample Foreground Service Flutter

This sample project shows the setup for the foreground service. The service in this sample project is a foreground service to request location.
The permission for <uses-permission android:name="android.permission.FOREGROUND_SERVICE_LOCATION" /> is depend of the foreground service type.
The communication between Android Native with Flutter, I used channel (check the references). 
But, if you need an extra example about the channel check my repository for more information. 
https://github.com/NicosNicolaou16/ExampleChannelNativeAndroidWithCustomData

NOTE: EXAMPLE ONLY FOR ANDROID

## Similar project with (Kotlin Language)

https://github.com/NicosNicolaou16/SampleForegroundService <br />

## Versions

Flutter SDK version: 3.19.0 <br />
Dart Version: 3.3.0 <br />

# Manifest Setup
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />

    <!--Location Permissions-->
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

    <!--Foreground Service Permissions-->
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_LOCATION" />

    <!--Restart Service After Reboot the Mobile Device-->
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />

    <application>
        <!--other code here-->

        <!--Service-->
        <service
            android:name=".service.LocationService"
            android:enabled="true"
            android:exported="false"
            android:foregroundServiceType="location" />

        <!--Broadcast Receiver (Optional)-->
        <receiver
            android:name=".broadcast_receiver.RestartServiceBroadcastReceiver"
            android:enabled="true"
            android:exported="false">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED" />
            </intent-filter>
        </receiver>
        
        <!--other code here-->
    </application>
</manifest>
```

## Check my article
https://medium.com/@nicosnicolaou/foreground-service-in-android-9ff18be69ef6 <br />

# References
https://developer.android.com/about/versions/14/changes/fgs-types-required <br />
https://stackoverflow.com/questions/14385231/android-broadcastreceiver-auto-run-service-after-reboot-of-device <br />
https://medium.com/@shreebhagwat94/flutter-platform-channel-46578d21e69 <br />
https://blog.devgenius.io/use-flutter-screens-in-native-android-app-share-data-among-them-d97d670807a6 <br />
