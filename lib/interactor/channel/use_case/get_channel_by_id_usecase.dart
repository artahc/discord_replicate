import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/repository/channel_repository/channel_repository.dart';
import 'package:discord_replicate/app_config.dart';

class GetChannelByIdUseCase {
  final ChannelRepository _channelRepo;

  GetChannelByIdUseCase({ChannelRepository? channelRepo}) : _channelRepo = channelRepo ?? sl();

  Future<Channel> invoke({required String id}) {
    return _channelRepo.getChannel(id);
  }
}
