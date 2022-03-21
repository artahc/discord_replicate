import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';

import 'get_channel_member_by_id_usecase.dart';

abstract class GetChannelMessagesUseCase {
  Future<PaginationResponse<Message>> invoke({required String channelId, int limit = 30, String? lastMessageId});
}
