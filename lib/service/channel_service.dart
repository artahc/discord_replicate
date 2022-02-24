import 'dart:async';

import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/model/paginated_response.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract class UseCase<R, P> {
  R invoke(P param);
}

abstract class ChannelService implements Disposable {
  Future<Channel> getChannelById(String id);
  Future<Member> getMemberById(String userGroupId, String userId);
  Future<List<Member>> getAllMembers(String channelId);
  Future<PaginationResponse<Message>> getMessages(String channelId, int limit, String? lastMessageId);
  Future<Message> sendMessage(String channelId, String message, int timestamp);
  Stream<Message> subscribeChannelMessage(String channelId);
}

class ChannelServiceImpl implements ChannelService {
  final Logger log = Logger();

  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  ChannelServiceImpl({
    ChannelRepository? channelRepo,
    UserGroupRepository? userGroupRepo,
  })  : _channelRepo = channelRepo ?? GetIt.I.get<ChannelRepository>(),
        _userGroupRepo = userGroupRepo ?? GetIt.I.get<UserGroupRepository>();

  @override
  Future<Channel> getChannelById(String id) async {
    var channel = await _channelRepo.getChannel(id);
    return channel;
  }

  @override
  Future<List<Member>> getAllMembers(String channelId) async {
    var channel = await getChannelById(channelId);
    var userGroup = await _userGroupRepo.getUserGroup(channel.userGroupRef);
    if (userGroup == null) throw NotFoundException("User group not found when trying to fetch all members.");

    return userGroup.members.values.toList();
  }

  @override
  Future<Member> getMemberById(String channelId, String userId) async {
    var channel = await getChannelById(channelId);
    var userGroup = await _userGroupRepo.getUserGroup(channel.userGroupRef);

    if (userGroup == null) throw NotFoundException("User group not found when trying to fetch member.");

    // todo: fetch batch of member from server based on this userId
    if (!userGroup.members.containsKey(userId)) throw UnimplementedError();
    var member = userGroup.members[userId];

    return member!;
  }

  @override
  Future<Message> sendMessage(String channelId, String message, int timestamp) async {
    var raw = await _channelRepo.createMessage(channelId, message, timestamp);
    var member = await getMemberById(channelId, raw.senderRef);
    var messageWithUser = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);

    return messageWithUser;
  }

  @override
  Future<PaginationResponse<Message>> getMessages(String channelId, int limit, String? lastMessageId) async {
    var raw = await _channelRepo.getChannelMessages(channelId, limit, lastMessageId);
    var messages = await Stream.fromIterable(raw.items).asyncMap((raw) async {
      var member = await getMemberById(channelId, raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    }).toList();

    var paginatedResponse = PaginationResponse(items: messages, hasMore: raw.hasMore, previousCursor: raw.previousCursor);

    return paginatedResponse;
  }

  @override
  Stream<Message> subscribeChannelMessage(String channelId) async* {
    var rawMessageStream = _channelRepo.subscribeChannelMessages(channelId);
    var messageWithUserStream = rawMessageStream.asyncMap((raw) async {
      var member = await getMemberById(channelId, raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    });

    yield* messageWithUserStream;
  }

  @override
  FutureOr onDispose() {}
}
