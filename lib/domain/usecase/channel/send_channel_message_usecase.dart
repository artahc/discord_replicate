import 'package:discord_replicate/domain/model/message.dart';

abstract class SendChannelMessageUseCase {
  Future<Message> invoke({required String channelId, required String messageText, required DateTime date});
}
