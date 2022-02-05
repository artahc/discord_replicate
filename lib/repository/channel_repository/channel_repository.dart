import 'dart:collection';

import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/repository/repository.dart';

export 'channel_repositor_impl.dart';

class ChannelQuery {
  ChannelQuery._();

  static final String loadChannelById = r"""
    query Channel($id: String!) {
      channel(id: $id) {
        id
        name
        userGroupRef
      }
    }
  """;

  static final String loadChannelMessages = r"""
    query ChannelMessages ($channelRef: String!) {
      messages(channelRef: $channelRef) {
        id
        senderRef
        timestamp
        message
      }
    }
  """;
}

abstract class ChannelRepository extends Repository<Channel> {
  Future<RawMessage> sendMessage(String channelId, Message message);
  Future<List<RawMessage>> fetchMessages(String channelId);
  Stream<RawMessage> subscribeChannelMessages(String channelId);
}
