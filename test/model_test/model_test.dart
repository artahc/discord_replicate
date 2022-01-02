import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
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
      var roomJson = jsonDecode("""
        {
          "id": "65l2SQFgkqYRXXJyRfWT",
          "name": "Channel Room",
          "members": [
            {
              "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
              "avatarUrl": "custom-avatar-url",
              "name": "alias-name"
            }
          ],
          "messages": [
            {
              "id": "random-id-398",
              "senderId": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
              "timestamp": 1640509385,
              "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"
            }
          ]
        }
      """);
      var a = Room.fromJson(roomJson);
      expect(Room.fromJson(roomJson), throwsA(isA<ParsingException>()));
    });

    test("Parse JSON string to Room model, empty messages", () {
      var roomId = "65l2SQFgkqYRXXJyRfWT";
      var roomName = "room-name";
      var memberPool = "Xs6WqQiH2JuwPJrAZvB9";

      var userId = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";
      var userAva = "avatar-url";
      var userName = "alias-name";

      var roomJson = """
        {
          "id": "$roomId",
          "name": "$roomName",
          "memberPool": "$memberPool",
          "messages": [],
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

      var roomMap = jsonDecode(roomJson);

      var user = User(uid: userId, name: userName, avatarUrl: userAva, about: null);

      var expectedRoom = Room(
        id: roomId,
        name: roomName,
        members: [
          user,
        ],
        messages: [],
      );

      var room = Room.fromJson(roomMap);

      assert(expectedRoom == room);
      assert(listEquality.equals(room.members, expectedRoom.members));
      assert(listEquality.equals(room.messages, expectedRoom.messages));
      assert(equality.equals(room, expectedRoom));
    });

    test("Parse JSON string to Room model, no messages", () {
      var roomId = "65l2SQFgkqYRXXJyRfWT";
      var roomName = "room-name";
      var memberPool = "Xs6WqQiH2JuwPJrAZvB9";

      var userId = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";
      var userAva = "avatar-url";
      var userName = "alias-name";

      var roomJson = """
        {
          "id": "$roomId",
          "name": "$roomName",
          "memberPool": "$memberPool",
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

      var roomMap = jsonDecode(roomJson);

      var user = User(uid: userId, name: userName, avatarUrl: userAva, about: null);

      var expectedRoom = Room(
        id: roomId,
        name: roomName,
        members: [
          user,
        ],
      );

      var room = Room.fromJson(roomMap);

      assert(expectedRoom == room);
      assert(listEquality.equals(room.members, expectedRoom.members));
      assert(listEquality.equals(room.messages, expectedRoom.messages));
      assert(equality.equals(room, expectedRoom));
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

    test("Parse JSON without Server, and includes nullable field to User model", () {
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

    test("Parse JSON with empty Server, and includes nullable field to User model", () {
      var uid = "uid";
      var avatar = "avatar";
      var name = "name";
      var about = "about";

      var json = """
        {
          "uid": "$uid",
          "avatarUrl": null,
          "name": "$name",
          "about": null,
          "servers": []
        }
      """;

      var map = jsonDecode(json);
      var expectedUser = User(uid: uid, name: name, about: about, avatarUrl: avatar, servers: []);
      var user = User.fromJson(map);

      assert(user == expectedUser);
      assert(equality.equals(expectedUser, user));
    });

    test("Parse JSON with [Server, Channels] to User model", () {
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

      assert(user == expectedUser);
      assert(equality.equals(user.toJson(), expectedUser.toJson()));
    });

    test("Parse JSON with [Server, Channels and Private Rooms] to User model", () {
      var userJson = jsonDecode("""
        {
          "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
          "avatarUrl": "avat-url",
          "name": "name-hahahah",
          "about": "about-me",
          "privateRooms": [
            {
              "id": "PkM6m7lhnvIORIRuoVJv",
              "name": "Private Room",
              "members": [
                {
                  "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                  "name": "my-custom-name-in-room",
                  "avatarUrl": "custom-avatar-url-in-room"
                }
              ]
            }
          ],
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
      var expectedPrivateRoom = Room(
        id: "PkM6m7lhnvIORIRuoVJv",
        name: "Private Room",
        members: [
          User(
            uid: "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
            name: "my-custom-name-in-room",
            avatarUrl: "avatarUrl",
            about: null,
          ),
        ],
      );
      var expectedUser = User(
          uid: "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
          name: "name-hahahah",
          about: "about-me",
          avatarUrl: "avat-url",
          servers: [expectedServer],
          privateRooms: [expectedPrivateRoom]);

      var user = User.fromJson(userJson);

      assert(user == expectedUser);
      assert(equality.equals(user, expectedUser));
    });

    test("Parse JSON from remote API to User model, but not checking JSON 'user' key when. Should throw parsing error", () {
      var userJson = jsonDecode("""
      {
        "user" : {
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
      }
      """);

      expect(() => User.fromJson(userJson), throwsA(isA<ParsingException>()));
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
                "name": "Channel Room",
                "members": [
                  {
                    "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                    "name": "alias-name",
                    "avatarUrl": "custom-avatar-url"
                  }
                ],
                "messages": [
                  {
                    "id": "random-id-768",
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
                "name": "Channel Room",
                "members": [
                  {
                    "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                    "name": "alias-name",
                    "avatarUrl": "custom-avatar-url"
                  }
                ],
                "messages": [
                  {
                    "id": "random-id-419",
                    "message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
                    "senderId": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
                    "timestamp": 1640509385
                  }
                ]
              }
            }
          ],
          "members": [
            {
              "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
              "avatarUrl": "custom-avatar-url",
              "name": "alias-name"
            }
          ]
        }
      """);

      var server = Server.fromJson(serverJson);
      expect(server, isNotNull);
    });

    test("Mutate Server's lastVisit field, and compare. Compare Server, object should be equal.", () {
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

      DateTime lastVisit = DateTime.now();
      var server = Server.fromJson(serverJson);
      server.lastVisit = lastVisit;

      var expectedServer = Server(
        id: "JkBxr0EoQOYyDeXagC2h",
        imageUrl: "image-url-1",
        name: "server-name-2",
        channels: [
          Channel(id: "G0ShfA2Ky1haunzTUbxb", name: "channel-name-1", roomId: "65l2SQFgkqYRXXJyRfWT", access: ChannelAccess.PUBLIC),
          Channel(id: "GYnLIbFtyufOSfK5zuUb", name: "channel-name-2", roomId: "65l2SQFgkqYRXXJyRfWT", access: ChannelAccess.PRIVATE),
        ],
      );

      assert(server.lastVisit == lastVisit);
      assert(equality.equals(server, expectedServer));
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
