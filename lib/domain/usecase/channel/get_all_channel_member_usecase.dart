import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';

import 'get_channel_by_id_usecase.dart';

abstract class GetAllChannelMemberUseCase {
  Future<List<Member>> invoke({required String channelId});
}

class GetAllChannelMemberUseCaseImpl implements GetAllChannelMemberUseCase {
  final UserGroupRepository _userGroupRepo;
  final GetChannelByIdUseCase _getChannelByIdUseCase;

  GetAllChannelMemberUseCaseImpl({
    UserGroupRepository? userGroupRepo,
    GetChannelByIdUseCase? getChannelByIdUseCase,
  })  : _userGroupRepo = userGroupRepo ?? sl.get(),
        _getChannelByIdUseCase = getChannelByIdUseCase ?? sl.get();

  @override
  Future<List<Member>> invoke({required String channelId}) async {
    var channel = await _getChannelByIdUseCase.invoke(channelId: channelId);
    var members = await _userGroupRepo.getAllMember(channel.userGroupRef);
    return members;
  }
}
