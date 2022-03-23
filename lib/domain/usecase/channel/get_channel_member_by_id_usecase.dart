import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';

import 'get_channel_by_id_usecase.dart';

abstract class GetChannelMemberByIdUseCase {
  Future<Member> invoke({required String channelId, required String userId});
}
