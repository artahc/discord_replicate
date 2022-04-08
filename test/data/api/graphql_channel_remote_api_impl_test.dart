import 'dart:convert';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/query/get_channel_messages_operation.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/query/get_channel_query_operation.dart';
import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart';
import 'package:discord_replicate/data/mapper/channel_mapper.dart';
import 'package:discord_replicate/data/mapper/message_mapper.dart';
import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:discord_replicate/data/model/message_model.dart';
import 'package:discord_replicate/domain/api/channel_remote_api.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockChannelModel extends Mock implements ChannelModel {}

void main() async {
  final container = GetIt.asNewInstance();
  configureDependencies(container, Env.TEST);

  // dependencies
  final GraphQLClientHelper mockClient = container.get();
  final MessageMapper mockMessageMapper = container.get();
  final ChannelMapper mockChannelMapper = container.get();

  // class under test
  final ChannelRemoteApi api = GraphQLChannelRemoteApiImpl(mockClient, mockMessageMapper, mockChannelMapper);

  test(
    """
    Given 2 identical GraphQL operation,
    When both are compared,
    Then result must be true
    """,
    () async {
      var q1 = GetChannelQuery(id: "someId", memberLimit: 15);
      var q2 = GetChannelQuery(id: "someId", memberLimit: 15);

      assert(q1 == q2);
    },
  );

  test(
    """
    Given a mock graphql client,
    When query executed,
    Then return mocked data 
    """,
    () async {
      var query = GetChannelQuery(id: "id", memberLimit: 15);
      var expectedData = {"data": "someData"};
      when(() => mockClient.query(query)).thenAnswer((invocation) => Future.value(expectedData));

      expect(mockClient.query(query), completion(expectedData));
    },
  );

  test(
    """
    Given ChannelRemoteAPI,
    When getChannelMessage called,
    Then result should be mapped to PaginatedResponse<Message>
    """,
    () async {
      // arrange
      var query = GetChannelMessagesQuery(channelId: "someId", lastMessageId: "someMessageId", limit: 30);
      var json = jsonDecode("""
        {
          "messages": {
            "hasMore": true,
            "previousCursor": "someMessageId",
            "items": [
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
            ]
          }
        }
      """);

      when(() => mockClient.query(query)).thenAnswer((invocation) => Future.value(json));

      var future = api.getChannelMessages("someId", 30, "someMessageId");
      expect(
        future,
        completion(
          allOf([
            isA<PaginationResponse<Message>>(),
            predicate(
              (PaginationResponse<Message> v) => v.cursor == "someMessageId" && v.hasMore && v.items.length == 5,
            ),
          ]),
        ),
      );
      expect(future, completes);
    },
  );

  test("""
  Given ChannelRemoteApi graphql implementation,
  When 
  """, () async {
    // api.createMessage("channelId", "message", DateTime.now().millisecondsSinceEpoch);
  });
}
