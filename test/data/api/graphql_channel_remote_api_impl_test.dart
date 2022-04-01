import 'dart:convert';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart';
import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late GraphQLClientHelper client;

  group("description", () {
    setUpAll(() async {
      await Firebase.initializeApp();
      configureDependencies(Env.TEST);
      client = sl.get<GraphQLClientHelper>();
    });

    test('something something', () async {
      // arrange
      var api = GraphQLChannelRemoteApiImpl(client, sl.get(), sl.get());

      var json = jsonDecode("""
        "channel": {
          "id": "PkM6m7lhnvIORIRuoVJv",
          "name": "User Private Room",
          "userGroupRef": "1w5YE2dlu1sUtuijapSL",
          "messages": [
            {
              "id": "4581c8d0-1c60-4830-a8a5-119f8ab0c5f1",
              "senderRef": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
              "timestamp": 1645897390347,
              "message": "hi"
            },
            {
              "id": "4330603a-4b4a-484c-8c28-a43bd079100f",
              "senderRef": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
              "timestamp": 1645897419086,
              "message": "anjiay"
            },
            {
              "id": "baff32bf-e6b3-4d65-a6a5-0231e698de75",
              "senderRef": "FfqV97rgqShPFIC0nr43Ep59jb13",
              "timestamp": 1645897449707,
              "message": "anjay"
            },
            {
              "id": "1e59824b-807e-4511-a0b2-a9ecd84363dc",
              "senderRef": "FfqV97rgqShPFIC0nr43Ep59jb13",
              "timestamp": 1645897461565,
              "message": "halo halo bang"
            },
            {
              "id": "af6a0c83-a559-4353-8d26-ed2b31915970",
              "senderRef": "FfqV97rgqShPFIC0nr43Ep59jb13",
              "timestamp": 1645897500533,
              "message": "anjroet"
            },
            {
              "id": "300ebb70-4e8a-47f6-8bde-c32d7f665cc6",
              "senderRef": "FfqV97rgqShPFIC0nr43Ep59jb13",
              "timestamp": 1645897657063,
              "message": "vv"
            }
          ],
          "members": [
            {
              "uid": "FfqV97rgqShPFIC0nr43Ep59jb13",
              "name": "Another me",
              "avatarUrl": ""
            },
            {
              "uid": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
              "name": "artahc",
              "avatarUrl": "mycustomavatarurl"
            }
          ]
        }
      """);

      when(() => client.query(any())).thenAnswer((realInvocation) async => Future.value(json));

      // execute
      final value = await api.getChannelById("id");

      // assert
      expect(value, isA<ChannelModel>());
    });
  });
}
