import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';

import 'get_channel_member_by_id_usecase.dart';

abstract class SendChannelMessageUseCase {
  Future<Message> invoke({required String channelId, required String messageText, required DateTime date});
}
