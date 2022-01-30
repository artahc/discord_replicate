export 'package:discord_replicate/external/math_extension.dart';

extension ListToKeyValuePair<T> on List<T> {
  Map<K, V> toKeyValuePair<K, V>({required dynamic Function(T) keyConverter, required dynamic Function(T) valueConverter}) {
    Map<K, V> map = {};
    var entries = this.map((e) => MapEntry<K, V>(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
  }
}
