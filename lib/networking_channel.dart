import 'package:flutter/services.dart';

class RequestMethod {
  static const GET = "GET";
  static const POST = "POST";
  static const PUT = "PUT";
  static const PATCH = "PATCH";
  static const DELETE = "DELETE";
  static const HEAD = "HEAD";
}

class NetworkingMethodChannel {
  MethodChannel _methodChannel;

  NetworkingMethodChannel(String channelName) {
    _methodChannel = MethodChannel(channelName);
  }

  Future<String> sendHttpRequest(String method, String path) async {
    return _methodChannel.invokeMethod("sendHttpRequest", {"path": path, "method": method});
  }
}
