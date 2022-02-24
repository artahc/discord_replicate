
import 'package:discord_replicate/api/graphql_client_helper.dart';

class GetChannelQuery extends GraphQLOperation {
  final String id;
  final int memberLimit;

  GetChannelQuery({required this.id, required this.memberLimit});

  @override
  String get operation => r"""
    query Channel($id: String!) {
      channel(id: $id) {
        id
        name
        userGroupRef
      }
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "id": id,
      "memberLimit": 30,
    };
  }
}

class GetServerQuery extends GraphQLOperation {
  final String id;

  GetServerQuery({required this.id});

  @override
  String get operation => r"""
    query Server($id: String!) {
      server(id: $id) {
        id
        name
        imageUrl
        userGroupRef
        channels {
          id
          name
          userGroupRef
        }
      }
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "id": id,
    };
  }
}

class GetUserGroupQuery extends GraphQLOperation {
  final String userGroupId;
  final int limit;
  final String? cursor;

  GetUserGroupQuery({required this.userGroupId, required this.limit, required this.cursor});

  @override
  String get operation => r"""
    query UserGroup($userGroupRef: ID!, $limit: Int!, $cursor: String) {
      userGroup(userGroupRef: $userGroupRef, limit: $limit, cursor: $cursor) {
        items {
          uid
          name
          avatarUrl
        }
        hasMore
      }
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "userGroupRef": userGroupId,
      "limit": 50,
      "cursor": null,
    };
  }
}

class GetUserQuery extends GraphQLOperation {
  final String uid;

  GetUserQuery({required this.uid});

  @override
  String get operation => r"""
    query User($uid: String!) {
      user(uid: $uid) {
        uid
        avatarUrl
        name
        about
        privateChannels {
          id
          name
          userGroupRef
        }
        servers {
          id
          name
          imageUrl
          userGroupRef
          channels {
            id
            name
            userGroupRef
          }
        }
      }
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      'uid': uid,
    };
  }
}

class CreateMessageMutation extends GraphQLOperation {
  final String message;
  final String channelId;
  final int timestamp;

  CreateMessageMutation({required this.message, required this.channelId, required this.timestamp});

  @override
  String get operation => r"""
    mutation Mutation($input: MessageInput!) {
        createMessage(input: $input) {
          id
          senderRef
          timestamp
          message
        }
      }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "input": {
        "channelRef": channelId,
        "message": message,
        "timestamp": timestamp,
      }
    };
  }
}

class SubscribeChannelMessageSubscription extends GraphQLOperation {
  final String channelId;

  SubscribeChannelMessageSubscription({required this.channelId});

  @override
  String get operation => r"""
    subscription OnMessageCreated($channelRef: String!) {
      onNewMessage(channelRef: $channelRef) {
        topic
        channelRef
        payload {
          id
          senderRef
          timestamp
          message
        }
      }
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "channelRef": channelId,
    };
  }
}

class GetChannelMessagesQuery extends GraphQLOperation {
  final String channelId;
  final String? lastMessageId;
  final int limit;

  GetChannelMessagesQuery({required this.channelId, required this.lastMessageId, required this.limit});

  @override
  String get operation => r"""
    query Messages($channelRef: String!, $cursor: String, $limit: Int!) {
      messages(channelRef: $channelRef, cursor: $cursor, limit: $limit) {
        items {
          id
          senderRef
          timestamp
          message
        }
        hasMore
        previousCursor
      }
    }
  """;

  @override
  Map<String, dynamic> get variables {
    return {
      "channelRef": channelId,
      "cursor": lastMessageId,
      "limit": limit,
    };
  }
}
