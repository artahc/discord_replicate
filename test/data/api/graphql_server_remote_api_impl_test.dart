import 'dart:convert';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/query/get_server_operation.dart';
import 'package:discord_replicate/data/api/graphql_server_remote_api_impl.dart';
import 'package:discord_replicate/data/mapper/server_mapper.dart';
import 'package:discord_replicate/domain/api/server_remote_api.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final container = GetIt.asNewInstance();
  configureDependencies(container, Env.TEST);

  // dependencies
  final GraphQLClientHelper client = container.get();
  final ServerMapper serverMapper = container.get();

  // class under test
  final ServerRemoteApi api = GraphQLServerRemoteApiImpl(client, serverMapper);

  test("""
  Given ServerRemoteApi graphql implementation,
  When getServerById called,
  Then process should completes and return Server entity.
  """, () async {
    // arrange
    var json = jsonDecode("""
      {
        "server": {
          "id": "JkBxr0EoQOYyDeXagC2h",
          "name": "Server Name",
          "imageUrl": "someserverimgurl",
          "userGroupRef": "Xs6WqQiH2JuwPJrAZvB9",
          "channels": [
            {
              "id": "65l2SQFgkqYRXXJyRfWT",
              "name": "Channel Room",
              "userGroupRef": "Xs6WqQiH2JuwPJrAZvB9"
            }
          ],
          "members": [
            {
              "uid": "FfqV97rgqShPFIC0nr43Ep59jb13",
              "name": "Another me",
              "avatarUrl": ""
            },
            {
              "uid": "IhRupHvOPIO9SQOYxIKMeeezjQs1",
              "name": "a",
              "avatarUrl": ""
            },
            {
              "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
              "name": "artahc",
              "avatarUrl": "mycustomavatarurl"
            },
            {
              "uid": "QjyuiSa9Dve1eDtd9Yw4jhXUK9D3",
              "name": "b",
              "avatarUrl": ""
            },
            {
              "uid": "MahytDH0t7dYUlzgB7ezABQbzBT2",
              "name": "c",
              "avatarUrl": ""
            },
            {
              "uid": "fVKmH8cHRENpsnetwXdjZOtWoXM2",
              "name": "d",
              "avatarUrl": ""
            },
            {
              "uid": "pEICVb7kZ4fTBAawY0UW1XCJrzl2",
              "name": "e",
              "avatarUrl": ""
            },
            {
              "uid": "kPJ2QRXwYEf7UkwoffPlcxaEbmz2",
              "name": "f",
              "avatarUrl": ""
            },
            {
              "uid": "rA1f58ab6bd2gBM1Upu5xQIPCQy2",
              "name": "g",
              "avatarUrl": ""
            },
            {
              "uid": "tBbqk7V3F4gtS9riZXZpKK0xgJH3",
              "name": "i",
              "avatarUrl": ""
            }
          ]
        }
      }
      """);

    when(() => client.query(GetServerQuery(id: "someid"))).thenAnswer((invocation) async => json);

    // execute
    final future = api.getServerById("someid");

    // assert
    expect(
      future,
      completion(
        allOf([
          isA<Server>(),
        ]),
      ),
    );
    expect(future, completes);
  });
}
