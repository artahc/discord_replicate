import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/api/paginated_response.dart';

export 'channel_repositor_impl.dart';

abstract class ChannelRepository {
  Future<Channel> getChannel(String id);
  Future<List<Channel>> getChannels();

  Future<void> saveChannel(Channel channel);
  Future<void> saveChannels(List<Channel> channels);

  Future<RawMessage> createMessage(String channelId, String message, int timestamp);
  Future<PaginationResponse<RawMessage>> getChannelMessages(String channelId, int limit, String? lastMessageId);
  Stream<RawMessage> subscribeChannelMessages(String channelId);
}
