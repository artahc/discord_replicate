import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';

import 'get_channel_by_id_usecase.dart';

abstract class GetAllChannelMemberUseCase {
  Future<List<Member>> invoke({required String channelId});
}
