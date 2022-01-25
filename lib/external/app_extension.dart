export 'package:discord_replicate/external/math_extension.dart';

extension ListToKeyValuePair<T> on List<T> {
  Map<dynamic, dynamic> toKeyValuePair(dynamic Function(T) keyConverter, dynamic Function(T) valueConverter) {
    Map<dynamic, dynamic> map = {};
    var entries = this.map((e) => MapEntry(keyConverter(e), valueConverter(e)));
    map.addEntries(entries);
    return map;
  }
}
