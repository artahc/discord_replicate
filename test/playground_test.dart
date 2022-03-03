import 'dart:async';
import 'dart:math';

import 'package:discord_replicate/common/app_extension.dart';
import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/model/message/message.dart';
import 'package:discord_replicate/domain/model/server/server.dart';
import 'package:discord_replicate/domain/model/user/user.dart';

import 'package:rxdart/rxdart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Reactive Repository", () async {});

  test("Copy with freezed", () {
    var user = User(uid: "", about: "", avatarUrl: "", name: "", privateChannels: [], servers: []);
    var newServer = Server(id: "id", name: "name", imageUrl: "imageUrl", userGroupRef: "userGroupRef", channels: []);
    var newUser = user.copyWith(
        servers: user.servers
          ..add(newServer)
          ..toList());

    assert(newUser.servers.length == 1);
    print(user);
    print(newUser);
  });

  test("Datetime to epoch", () {
    var date = DateTime.fromMillisecondsSinceEpoch(1642674229000);
    print(date);
  });

  test("Map list of T to Key Value Pair", () {
    List<Message> list = List.generate(
      3,
      (index) {
        var random = Random().nextInt(1000);
        var message = Message(
          id: "id$random",
          date: DateTime.now(),
          message: "message$random",
          sender: Member(name: "user$random", uid: "uid$random", avatarUrl: "ava$random"),
        );
        return message;
      },
    );

    print(list.toMap(keyConverter: (element) => element.id, valueConverter: (element) => element));
    print(list.expand((element) => {element.id, element}));
    print(list.toSet());
  });

  test("Test function that returns Future.error", () async {
    var a = errorFunc();
    await expectLater(a, throwsException);
  });
}

Future errorFunc() {
  return Future.error(Exception("Error"));
}
