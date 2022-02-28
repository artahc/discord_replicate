import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/interactor/channel_usecase/get_channel_by_id_usecase.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/repository/store.dart';

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
    var userGroup = await _userGroupRepo.getUserGroup(channel.userGroupRef);
    return userGroup.members.values.toList();
  }
}
