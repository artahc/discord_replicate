import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/credential.dart';
import 'package:discord_replicate/model/room.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/room_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../bloc_test/user_bloc_test.mocks.dart';

@GenerateMocks([GraphQLClientHelper, HiveDatabaseHelper, Box])
Future main() async {
  HiveDatabaseHelper.initialize();
  var equality = DeepCollectionEquality.unordered();
  var api = GraphQLClientHelper(
    url: "http://localhost:4000",
    tokenProvider: () => Future.value(Credential(email: "", token: "", uid: "")),
    defaultHeader: {'allow-me-in': "artahc123"},
  );
  var db = HiveDatabaseHelper();

  group("User Repository", () {
    var mockClient = MockGraphQLClientHelper();
    var mockDb = MockHiveDatabaseHelper();
    var mockUserRepo = UserRepository(apiClient: mockClient, database: mockDb);

    var userRepo = UserRepository(apiClient: api, database: db);

    test("Load user from remote includes Server and Channel, should be able parse GraphQL result to User model.", () async {
      String query = UserQuery.loadById;
      var uid = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";
      var variables = {
        "uid": uid,
      };

      Map<String, dynamic> userJson = jsonDecode("""
        {
          "user": {
            "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
            "avatarUrl": "avat-url",
            "name": "name-hahahah",
            "about": "about-me",
            "servers": [
              {
                "id": "JkBxr0EoQOYyDeXagC2h",
                "name": "server-name-2",
                "imageUrl": "image-url-1",
                "userGroupId": "Xs6WqQiH2JuwPJrAZvB9",
                "channels": [
                  {
                    "id": "G0ShfA2Ky1haunzTUbxb",
                    "name": "channel-name-1",
                    "access": "PUBLIC",
                    "room": {
                      "id": "G0ShfA2Ky1haunzTUbxb"
                    }
                  }
                ]
              }
            ]
          }
        }
      """);

      when(mockDb.get<User>(HiveConstants.USER_BOX, uid)).thenAnswer((_) async => User.fromJson(userJson['user']));
      when(mockClient.query(query, variables: variables)).thenAnswer((_) async => userJson);

      var expectedUser = await mockUserRepo.load(uid);
      var user = await userRepo.load(uid);

      assert(user == expectedUser);
      assert(equality.equals(user, expectedUser));
    });

    test("Load non existent User, remote API throws NotFoundException, should be able to mapError and handled on call site.", () async {
      String query = UserQuery.loadById;
      var uid = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";
      var variables = {
        "uid": uid,
      };

      when(mockClient.query(query, variables: variables)).thenAnswer((_) => Future.error(NotFoundException('Not found in server')));
      when(mockDb.get<User>(HiveConstants.USER_BOX, uid)).thenAnswer((_) async => null);
      var futureUser = mockUserRepo.load(uid);

      await expectLater(
        futureUser,
        allOf([
          throwsA(predicate((e) => e is NotFoundException && e.message == "User not found.")),
        ]),
      );
    });

    test('Load User from local database. Verify remote API doesnt get called', () async {
      String query = UserQuery.loadById;
      var uid = "FMYbWPwFWgTvRemhbbz1dLL9HkC2";
      var variables = {
        "uid": uid,
      };

      Map<String, dynamic> userJson = jsonDecode("""
        {
          "user": {
            "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
            "avatarUrl": "avat-url",
            "name": "name-hahahah",
            "about": "about-me",
            "servers": [
              {
                "id": "JkBxr0EoQOYyDeXagC2h",
                "name": "server-name-2",
                "imageUrl": "image-url-1",
                "userGroupId": "Xs6WqQiH2JuwPJrAZvB9",
                "channels": [
                  {
                    "id": "G0ShfA2Ky1haunzTUbxb",
                    "name": "channel-name-1",
                    "access": "PUBLIC",
                    "room": {
                      "id": "G0ShfA2Ky1haunzTUbxb"
                    }
                  }
                ]
              }
            ]
          }
        }
      """);

      when(mockDb.get<User>(HiveConstants.USER_BOX, uid)).thenAnswer((_) async => User.fromJson(userJson['user']));
      when(mockClient.query(query, variables: variables)).thenAnswer((realInvocation) async => userJson);

      var expected = User.fromJson(userJson['user']);
      var user = await mockUserRepo.load(uid);

      verifyNever(mockClient.query(query, variables: variables));

      assert(user == expected);
      assert(equality.equals(user, expected));
    });
  });

  group("Room Repository", () {
    var roomRepo = RoomRepository(apiClient: api, database: db);
    test("Load Room from remote, should be able to parse result to Room model.", () async {
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

      var expectedRoom = Room.fromJson(roomJson);
      var room = await roomRepo.load("65l2SQFgkqYRXXJyRfWT");

      assert(equality.equals(room, expectedRoom));
    });
  });
}
