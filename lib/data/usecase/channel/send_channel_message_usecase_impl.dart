import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SendChannelMessageUseCase, env: [Env.PROD, Env.DEV])
class SendChannelMessageUseCaseImpl implements SendChannelMessageUseCase {
  final ChannelRepository _channelRepo;
  final GetChannelMemberByIdUseCase _getChannelMemberByIdUseCase;

  SendChannelMessageUseCaseImpl(this._channelRepo, this._getChannelMemberByIdUseCase);

  @override
  Future<Message> invoke({required String channelId, required String messageText, required DateTime date}) async {
    var raw = await _channelRepo.createMessage(channelId, messageText, date.millisecondsSinceEpoch);
    var member = await _getChannelMemberByIdUseCase.invoke(channelId: channelId, userId: raw.senderRef);
    var messageWithUser = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);

    return messageWithUser;
  }
}
