import 'package:discord_replicate/domain/model/message.dart';

abstract class SubscribeChannelMessageUseCase {
  Stream<Message> invoke({required String channelId});
}
