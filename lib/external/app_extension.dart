export 'package:discord_replicate/external/math_extension.dart';

import 'dart:convert';
import 'dart:typed_data';

extension ListToKeyValuePair<T> on List<T> {
  Map<K, V> toKeyValuePair<K, V>({required dynamic Function(T) keyConverter, required dynamic Function(T) valueConverter}) {
    Map<K, V> map = {};
    var entries = this.map((e) => MapEntry<K, V>(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
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

extension ConvertByteArrayToUint8 on List<int> {
  String toPlainString() {
    return utf8.decode(this);
  }

  Uint8List toUint8List() {
    return Uint8List.fromList(this);
  }
}
