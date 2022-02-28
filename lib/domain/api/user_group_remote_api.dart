import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';

abstract class UserGroupRemoteApi {
  Future<PaginationResponse<Member>> getUserGroupById(String id, int limitMember, String? cursor);
}
