import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';

abstract class ChannelRemoteApi {
  Future<Channel> getChannelById(String id, {int memberLimit = 30});
  Future<PaginationResponse<Message>> getChannelMessages(String channelId, int limit, String? cursor);
  Future<Message> createMessage(String channelId, String message, int timestamp);
  Stream<Message> subscribeChannelMessage(String channelId);
}
