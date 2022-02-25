import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/app_config.dart';

class GetMemberByUidUseCase {
  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  GetMemberByUidUseCase({ChannelRepository? channelRepo, UserGroupRepository? userGroupRepo})
      : _channelRepo = channelRepo ?? sl(),
        _userGroupRepo = userGroupRepo ?? sl();

  Future<Member> invoke({required String channelId, required String uid}) async {
    var channel = await _channelRepo.getChannel(channelId);
    var member = await _userGroupRepo.getMemberByUID(channel.userGroupRef, uid);

    return member;
  }
}
