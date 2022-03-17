import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

extension ListToKeyValuePair<T> on List<T> {
  Map<K, V> toMap<K, V>({required dynamic Function(T) keyConverter, required dynamic Function(T) valueConverter}) {
    Map<K, V> map = {};
    var entries = this.map((e) => MapEntry<K, V>(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
  }

  HashMap<K, V> toHashMap<K, V>({required dynamic Function(T) keyConverter, required dynamic Function(T) valueConverter}) {
    HashMap<K, V> map = new HashMap();
    var entries = this.map((e) => MapEntry<K, V>(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
  }

  SplayTreeMap<K, V> toSplayTreeMap<K, V>({required dynamic Function(T) keyConverter, required dynamic Function(T) valueConverter}) {
    SplayTreeMap<K, V> map = new SplayTreeMap();
    var entries = this.map((e) => MapEntry<K, V>(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
  }
}

extension MathExtension on double {
  double remap(double fromMin, double toMin, double fromMax, double toMax) {
    return (this - fromMin) / (toMin - fromMin) * (toMax - fromMax) + fromMax;
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
