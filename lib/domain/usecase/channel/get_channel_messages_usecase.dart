import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/message.dart';

abstract class GetChannelMessagesUseCase {
  Future<PaginationResponse<Message>> invoke({required String channelId, int limit = 30, String? lastMessageId});
}
