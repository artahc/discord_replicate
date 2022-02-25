import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/app_config.dart';

class GetAllChannelMembersUseCase {
  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  GetAllChannelMembersUseCase({ChannelRepository? channelRepo, UserGroupRepository? userGroupRepo})
      : _channelRepo = channelRepo ?? sl(),
        _userGroupRepo = userGroupRepo ?? sl();

  Future<List<Member>> invoke({required String channelId}) async {
    var channel = await _channelRepo.getChannel(channelId);
    var members = await _userGroupRepo.getAllMember(channel.userGroupRef);
    return members;
  }
}
