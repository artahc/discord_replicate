export 'query/get_channel_query_operation.dart';
export 'query/get_channel_messages_operation.dart';
export 'query/get_server_operation.dart';
export 'query/get_user_operation.dart';
export 'query/get_usergroup_operation.dart';
export 'mutation/create_channel_message_operation.dart';
export 'subscription/subscribe_channel_message_subscription.dart';

abstract class GraphQLOperation {
  String get operation;
  Map<String, dynamic> get variables;
}
