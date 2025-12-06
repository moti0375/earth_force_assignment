package com.example.earth_force_assignment

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){

    private var batteryReceiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        Log.i(LOG_TAG, "configureFlutterEngine");
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)
            .setStreamHandler(object : EventChannel.StreamHandler {

                override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                    Log.i(LOG_TAG, "onListen: ");
                    registerBatteryReceiver(events)
                }

                override fun onCancel(arguments: Any?) {
                    unregisterBatteryReceiver()
                }
            })


        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            PLATFORM_CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getDeviceDetails" -> getDeviceDetails(result)
                else -> result.notImplemented()
            }
        }
    }

    private fun getDeviceDetails(result: MethodChannel.Result) {
        val info = mapOf(
            "manufacturer" to Build.MANUFACTURER,
            "model" to Build.MODEL
        )
        result.success(info)
    }


    private fun registerBatteryReceiver(events: EventChannel.EventSink) {
        batteryReceiver = object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {

                val level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
                val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)

                val isCharging =
                    status == BatteryManager.BATTERY_STATUS_CHARGING ||
                            status == BatteryManager.BATTERY_STATUS_FULL
                val data = mapOf("type" to "batteryStatus","payload" to mapOf(
                    "batteryLevel" to level,
                    "isCharging" to isCharging
                ))

                Log.i(LOG_TAG, "Battery onReceive: $data")
                events.success(data)
            }
        }

        val filter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        registerReceiver(batteryReceiver, filter)
    }

    private fun unregisterBatteryReceiver() {
        batteryReceiver?.let {
            unregisterReceiver(it)
            batteryReceiver = null
        }
    }

    companion object{
        private const val PLATFORM_CHANNEL = "com.example.earth_force.channel"
        private const val EVENT_CHANNEL = "$PLATFORM_CHANNEL/events"
        private const val LOG_TAG = "MainActivity"
    }
}
