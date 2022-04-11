import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:get_it/get_it.dart';

abstract class ChannelRepository implements Disposable {
  Future<Channel> getChannel(String id, {int memberLimit = 30});
  Future<List<Channel>> getAllChannels();
  Future<void> saveChannel(Channel channel);
  Future<void> saveAllChannels(List<Channel> channels);
  Future<void> deleteChannel(String channelId);
  Future<void> deleteAllChannel(List<String> channelIds);

  Future<Message> createMessage(String channelId, String message, int timestamp);
  Future<PaginationResponse<Message>> getChannelMessages(String channelId, int limit, String? lastMessageId);
  Stream<Message> subscribeChannelMessages(String channelId);
}
