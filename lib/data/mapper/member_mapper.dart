import 'dart:async';

import 'package:discord_replicate/data/mapper/mapper.dart';
import 'package:discord_replicate/data/model/member_model.dart';
import 'package:discord_replicate/domain/model/member.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MemberMapper implements Mapper<MemberModel, Member> {
  @override
  FutureOr<Member> map(MemberModel from) {
    return Member(uid: from.id, name: from.name, avatarUrl: from.avatarUrl);
  }
}
