import 'package:discord_replicate/app_config.dart';
import 'package:discord_replicate/interactor/channel_usecase/get_channel_member_by_id_usecase.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/repository/channel_repository/channel_repository.dart';

abstract class SubscribeChannelMessageUseCase {
  Stream<Message> subscribeChannelMessage({required String channelId});
}

class SubscribeChannelMessageUseCaseImpl implements SubscribeChannelMessageUseCase {
  final ChannelRepository _channelRepo;
  final GetChannelMemberByIdUseCase _getChannelMemberByIdUseCase;

  SubscribeChannelMessageUseCaseImpl({
    ChannelRepository? channelRepo,
    GetChannelMemberByIdUseCase? getChannelMemberByIdUseCase,
  })  : _channelRepo = channelRepo ?? sl.get(),
        _getChannelMemberByIdUseCase = getChannelMemberByIdUseCase ?? sl.get();

  @override
  Stream<Message> subscribeChannelMessage({required String channelId}) async* {
    var rawMessageStream = _channelRepo.subscribeChannelMessages(channelId);
    var messageWithUserStream = rawMessageStream.asyncMap((raw) async {
      var member = await _getChannelMemberByIdUseCase.invoke(channelId: channelId, userId: raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    });

    yield* messageWithUserStream;
  }
}
