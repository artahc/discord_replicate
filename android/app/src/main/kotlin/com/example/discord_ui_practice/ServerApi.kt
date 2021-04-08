package com.example.discord_ui_practice

import io.reactivex.Single
import io.reactivex.schedulers.Schedulers
import okhttp3.ResponseBody
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.http.GET
import retrofit2.http.Path

class ServerApi(private val baseUrl: String) {
    enum class Method { GET, POST, PUT, PATCH, DELETE, HEAD }

    private interface ApiService {
        @GET("{path}")
        fun sendGetHttpRequest(@Path("path", encoded = true) path: String): Single<ResponseBody>
    }

    private var service: ApiService

    init {
        val retrofit: Retrofit = Retrofit.Builder()
            .addCallAdapterFactory(RxJava2CallAdapterFactory.createWithScheduler(Schedulers.io()))
            .baseUrl(this.baseUrl)
            .build()

        service = retrofit.create(ApiService::class.java)
    }

    fun sendHttpRequest(method: Method, path: String): Single<ResponseBody> {
        return when (method) {
            Method.GET -> service.sendGetHttpRequest(path)
            else -> Single.just(ResponseBody.create(null, ""))
        }
    }

}

