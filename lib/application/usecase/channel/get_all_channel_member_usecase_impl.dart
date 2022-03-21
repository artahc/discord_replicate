import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:discord_replicate/domain/usecase/channel/get_all_channel_member_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart';

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
