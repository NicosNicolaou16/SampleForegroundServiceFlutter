# Sample Foreground Service Flutter

[![Linktree](https://img.shields.io/badge/linktree-1de9b6?style=for-the-badge&logo=linktree&logoColor=white)](https://linktr.ee/nicos_nicolaou)
[![Static Badge](https://img.shields.io/badge/Site-blue?style=for-the-badge&label=Web)](https://nicosnicolaou16.github.io/)
[![X](https://img.shields.io/badge/X-%23000000.svg?style=for-the-badge&logo=X&logoColor=white)](https://twitter.com/nicolaou_nicos)
[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/nicos-nicolaou-a16720aa)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@nicosnicolaou)
[![Mastodon](https://img.shields.io/badge/-MASTODON-%232B90D9?style=for-the-badge&logo=mastodon&logoColor=white)](https://androiddev.social/@nicolaou_nicos)
[![Bluesky](https://img.shields.io/badge/Bluesky-0285FF?style=for-the-badge&logo=Bluesky&logoColor=white)](https://bsky.app/profile/nicolaounicos.bsky.social)
[![Dev.to blog](https://img.shields.io/badge/dev.to-0A0A0A?style=for-the-badge&logo=dev.to&logoColor=white)](https://dev.to/nicosnicolaou16)
[![YouTube](https://img.shields.io/badge/YouTube-%23FF0000.svg?style=for-the-badge&logo=YouTube&logoColor=white)](https://www.youtube.com/@nicosnicolaou16)
[![Static Badge](https://img.shields.io/badge/Developer_Profile-blue?style=for-the-badge&label=Google)](https://g.dev/nicolaou_nicos)

This sample project demonstrates the implementation of an Android Foreground Service in Flutter, specifically for background location tracking. It showcases how to handle platform channels for Native-to-Flutter communication.

> [!IMPORTANT]
> Communication between Android Native and Flutter is handled via `MethodChannel`. For more complex data handling, refer to:
> 👉 **[ExampleChannelNativeAndroidWithCustomData](https://github.com/NicosNicolaou16/ExampleChannelNativeAndroidWithCustomData)**


> [!IMPORTANT]  
> A detailed step-by-step guide is available on Medium!  
> 👉 **[Foreground Service in Android](https://medium.com/@nicosnicolaou/foreground-service-in-android-9ff18be69ef6)** 👈

> [!IMPORTANT]
> Similar project with (Kotlin Language) :point_right: [SampleForegroundService](https://github.com/NicosNicolaou16/SampleForegroundService) :point_left: <br />

## 🚀 Setup Steps

### 1. Android Manifest Configuration

Update your `AndroidManifest.xml` to include the necessary permissions and service declarations.

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

## 🔧 Versioning

- **Flutter SDK:** **3.41.4**
- **Dart Version:** **3.11.1**

## 📚 References & Tutorials

- **Android Developers:** [Foreground Service Types Required](https://developer.android.com/about/versions/14/changes/fgs-types-required)
- **StackOverflow:** [Auto-run service after reboot](https://stackoverflow.com/questions/14385231/android-broadcastreceiver-auto-run-service-after-reboot-of-device)
- **Medium:** [Flutter Platform Channels](https://medium.com/@shreebhagwat94/flutter-platform-channel-46578d21e69)
- **DevGenius:** [Using Flutter Screens in Native Android](https://blog.devgenius.io/use-flutter-screens-in-native-android-app-share-data-among-them-d97d670807a6)

## 🔗 Related Projects

- **Kotlin Native Version:** [SampleForegroundService](https://github.com/NicosNicolaou16/SampleForegroundService)

## ⭐ Stargazers

If you find this project useful, please give it a star!  
[Check out the stargazers here](https://github.com/NicosNicolaou16/sample_foreground_service_flutter/stargazers)

## 🙏 Support & Contributions

This project is maintained for the community. Feedback, bug reports, and feature requests are welcome! Feel free to **open an issue** or submit a **pull request**.
