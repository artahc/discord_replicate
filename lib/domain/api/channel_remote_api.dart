import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/model/message/message.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';

abstract class ChannelRemoteApi {
  Future<Channel> getChannelById(String id);
  Future<PaginationResponse<RawMessage>> getChannelMessages(String channelId, int limit, String? cursor);
  Future<RawMessage> createMessage(String channelId, String message, int timestamp);
  Stream<RawMessage> subscribeChannelMessage(String channelId);
}
