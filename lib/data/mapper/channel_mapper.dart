import 'dart:async';

import 'package:discord_replicate/data/mapper/mapper.dart';
import 'package:discord_replicate/data/mapper/member_mapper.dart';
import 'package:discord_replicate/data/mapper/message_mapper.dart';
import 'package:discord_replicate/data/model/channel_model.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ChannelMapper implements Mapper<ChannelModel, Channel> {
  final MessageMapper _messageMapper;
  final MemberMapper _memberMapper;

  ChannelMapper(this._messageMapper, this._memberMapper);

  @override
  FutureOr<Channel> map(ChannelModel from) async {
    var messages = await Future.wait(from.messages.map((e) async => _messageMapper.map(e)));
    var members = await Future.wait(from.members.map((e) async => _memberMapper.map(e)));

    return Channel(
      id: from.id,
      name: from.name,
      userGroupRef: from.userGroupRef,
      members: members,
      messages: messages,
    );
  }
}
