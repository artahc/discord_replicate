import 'dart:math';

import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Datetime to epoch", () {
    var date = DateTime.fromMillisecondsSinceEpoch(1642674229000);
    print(date);
  });

  test("Map list of T to Key Value Pair", () {
    List<RawMessage> list = List.generate(
      3,
      (index) {
        var random = Random().nextInt(1000);
        return Message.raw(id: random.toString(), message: "Messag#$random", senderRef: "User#$random", timestamp: random) as RawMessage;
      },
    );

    print(list.toMap(keyConverter: (element) => element.id, valueConverter: (element) => element));
    print(list.expand((element) => {element.id, element}));
    print(list.toSet());
  });
}
