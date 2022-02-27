export '../graphql_operation/query/get_channel.dart';
export '../graphql_operation/query/get_channel_messages.dart';
export '../graphql_operation/query/get_server.dart';
export '../graphql_operation/query/get_user.dart';
export '../graphql_operation/query/get_usergroup.dart';
export '../graphql_operation/mutation/create_channel_message.dart';
export '../graphql_operation/subscription/subscribe_channel_message.dart';

abstract class GraphQLOperation {
  String get operation;
  Map<String, dynamic> get variables;
}
