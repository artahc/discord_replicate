import 'package:discord_replicate/interactor/channel/channel_interactor.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/api/paginated_response.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:logger/logger.dart';

class ChannelInteractorImpl implements ChannelInteractor {
  final Logger log = Logger();

  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  ChannelInteractorImpl({
    ChannelRepository? channelRepo,
    UserGroupRepository? userGroupRepo,
  })  : _channelRepo = channelRepo ?? sl.get<ChannelRepository>(),
        _userGroupRepo = userGroupRepo ?? sl.get<UserGroupRepository>();

  @override
  Future<Channel> getChannelById({required String id}) async {
    var channel = await _channelRepo.getChannel(id);
    return channel;
  }

  @override
  Future<List<Member>> getAllMembers({required String channelId}) async {
    var channel = await this.getChannelById(id: channelId);
    var userGroup = await _userGroupRepo.getUserGroup(channel.userGroupRef);

    return userGroup.members.values.toList();
  }

  @override
  Future<Member> getMemberById({required String channelId, required String userId}) async {
    var channel = await this.getChannelById(id: channelId);
    var userGroup = await _userGroupRepo.getUserGroup(channel.userGroupRef);

    // todo: fetch batch of member from server based on this userId
    if (!userGroup.members.containsKey(userId)) throw UnimplementedError();
    var member = userGroup.members[userId];

    return member!;
  }

  @override
  Future<Message> sendChannelMessage({required String channelId, required String messageText, required int timestamp}) async {
    var raw = await _channelRepo.createMessage(channelId, messageText, timestamp);
    var member = await this.getMemberById(channelId: channelId, userId: raw.senderRef);
    var messageWithUser = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);

    return messageWithUser;
  }

  @override
  Future<PaginationResponse<Message>> getChannelMessages({required String channelId, int limit = 30, String? lastMessageId}) async {
    var raw = await _channelRepo.getChannelMessages(channelId, limit, lastMessageId);
    var messages = await Stream.fromIterable(raw.items).asyncMap((raw) async {
      var member = await this.getMemberById(channelId: channelId, userId: raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    }).toList();

    var paginatedResponse = PaginationResponse(items: messages, hasMore: raw.hasMore, cursor: raw.cursor);

    return paginatedResponse;
  }

  @override
  Stream<Message> subscribeChannelMessage({required String channelId}) async* {
    var rawMessageStream = _channelRepo.subscribeChannelMessages(channelId);
    var messageWithUserStream = rawMessageStream.asyncMap((raw) async {
      var member = await this.getMemberById(channelId: channelId, userId: raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    });

    yield* messageWithUserStream;
  }
}
