class NotFoundException implements Exception {
  final String message;
  final Object? source;

  NotFoundException(this.message, {this.source});

  @override
  String toString() {
    return super.toString();
  }
}

class ParsingException implements Exception {
  final String message;
  final dynamic payload;
  final Object? source;

  ParsingException(this.message, {this.payload, this.source});

  @override
  String toString() {
    return {
      "ParsingException": {
        "message": message,
        "source": source,
        "payload": payload,
      },
    }.toString();
  }
}