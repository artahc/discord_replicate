import 'package:discord_replicate/domain/model/member.dart';

abstract class GetChannelMemberByIdUseCase {
  Future<Member> invoke({required String channelId, required String userId});
}
