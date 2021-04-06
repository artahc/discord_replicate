package com.example.discord_ui_practice

import android.content.Context
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers

class NetworkingMethodChannel(
    context: Context,
    binaryMessenger: BinaryMessenger,
    channelName: String,
    private val api: ServerApi
) :
    MethodChannel.MethodCallHandler {

    init {
        MethodChannel(binaryMessenger, channelName).setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val argument = call.arguments as Map<String, Any?>

        when (call.method) {
            "sendHttpRequest" -> {
                val method = ServerApi.Method.valueOf(argument["method"] as String)
                val path = argument["path"] as String

                api.sendHttpRequest(method, path)
                    .subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.from(Looper.getMainLooper()))
                    .subscribe(
                        {
                            result.success(it.string())
                        }, {
                            result.error("0", it.message, it.printStackTrace())
                        }
                    )
            }
        }
    }

}