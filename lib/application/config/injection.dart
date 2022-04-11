// import 'dart:async';

// import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';

// import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart';
// import 'package:discord_replicate/data/api/graphql_server_remote_api_impl.dart';
// import 'package:discord_replicate/data/api/graphql_user_group_remote_api_impl.dart';
// import 'package:discord_replicate/data/api/graphql_user_remote_api_impl.dart';

// import 'package:discord_replicate/data/repository/channel_repository_impl.dart';
// import 'package:discord_replicate/data/repository/firebase_auth_repository_impl.dart';
// import 'package:discord_replicate/data/repository/server_repository_impl.dart';
// import 'package:discord_replicate/data/repository/user_repository_impl.dart';
// import 'package:discord_replicate/data/repository/user_group_repository_impl.dart';

// import 'package:discord_replicate/data/store/channel_store/hivedb_channel_store.dart';
// import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart';
// import 'package:discord_replicate/data/store/server_store/hivedb_server_store.dart';
// import 'package:discord_replicate/data/store/server_store/inmemory_server_store.dart';
// import 'package:discord_replicate/data/store/user_group_store/hivedb_usergroup_store.dart';
// import 'package:discord_replicate/data/store/user_group_store/inmemory_usergroup_store.dart';
// import 'package:discord_replicate/data/store/user_store/hivedb_user_store.dart';
// import 'package:discord_replicate/data/store/user_store/inmemory_user_store.dart';

// import 'package:discord_replicate/domain/api/channel_remote_api.dart';
// import 'package:discord_replicate/domain/api/server_remote_api.dart';
// import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
// import 'package:discord_replicate/domain/api/user_remote_api.dart';

// import 'package:discord_replicate/domain/repository/channel_repository.dart';
// import 'package:discord_replicate/domain/repository/server_repository.dart';
// import 'package:discord_replicate/domain/repository/user_group_repository.dart';
// import 'package:discord_replicate/domain/repository/user_repository.dart';
// import 'package:discord_replicate/domain/repository/auth_repository.dart';

// import 'package:discord_replicate/domain/usecase/channel/get_all_channel_member_usecase.dart';
// import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart';
// import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart';
// import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart';
// import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart';
// import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart';
// import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart';
// import 'package:discord_replicate/domain/usecase/server/join_server_usecase.dart';
// import 'package:discord_replicate/domain/usecase/server/leave_server_usecase.dart';
// import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
// import 'package:discord_replicate/domain/usecase/user/get_user_by_id_usecase.dart';
// import 'package:discord_replicate/domain/usecase/user/observe_user_changes_usecase.dart';

// import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
// import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart';
// import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart';
// import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
// import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
// import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart';

// import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  usesNullSafety: true,
  preferRelativeImports: false,
)
void configureDependencies(GetIt container, String env) => $initGetIt(container, environment: env);

abstract class Env {
  Env._();

  static const TEST = "test";
  static const DEV = "dev";
  static const PROD = "prod";
}
