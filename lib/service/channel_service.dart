import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/member.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/user_group_repository.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract class ChannelService {
  Future<Channel> getChannelById(String id);

  Future<List<Member>> getAllMembers(String userGroupId);
  Future<Member> getMemberById(String userGroupId, String userId);

  Future<List<Message>> fetchMessages(String channelId);
  Future<Message> sendMessage(String channelId, Message message);
  Stream<Message> subscribeMessage(String channelId);
}

class ChannelServiceImpl implements ChannelService {
  final Logger log = Logger();
  final ChannelRepository _channelRepo;
  final UserGroupRepository _userGroupRepo;

  ChannelServiceImpl({
    GraphQLClientHelper? client,
    ChannelRepository? channelRepo,
    UserGroupRepository? userGroupRepo,
  })  : _channelRepo = channelRepo ?? GetIt.I.get<ChannelRepository>(),
        _userGroupRepo = userGroupRepo ?? GetIt.I.get<UserGroupRepository>();

  @override
  Future<Channel> getChannelById(String id) async {
    var channel = await _channelRepo.load(id);
    if (channel == null) throw NotFoundException("Channel not found.");

    return channel;
  }

  @override
  Future<List<Member>> getAllMembers(String channelId) async {
    var channel = await getChannelById(channelId);
    var userGroup = await _userGroupRepo.load(channel.userGroupRef);
    if (userGroup == null) throw NotFoundException("User group not found when trying to fetch all members.");

    return userGroup.members.values.toList();
  }

  @override
  Future<Member> getMemberById(String channelId, String userId) async {
    var channel = await getChannelById(channelId);
    var userGroup = await _userGroupRepo.load(channel.userGroupRef);

    if (userGroup == null) throw NotFoundException("User group not found when trying to fetch member.");

    // todo: fetch batch of member from server based on this userId
    if (!userGroup.members.containsKey(userId)) throw UnimplementedError();
    var member = userGroup.members[userId];

    return member!;
  }

  @override
  Future<Message> sendMessage(String channelId, Message message) async {
    var raw = await _channelRepo.sendMessage(channelId, message);
    var member = await getMemberById(channelId, raw.senderRef);
    var messageWithUser = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);

    return messageWithUser;
  }

  @override
  Future<List<Message>> fetchMessages(String channelId) async {
    var rawMessages = await _channelRepo.fetchMessages(channelId);
    var messages = await Stream.fromIterable(rawMessages).asyncMap((raw) async {
      var member = await getMemberById(channelId, raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    }).toList();

    return messages;
  }

  @override
  Stream<Message> subscribeMessage(String channelId) async* {
    var rawMessageStream = _channelRepo.subscribeChannelMessages(channelId);
    var messageWithUserStream = rawMessageStream.asyncMap((raw) async {
      var member = await getMemberById(channelId, raw.senderRef);
      var message = Message(id: raw.id, sender: member, date: raw.date, message: raw.message);
      return message;
    });

    yield* messageWithUserStream;
  }
}
