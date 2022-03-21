import 'package:discord_replicate/application/config/configuration.dart';

import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart';

class GetChannelByIdUseCaseImpl implements GetChannelByIdUseCase {
  final ChannelRepository _channelRepo;

  GetChannelByIdUseCaseImpl({ChannelRepository? channelRepo}) : _channelRepo = channelRepo ?? sl.get();

  @override
  Future<Channel> invoke({required String channelId}) => _channelRepo.getChannel(channelId);
}
