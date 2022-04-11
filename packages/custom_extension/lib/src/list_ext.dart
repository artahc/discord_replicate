import 'dart:collection';

extension ListToKeyValuePair<T> on Iterable<T> {
  Map<K, V> toMap<K, V>({
    required dynamic Function(T) keyConverter,
    required dynamic Function(T) valueConverter,
  }) {
    Map<K, V> map = {};
    var entries = this.map((e) => MapEntry<K, V>(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
  }

  HashMap<K, V> toHashMap<K, V>({
    required dynamic Function(T) keyConverter,
    required dynamic Function(T) valueConverter,
  }) {
    HashMap<K, V> map = new HashMap();
    var entries = this.map((e) => MapEntry<K, V>(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
  }

  SplayTreeMap<K, V> toSplayTreeMap<K, V>({
    required dynamic Function(T) keyConverter,
    required dynamic Function(T) valueConverter,
  }) {
    SplayTreeMap<K, V> map = new SplayTreeMap();
    var entries = this.map((e) => MapEntry<K, V>(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
  }
}
