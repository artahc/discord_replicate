import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/model/paginated_response.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/app_config.dart';

class GetChannelMessagesUseCase {
  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  GetChannelMessagesUseCase({
    ChannelRepository? channelRepo,
    UserGroupRepository? userGroupRepo,
  })  : _channelRepo = channelRepo ?? sl(),
        _userGroupRepo = userGroupRepo ?? sl();

  Future<PaginationResponse<Message>> invoke({required String channelId, int limit = 30, String? lastMessageId}) async {
    var channel = await _channelRepo.getChannel(channelId);
    var response = await _channelRepo.getChannelMessages(channelId, limit, lastMessageId);

    var messages = await Stream.fromIterable(response.items).asyncMap((e) async {
      var member = await _userGroupRepo.getMemberByUID(channel.userGroupRef, e.senderRef);
      return Message(id: e.id, date: e.date, message: e.message, status: "Sent", sender: member);
    }).toList();

    var result = PaginationResponse<Message>(items: messages, hasMore: response.hasMore, previousCursor: response.previousCursor);
    return result;
  }
}
