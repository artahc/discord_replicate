import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/repository/channel_repository/channel_repository.dart';

abstract class GetChannelByIdUseCase {
  Future<Channel> invoke({required String channelId});
}

class GetChannelByIdUseCaseImpl implements GetChannelByIdUseCase {
  final ChannelRepository _channelRepo;

  GetChannelByIdUseCaseImpl({ChannelRepository? channelRepo}) : _channelRepo = channelRepo ?? sl.get();

  @override
  Future<Channel> invoke({required String channelId}) => _channelRepo.getChannel(channelId);
}
