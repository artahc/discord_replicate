import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/message.dart';

class MessageRepository {
  final Channel _channel;

  MessageRepository({required Channel channel}) : _channel = channel;

  Future<Message> sendMessage(String message) async {
    return Future.error(UnimplementedError());
  }
}
