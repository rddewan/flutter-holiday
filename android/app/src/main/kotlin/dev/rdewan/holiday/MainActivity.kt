package dev.rdewan.holiday

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channelName = "rdewan.dev/network_helper"
    private lateinit var channel: MethodChannel
    private val context = this

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelName)

        //receive call from fluttter
        channel.setMethodCallHandler {call,result -> 
            if (call.method == "getNetworkStatus") {
                result.success(NetworkHelper.isNetworkAvailable(context))
            }
        }

    }
    
}