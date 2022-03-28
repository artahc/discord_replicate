import 'dart:convert';
import 'dart:typed_data';

extension ConvertByteArrayToUint8 on List<int> {
  String toPlainString() {
    return utf8.decode(this);
  }

  Uint8List toUint8List() {
    return Uint8List.fromList(this);
  }
}

extension ConvertStringToByteArrayUTF8 on String {
  Uint8List toUint8List() {
    return utf8.encode(this).toUint8List();
  }

  List<int> encodeToUtf8() {
    return utf8.encode(this);
  }
}
