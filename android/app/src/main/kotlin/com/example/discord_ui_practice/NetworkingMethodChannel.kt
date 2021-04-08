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
    channelName: String
) :
    MethodChannel.MethodCallHandler {

    private var api: ServerApi? = null

    init {
        MethodChannel(binaryMessenger, channelName).setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val argument = call.arguments as Map<String, Any?>

        when (call.method) {
            "init" -> {
                val baseUrl = argument["base_url"] as String
                api = ServerApi(baseUrl)
            }

            "sendHttpRequest" -> {
                val method = ServerApi.Method.valueOf(argument["method"] as String)
                val path = argument["path"] as String
                try {
                    api!!.sendHttpRequest(method, path)
                        .observeOn(AndroidSchedulers.from(Looper.getMainLooper()))
                        .subscribeOn(Schedulers.io())
                        .subscribe(
                            {
                                result.success(it.string())
                            }, {
                                result.error("0", it.message, it.printStackTrace())
                            }
                        )
                } catch (e: NullPointerException) {
                    result.error(
                        "Unintialized Property Access",
                        "Please call init before calling any method.",
                        e.printStackTrace()
                    )
                }

            }
        }
    }
}