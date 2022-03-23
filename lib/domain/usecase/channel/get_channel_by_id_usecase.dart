import 'package:discord_replicate/application/config/injection.dart';

import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';

abstract class GetChannelByIdUseCase {
  Future<Channel> invoke({required String channelId});
}
