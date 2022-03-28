import 'package:rxdart/rxdart.dart';

extension StreamExtension<T> on Stream<T> {
  Stream<T> withInitialValue(T initialValue) {
    return Stream.value(initialValue).concatWith([this]);
  }

  Stream<T> withLatestItem({int count = 1}) {
    return this.takeLast(count).concatWith([this]);
  }
}
