import 'package:discord_replicate/domain/model/channel.dart';

abstract class GetChannelByIdUseCase {
  Future<Channel> invoke({required String channelId});
}
