import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:get_it/get_it.dart';

abstract class ChannelRepository implements Disposable {
  Future<Channel> getChannelById(String id);
  Future<Iterable<Channel>> getAllChannels();
  Future<void> saveChannel(Channel channel);
  Future<void> saveAllChannels(Iterable<Channel> channels);
  Future<void> deleteChannel(String channelId);
  Future<void> deleteAllChannel(Iterable<String> channelIds);

  Future<Message> createMessage(String channelId, String message, int timestamp);
  Future<PaginationResponse<Message>> getChannelMessages(String channelId, int limit, String? lastMessageId);
  Stream<Message> subscribeChannelMessages(String channelId);
}
