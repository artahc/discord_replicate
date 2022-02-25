import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/repository/channel_repository/channel_repository.dart';
import 'package:discord_replicate/repository/user_group_repository/user_group_repository.dart';
import 'package:discord_replicate/app_config.dart';

class SendChannelMessageUseCase {
  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  SendChannelMessageUseCase({
    ChannelRepository? channelRepo,
    UserGroupRepository? userGroupRepo,
  })  : _channelRepo = channelRepo ?? sl(),
        _userGroupRepo = userGroupRepo ?? sl();

  Future<Message> invoke({required String channelId, required String messageText, required int timestamp}) async {
    var channel = await _channelRepo.getChannel(channelId);
    var raw = await _channelRepo.createMessage(channelId, messageText, timestamp);
    var member = await _userGroupRepo.getMemberByUID(channel.userGroupRef, raw.senderRef);
    var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);

    return message;
  }
}
