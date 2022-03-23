import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetChannelMemberByIdUseCase, env: [Env.PROD, Env.DEV])
class GetChannelMemberByIdUseCaseImpl implements GetChannelMemberByIdUseCase {
  final GetChannelByIdUseCase _getChannelByIdUseCase;
  final UserGroupRepository _userGroupRepo;

  GetChannelMemberByIdUseCaseImpl(this._getChannelByIdUseCase, this._userGroupRepo);

  @override
  Future<Member> invoke({required String channelId, required String userId}) async {
    var channel = await _getChannelByIdUseCase.invoke(channelId: channelId);
    var member = await _userGroupRepo.getMemberById(channel.userGroupRef, userId).catchError((e, st) {
      log.e("Error", e, st);
    });

    return member;
  }
}
