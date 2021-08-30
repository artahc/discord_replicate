import 'package:flutter/services.dart';

class RequestMethod {
  static const GET = "GET";
  static const POST = "POST";
  static const PUT = "PUT";
  static const PATCH = "PATCH";
  static const DELETE = "DELETE";
  static const HEAD = "HEAD";
}

class NetworkWrapper {
  late MethodChannel _methodChannel;
  static const String BASE_URL = "https://606c0347f8678400172e6f34.mockapi.io/api/v1/";

  NetworkWrapper(String channelName) {
    _methodChannel = MethodChannel(channelName);
    _methodChannel.invokeMethod("init", {"base_url": BASE_URL});
  }

  Future<String> sendHttpRequest(String method, String path) async {
    return await _methodChannel.invokeMethod("sendHttpRequest", {"path": path, "method": method});
  }
}
