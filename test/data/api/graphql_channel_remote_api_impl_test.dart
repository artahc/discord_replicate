import 'dart:async';
import 'dart:convert';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/mutation/create_channel_message_operation.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/query/get_channel_messages_operation.dart';
import 'package:discord_replicate/data/api/client/graphql_operation/subscription/subscribe_channel_message_subscription.dart';
import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart';
import 'package:discord_replicate/data/mapper/channel_mapper.dart';
import 'package:discord_replicate/data/mapper/message_mapper.dart';
import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:discord_replicate/data/model/message_model.dart';
import 'package:discord_replicate/domain/api/channel_remote_api.dart';
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

  test("""
  Given ChannelRemoteAPI,
  When getChannelMessage called,
  Then result should be mapped to PaginatedResponse<Message>
  """, () async {
    // arrange
    var operation = GetChannelMessagesQuery(channelId: "someId", lastMessageId: "someMessageId", limit: 30);
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

    when(() => mockClient.query(operation)).thenAnswer((invocation) => Future.value(json));

    // execute
    var future = api.getChannelMessages("someId", 30, "someMessageId");

    // assert
    verify(() => mockClient.query(operation)).called(1);
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
  });

  test("""
  Given ChannelRemoteApi graphql implementation,
  When createMessage called,
  Then function must return MessageEntity
  """, () async {
    // arrange
    var ts = DateTime.now().millisecondsSinceEpoch;
    var jsonResponse = jsonDecode("""
      {
        "createMessage": {
          "id": "1ab77f4e-72de-4192-bf73-2a5ad63d124f",
          "senderRef": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
          "timestamp": 1649508386000,
          "message": "test ahahha"
        }
      }
    """);
    var operation = CreateMessageMutation(message: "message", channelId: "channelId", timestamp: ts);

    when(() => mockClient.mutate(operation)).thenAnswer((invocation) => Future.value(jsonResponse));

    // execute
    var future = api.createMessage("channelId", "message", ts);

    // assert
    verify(() => mockClient.mutate(operation)).called(1);
    expect(
      future,
      completion(
        allOf([
          isA<Message>(),
        ]),
      ),
    );
    expect(future, completes);
  });

  test("""
  Given ChannelRemoteApi graphql implementation,
  When subscribeMessage called,
  Then function must return stream and emit Message entity when socket publish new message.
  """, () async {
    StreamController<Map<String, dynamic>> mockStreamCtrl = StreamController();

    var firstJsonResponse = jsonDecode("""
      {
        "onNewMessage": {
          "topic": "OnMessageCreated",
          "payload": {
            "id": "e8779d4f-506f-4e44-a826-b6aef8a590cb",
            "senderRef": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
            "timestamp": 1649508386000,
            "message": "test ahahha"
          },
          "channelRef": "PkM6m7lhnvIORIRuoVJv"
        }
      }
    """);

    var secondJsonResponse = jsonDecode("""
      {
        "onNewMessage": {
          "topic": "OnMessageCreated",
          "payload": {
            "id": "e8779d4f-506f-4e44-a826-b6aef8a280cb",
            "senderRef": "FMYbWPwFWgTvRemhbbz1dLL9HkC2",
            "timestamp": 1649508395000,
            "message": "second message"
          },
          "channelRef": "PkM6m7lhnvIORIRuoVJv"
        }
      }
    """);
    var firstMessage = MessageMapper().map(MessageModel.fromJson(firstJsonResponse["onNewMessage"]["payload"]));
    var secondMessage = MessageMapper().map(MessageModel.fromJson(secondJsonResponse["onNewMessage"]["payload"]));

    // arrange
    when(() => mockClient.subscribe(SubscribeChannelMessageSubscription(channelId: "channelId")))
        .thenAnswer((invocation) => mockStreamCtrl.stream);

    // execute
    var stream = api.subscribeChannelMessage("channelId");

    // assert
    expectLater(
      stream,
      allOf([
        emitsInOrder([firstMessage, secondMessage]),
      ]),
    );
    mockStreamCtrl.sink.add(firstJsonResponse);
    mockStreamCtrl.sink.add(secondJsonResponse);
  });
}
