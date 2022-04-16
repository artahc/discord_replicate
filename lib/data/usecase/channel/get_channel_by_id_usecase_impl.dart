import 'package:discord_replicate/application/config/injection.dart';

import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetChannelByIdUseCase, env: [Env.PROD, Env.DEV])
class GetChannelByIdUseCaseImpl implements GetChannelByIdUseCase {
  final ChannelRepository _channelRepo;

  GetChannelByIdUseCaseImpl(this._channelRepo);

  @override
  Future<Channel> invoke({required String channelId}) => _channelRepo.getChannelById(channelId);
}
