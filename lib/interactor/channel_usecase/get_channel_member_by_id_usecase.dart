import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/interactor/channel_usecase/get_channel_by_id_usecase.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/repository/store.dart';

abstract class GetChannelMemberByIdUseCase {
  Future<Member> invoke({required String channelId, required String userId});
}

class GetChannelMemberByIdUseCaseImpl implements GetChannelMemberByIdUseCase {
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
    var member = await _userGroupRepo.getMemberById(channel.userGroupRef, userId);

    return member;
  }
}
