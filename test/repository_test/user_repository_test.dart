import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:discord_replicate/model/credential.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/auth_service.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks([GraphQLClientHelper, HiveDatabaseHelper, Box])
Future main() async {
  var equality = DeepCollectionEquality.unordered();
  group("User Repository", () {
    var mockClient = MockGraphQLClientHelper();
    var mockDb = MockHiveDatabaseHelper();
    var mockBox = MockBox<User>();
    var mockUserRepo = UserRepository(apiClient: mockClient, database: mockDb);

    var api = GraphQLClientHelper(
      url: "http://localhost:4000",
      tokenProvider: () => Future.value(Credential(email: "", token: "", uid: "")),
      defaultHeader: {'allow-me-in': "artahc123"},
    );
    var userRepo = UserRepository(apiClient: api, database: mockDb);

    test("Load user from remote includes Server and Channel, should be able parse GraphQL result to User model.", () async {
      String query = UserQuery.loadUser;
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

      when(mockClient.query(query, variables: variables)).thenAnswer((_) async => userJson);
      when(mockDb.getBox<User>('user')).thenAnswer((_) async => mockBox);
      when(mockBox.get(uid)).thenReturn(null);

      var expectedUser = await mockUserRepo.loadUser(uid);
      var user = await userRepo.loadUser(uid);

      assert(user == expectedUser);
      assert(equality.equals(user, expectedUser));
    });
  });
}
