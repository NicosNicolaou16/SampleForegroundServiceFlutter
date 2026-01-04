# Sample Foreground Service Flutter

This sample project demonstrates the setup for a foreground service, specifically for requesting
location data. The permission `<uses-permission android:name="
android.permission.FOREGROUND_SERVICE_LOCATION" />` depends on the type of foreground service being
used. <br />
Communication between Android Native and Flutter is handled via a channel (refer to the
documentation for more details). If you need additional examples on using channels, please check my
repository for more information.
[ExampleChannelNativeAndroidWithCustomData](https://github.com/NicosNicolaou16/ExampleChannelNativeAndroidWithCustomData)

> [!IMPORTANT]
> NOTE: EXAMPLE FOR ANDROID ONLY. <br />

# Setup

## Manifest Setup

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
        <service android:name=".service.LocationService" android:enabled="true"
            android:exported="false" android:foregroundServiceType="location" />

        <!--Broadcast Receiver (Optional)-->
        <receiver android:name=".broadcast_receiver.RestartServiceBroadcastReceiver"
            android:enabled="true" android:exported="false">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED" />
            </intent-filter>
        </receiver>

        <!--other code here-->
    </application>
</manifest>
```

> [!IMPORTANT]  
> Check my article for the setup :point_right: [Foreground Service in Android - Medium](https://medium.com/@nicosnicolaou/foreground-service-in-android-9ff18be69ef6) :point_left: <br />

> [!IMPORTANT]
> Similar project with (Kotlin Language) :point_right: [SampleForegroundService](https://github.com/NicosNicolaou16/SampleForegroundService) :point_left: <br />

## Versioning

Flutter SDK version: 3.38.5 <br />
Dart Version: 3.10.4 <br />

# References

https://developer.android.com/about/versions/14/changes/fgs-types-required <br />
https://stackoverflow.com/questions/14385231/android-broadcastreceiver-auto-run-service-after-reboot-of-device <br />
https://medium.com/@shreebhagwat94/flutter-platform-channel-46578d21e69 <br />
https://blog.devgenius.io/use-flutter-screens-in-native-android-app-share-data-among-them-d97d670807a6 <br />
