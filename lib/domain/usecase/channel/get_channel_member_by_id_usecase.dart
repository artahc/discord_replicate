import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:logger/logger.dart';

import 'get_channel_by_id_usecase.dart';

abstract class GetChannelMemberByIdUseCase {
  Future<Member> invoke({required String channelId, required String userId});
}

class GetChannelMemberByIdUseCaseImpl implements GetChannelMemberByIdUseCase {
  final Logger log = Logger();
  final GetChannelByIdUseCase _getChannelByIdUseCase;
  final UserGroupRepository _userGroupRepo;

  GetChannelMemberByIdUseCaseImpl({
    GetChannelByIdUseCase? getChannelByIdUseCase,
    UserGroupRepository? userGroupRepo,
  })  : _getChannelByIdUseCase = getChannelByIdUseCase ?? sl.get(),
        _userGroupRepo = userGroupRepo ?? sl.get();

  @override
  Future<Member> invoke({required String channelId, required String userId}) async {
    var channel = await _getChannelByIdUseCase.invoke(channelId: channelId);
    var member = await _userGroupRepo.getMemberById(channel.userGroupRef, userId).catchError((e, st) {
      log.e("Error", e, st);
    });

    return member;
  }
}
