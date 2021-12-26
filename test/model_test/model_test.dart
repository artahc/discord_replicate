import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/model/room.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart' as mockito;

main() {
  var listEquality = ListEquality();
  var mapEquality = MapEquality();
  var equality = DeepCollectionEquality.unordered();

  group("Room Model", () {
    test("Parse JSON string to Room model", () {
      var roomId = "65l2SQFgkqYRXXJyRfWT";
      var roomName = "room-name";
      var memberPool = "Xs6WqQiH2JuwPJrAZvB9";

      var userId = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";
      var userAva = "avatar-url";
      var userName = "alias-name";
      var userAbout = null;

      var messageId = "message-id-580";
      var messagePayload = "message";
      var messageSenderId = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";
      var messageTimestamp = 1640509385;

      var roomJson = """
      {
        "id": "$roomId",
        "name": "$roomName",
        "memberPool": "$memberPool",
        "messages": [
          {
            "id": "$messageId",
            "senderId": "$messageSenderId",
            "timestamp": $messageTimestamp,
            "message": "$messagePayload"
          }
        ],
        "members": [
          {
            "uid": "$userId",
            "avatarUrl": "$userAva",
            "name": "$userName",
            "about": null
          }
        ]
      }
    """;

      var messageJson = """
      {
        "id": "$messageId",
        "senderId": "$messageSenderId",
        "timestamp": $messageTimestamp,
        "message": "$messagePayload"
      }
    """;

      var roomMap = jsonDecode(roomJson);
      var messageMap = jsonDecode(messageJson);

      var user = User(uid: userId, name: userName, avatarUrl: userAva, about: userAbout);
      var message = Message.fromJson(messageMap);

      var expectedRoom = Room(
        id: roomId,
        name: roomName,
        members: [
          user,
        ],
        messages: [
          message,
        ],
      );

      var room = Room.fromJson(roomMap);

      print(room.messages);
      print(expectedRoom.messages);

      assert(expectedRoom == room);
      assert(listEquality.equals(room.members, expectedRoom.members));
      assert(listEquality.equals(room.messages, expectedRoom.messages));
    });
  });

  group("User Model", () {
    test("Parse JSON without Server to User model", () {
      var uid = "uid";
      var avatar = "avatar";
      var name = "name";
      var about = "about";

      var json = """
      {
        "uid": "$uid",
        "avatarUrl": "$avatar",
        "name": "$name",
        "about": "$about"
      }
    """;

      var map = jsonDecode(json);
      var expectedUser = User(uid: uid, name: name, about: about, avatarUrl: avatar);
      var user = User.fromJson(map);

      assert(user == expectedUser);
      assert(mapEquality.equals(map, user.toJson()));
    });

    test("Parse JSON without Server with NULL to User model", () {
      var uid = "uid";
      var avatar = "avatar";
      var name = "name";
      var about = "about";

      var json = """
      {
        "uid": "$uid",
        "avatarUrl": null,
        "name": "$name",
        "about": null
      }
    """;

      var map = jsonDecode(json);
      var expectedUser = User(uid: uid, name: name, about: about, avatarUrl: avatar);
      var user = User.fromJson(map);

      assert(user == expectedUser);
      assert(mapEquality.equals(map, user.toJson()));
    });

    test("Parse JSON with Server and Channels to User model", () {
      var userJson = jsonDecode("""
        {
          "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
          "avatarUrl": "avat-url",
          "name": "name-hahahah",
          "about": "about-me",
          "servers": [
            {
              "id": "JkBxr0EoQOYyDeXagC2h",
              "name": "server-name-2",
              "imageUrl": "image-url-1",
              "channels": [
                {
                  "id": "G0ShfA2Ky1haunzTUbxb",
                  "name": "channel-name-1",
                  "access": "PUBLIC",
                  "room": {
                    "id": "65l2SQFgkqYRXXJyRfWT"
                  }
                },
                {
                  "id": "GYnLIbFtyufOSfK5zuUb",
                  "name": "channel-name-2",
                  "access": "PRIVATE",
                  "room": {
                    "id": "65l2SQFgkqYRXXJyRfWT"
                  }
                }
              ]
            }
          ]
        }
      """);

      var expectedChannel = Channel(id: "G0ShfA2Ky1haunzTUbxb", name: "channel-name-1", roomId: "65l2SQFgkqYRXXJyRfWT", access: ChannelAccess.PUBLIC);
      var expectedServer = Server(id: "JkBxr0EoQOYyDeXagC2h", name: "server-name-2", imageUrl: "image-url-1", channels: [expectedChannel]);
      var expectedUser = User(
        uid: "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
        name: "name-hahahah",
        about: "about-me",
        avatarUrl: "avat-url",
        servers: [expectedServer],
      );
      var user = User.fromJson(userJson);

      print("${user.toJson()} \n ${expectedUser.toJson()}");

      assert(user == expectedUser);
      assert(equality.equals(user.toJson(), expectedUser.toJson()));
    });
  });

  group("Server Model", () {
    test("Parse JSON string to Server Model, includes Channel and Room", () {
      var serverJson = jsonDecode("""
        {
          "id": "JkBxr0EoQOYyDeXagC2h",
          "name": "server-name-2",
          "imageUrl": "image-url-1",
          "channels": [
            {
              "id": "G0ShfA2Ky1haunzTUbxb",
              "name": "channel-name-1",
              "access": "PUBLIC",
              "room": {
                "id": "65l2SQFgkqYRXXJyRfWT",
                "name": "room-name",
                "members": [
                  {
                    "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                    "name": "alias-name",
                    "avatarUrl": "custom-avatar-url",
                    "about": null
                  }
                ],
                "messages": [
                  {
                    "id": "random-id-495",
                    "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                    "senderId": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                    "timestamp": 1640509385
                  }
                ]
              }
            },
            {
              "id": "GYnLIbFtyufOSfK5zuUb",
              "name": "channel-name-2",
              "access": "PRIVATE",
              "room": {
                "id": "65l2SQFgkqYRXXJyRfWT",
                "name": "room-name",
                "members": [
                  {
                    "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                    "name": "alias-name",
                    "avatarUrl": "custom-avatar-url",
                    "about": null
                  }
                ],
                "messages": [
                  {
                    "id": "random-id-452",
                    "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                    "senderId": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                    "timestamp": 1640509385
                  }
                ]
              }
            }
          ]
        }
      """);

      var server = Server.fromJson(serverJson);
      assert(server.id == "JkBxr0EoQOYyDeXagC2h");
      assert(server.name == "server-name-2");
      assert(server.imageUrl == "image-url-1");
      assert(server.channels.length == 2);
    });
  });

  group("Channel Model", () {
    test("Parse JSON string to Channel Model, includes Room, Messages, and Members", () {
      var channelJson = jsonDecode("""
        {
          "id": "G0ShfA2Ky1haunzTUbxb",
          "name": "channel-name-1",
          "access": "PUBLIC",
          "room": {
            "id": "65l2SQFgkqYRXXJyRfWT",
            "name": "room-name",
            "members": [
              {
                "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                "name": "alias-name",
                "avatarUrl": "custom-avatar-url",
                "about": null
              }
            ],
            "messages": [
              {
                "id": "random-id-495",
                "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                "senderId": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                "timestamp": 1640509385
              }
            ]
          }
        }
      """);

      var channel = Channel.fromJson(channelJson);

      assert(channel.id == "G0ShfA2Ky1haunzTUbxb");
      assert(channel.name == "channel-name-1");
      assert(channel.access == ChannelAccess.PUBLIC);
      assert(channel.roomId == "65l2SQFgkqYRXXJyRfWT");
    });
  });
}
