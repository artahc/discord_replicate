import 'package:discord_replicate/common/app_config.dart';

import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';

abstract class GetChannelByIdUseCase {
  Future<Channel> invoke({required String channelId});
}

class GetChannelByIdUseCaseImpl implements GetChannelByIdUseCase {
  final ChannelRepository _channelRepo;

  GetChannelByIdUseCaseImpl({ChannelRepository? channelRepo}) : _channelRepo = channelRepo ?? sl.get();

  @override
  Future<Channel> invoke({required String channelId}) => _channelRepo.getChannel(channelId);
}
