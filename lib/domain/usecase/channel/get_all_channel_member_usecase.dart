import 'package:discord_replicate/domain/model/member.dart';

abstract class GetAllChannelMemberUseCase {
  Future<List<Member>> invoke({required String channelId});
}
