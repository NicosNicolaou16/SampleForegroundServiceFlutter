package com.nicos.sample_foreground_service_flutter

import android.content.Intent
import com.nicos.sample_foreground_service_flutter.service.LocationService
import com.nicos.sampleforegroundservice.utils.secure_share_preferences.SecureSharePreferences
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

const val RESTART_SERVICE = "restart_service"

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL_NAME = "foreground_service"
        private const val START_SERVICE = "start_service"
        private const val STOP_SERVICE = "stop_service"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val secureSharePreferences = SecureSharePreferences(context = context)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        MethodChannel(messenger, CHANNEL_NAME).setMethodCallHandler { call, result ->
            when {
                call.arguments.toString() == START_SERVICE -> {
                    this.startService(Intent(this, LocationService::class.java))
                    secureSharePreferences.saveBooleanValue(RESTART_SERVICE, true)
                }

                call.arguments.toString() == STOP_SERVICE -> {
                    this.stopService(Intent(this, LocationService::class.java))
                    secureSharePreferences.saveBooleanValue(RESTART_SERVICE, false)
                }
            }
        }
    }
}
