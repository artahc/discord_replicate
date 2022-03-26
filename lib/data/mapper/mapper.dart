import 'dart:async';

abstract class Mapper<I, O> {
  FutureOr<O> map(I from);
}
