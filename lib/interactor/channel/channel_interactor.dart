import 'dart:async';

import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/api/paginated_response.dart';

abstract class ChannelInteractor {
  Future<Channel> getChannelById({required String id});
  Future<Member> getMemberById({required String channelId, required String userId});
  Future<List<Member>> getAllMembers({required String channelId});
  Future<PaginationResponse<Message>> getChannelMessages({required String channelId, int limit, String? lastMessageId});
  Future<Message> sendChannelMessage({required String channelId, required String messageText, required int timestamp});
  Stream<Message> subscribeChannelMessage({required String channelId});
}