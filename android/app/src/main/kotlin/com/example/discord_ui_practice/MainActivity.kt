package com.example.discord_ui_practice

import android.net.Network
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.reactivex.plugins.RxJavaPlugins

class MainActivity: FlutterActivity() {
    private val BASE_URL = "https://606c0347f8678400172e6f34.mockapi.io/api/v1/"
    private val NETWORKING_CHANNEL = "networking_discord_practice"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        RxJavaPlugins.setErrorHandler { e ->
            Log.e("RxJavaError", e.printStackTrace().toString())
        }

        val serverApi = ServerApi(BASE_URL)
        NetworkingMethodChannel(this,this.flutterEngine!!.dartExecutor.binaryMessenger,  NETWORKING_CHANNEL, serverApi)
    }
}

