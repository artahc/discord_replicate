import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/paginated_response.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetChannelMessagesUseCase, env: [Env.PROD, Env.DEV])
class GetChannelMessageUseCaseImpl implements GetChannelMessagesUseCase {
  final ChannelRepository _channelRepo;
  final GetChannelMemberByIdUseCase _getChannelMemberByIdUseCase;

  GetChannelMessageUseCaseImpl(this._channelRepo, this._getChannelMemberByIdUseCase);

  @override
  Future<PaginationResponse<Message>> invoke({required String channelId, int limit = 30, String? lastMessageId}) async {
    var raw = await _channelRepo.getChannelMessages(channelId, limit, lastMessageId);
    var messages = await Stream.fromIterable(raw.items).asyncMap((raw) async {
      var member = await _getChannelMemberByIdUseCase.invoke(channelId: channelId, userId: raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    }).toList();

    var paginatedResponse = PaginationResponse(items: messages, hasMore: raw.hasMore, cursor: raw.cursor);

    return paginatedResponse;
  }
}
