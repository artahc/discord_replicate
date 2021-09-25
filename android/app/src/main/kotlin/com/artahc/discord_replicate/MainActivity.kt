package com.artahc.discord_replicate

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.reactivex.plugins.RxJavaPlugins

class MainActivity: FlutterActivity() {
    private val NETWORKING_METHOD_CHANNEL = "networking_discord_practice"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        RxJavaPlugins.setErrorHandler { e ->
            Log.e("RxJavaError", e.printStackTrace().toString())
        }

        NetworkingMethodChannel(this,this.flutterEngine!!.dartExecutor.binaryMessenger,  NETWORKING_METHOD_CHANNEL)
    }
}

