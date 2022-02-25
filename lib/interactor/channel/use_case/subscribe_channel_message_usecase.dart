import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/app_config.dart';

class SubscribeChannelMessageUseCase {
  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  SubscribeChannelMessageUseCase({ChannelRepository? channelRepo, UserGroupRepository? userGroupRepo})
      : _channelRepo = channelRepo ?? sl(),
        _userGroupRepo = userGroupRepo ?? sl();

  Stream<Message> invoke({required String channelId}) async* {
    var channel = await _channelRepo.getChannel(channelId);
    var rawMessageStream = _channelRepo.subscribeChannelMessages(channelId);
    var messageWithUserStream = rawMessageStream.asyncMap((raw) async {
      var member = await _userGroupRepo.getMemberByUID(channel.userGroupRef, raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    });

    yield* messageWithUserStream;
  }
}
