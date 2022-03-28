class NotFoundException implements Exception {
  final String message;
  final Object? source;

  NotFoundException(this.message, {this.source});

  @override
  String toString() {
    return super.toString();
  }
}
