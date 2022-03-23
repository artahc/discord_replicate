import 'package:discord_replicate/application/config/injection.dart';

import 'package:discord_replicate/domain/model/message.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubscribeChannelMessageUseCase, env: [Env.PROD, Env.DEV])
class SubscribeChannelMessageUseCaseImpl implements SubscribeChannelMessageUseCase {
  final ChannelRepository _channelRepo;
  final GetChannelMemberByIdUseCase _getChannelMemberByIdUseCase;

  SubscribeChannelMessageUseCaseImpl(this._channelRepo, this._getChannelMemberByIdUseCase);

  @override
  Stream<Message> invoke({required String channelId}) async* {
    var rawMessageStream = _channelRepo.subscribeChannelMessages(channelId);
    var messageWithUserStream = rawMessageStream.asyncMap((raw) async {
      var member = await _getChannelMemberByIdUseCase.invoke(channelId: channelId, userId: raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    });

    yield* messageWithUserStream;
  }
}
