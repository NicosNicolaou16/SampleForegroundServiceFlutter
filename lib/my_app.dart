import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _channelName = "foreground_service";
  static const String _methodName = "service";
  static const String _startService = "start_service";
  static const String _stopService = "stop_service";
  final MethodChannel _channelMethod = const MethodChannel(_channelName);

  _notifyToStartOrStopServiceInNativeAndroid(String type) async {
    await _channelMethod.invokeMethod(_methodName, type);
  }

  _requestPermissions() async {
    await [
      Permission.location,
      Permission.notification,
      Permission.locationWhenInUse,
    ].request().then((value) async {
      value.forEach((key, value) async {
        if (value.isGranted) {
          await _notifyToStartOrStopServiceInNativeAndroid(_startService);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foreground Service',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await _requestPermissions();
                  },
                  child: const Text("Start Service")),
              ElevatedButton(
                  onPressed: () async {
                    await _notifyToStartOrStopServiceInNativeAndroid(
                        _stopService);
                  },
                  child: const Text("Stop Service")),
            ],
          ),
        ),
      ),
    );
  }
}
