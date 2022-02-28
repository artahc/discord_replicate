import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/model/message/message.dart';

import 'package:get_it/get_it.dart';

abstract class ChannelRepository implements Disposable {
  Future<Channel> getChannel(String id);
  Future<List<Channel>> getChannels();
  Future<void> saveChannel(Channel channel);
  Future<void> saveChannels(List<Channel> channels);
  Future<RawMessage> createMessage(String channelId, String message, int timestamp);
  Future<PaginationResponse<RawMessage>> getChannelMessages(String channelId, int limit, String? lastMessageId);
  Stream<RawMessage> subscribeChannelMessages(String channelId);
}
