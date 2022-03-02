import 'dart:async';

import 'package:discord_replicate/common/graphql/graphql_client_helper.dart';

import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart';
import 'package:discord_replicate/data/api/graphql_server_remote_api_impl.dart';
import 'package:discord_replicate/data/api/graphql_user_group_remote_api_impl.dart';
import 'package:discord_replicate/data/api/graphql_user_remote_api_impl.dart';

import 'package:discord_replicate/data/repository/channel_repositor_impl.dart';
import 'package:discord_replicate/data/repository/firebase_auth_service_repository.dart';
import 'package:discord_replicate/data/repository/server_repository_impl.dart';
import 'package:discord_replicate/data/repository/user_repository_impl.dart';
import 'package:discord_replicate/data/repository/user_group_repository_impl.dart';

import 'package:discord_replicate/data/store/channel_store/hivedb_channel_store.dart';
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart';
import 'package:discord_replicate/data/store/server_store/hivedb_server_store.dart';
import 'package:discord_replicate/data/store/server_store/inmemory_server_store.dart';
import 'package:discord_replicate/data/store/user_group_store/hivedb_usergroup_store.dart';
import 'package:discord_replicate/data/store/user_group_store/inmemory_usergroup_store.dart';
import 'package:discord_replicate/data/store/user_store/hivedb_user_store.dart';
import 'package:discord_replicate/data/store/user_store/inmemory_user_store.dart';

import 'package:discord_replicate/domain/api/channel_remote_api.dart';
import 'package:discord_replicate/domain/api/server_remote_api.dart';
import 'package:discord_replicate/domain/api/user_group_remote_api.dart';
import 'package:discord_replicate/domain/api/user_remote_api.dart';

import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/model/message/message.dart';
import 'package:discord_replicate/domain/model/server/server.dart';
import 'package:discord_replicate/domain/model/user/user.dart';
import 'package:discord_replicate/domain/model/user_group/user_group.dart';

import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/repository/auth_repository.dart';

import 'package:discord_replicate/domain/usecase/channel/get_all_channel_member_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart';
import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart';
import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/join_server_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/leave_server_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/get_user_by_id_usecase.dart';

import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance;

class AppConfiguration {
  static const String API_URL = "http://localhost:4000/graphql";
  static const String API_WS_URL = "ws://localhost:4000/graphql";

  static Future initServiceLocator() async {
    // GraphQL Client
    sl.registerFactory<GraphQLClientHelper>(() {
      AuthRepository authRepo = sl.get();
      BearerProvider bearerProvider =
          () => authRepo.getCredential(forceRefresh: true).then((credential) => credential == null ? "" : credential.token);

      return GraphQLClientHelper(url: API_URL, wsUrl: API_WS_URL, bearerProvider: bearerProvider);
    });

    // Data Sources
    sl.registerFactory<HiveUserStore>(() => HiveUserStore());
    sl.registerFactory<HiveServerStore>(() => HiveServerStore());
    sl.registerFactory<HiveChannelStore>(() => HiveChannelStore());
    sl.registerFactory<HiveUserGroupStore>(() => HiveUserGroupStore());

    sl.registerFactory<InMemoryChannelStore>(() => InMemoryChannelStore());
    sl.registerFactory<InMemoryServerStore>(() => InMemoryServerStore());
    sl.registerFactory<InMemoryUserStore>(() => InMemoryUserStore());
    sl.registerFactory<InMemoryUserGroupStore>(() => InMemoryUserGroupStore());

    sl.registerLazySingleton<ChannelRemoteApi>(() => GraphQLChannelRemoteApiImpl());
    sl.registerLazySingleton<UserRemoteApi>(() => GraphQLUserRemoteApiImpl());
    sl.registerLazySingleton<ServerRemoteApi>(() => GraphQLServerRemoteApiImpl());
    sl.registerLazySingleton<UserGroupRemoteApi>(() => GraphQLUserGroupRemoteApiImpl());

    // Repository
    sl.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepositoryImpl());
    sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(database: sl.get<HiveUserStore>(), cache: sl.get<InMemoryUserStore>()),
    );
    sl.registerLazySingleton<ServerRepository>(
      () => ServerRepositoryImpl(database: sl.get<HiveServerStore>(), cache: sl.get<InMemoryServerStore>()),
    );
    sl.registerLazySingleton<ChannelRepository>(
      () => ChannelRepositoryImpl(database: sl.get<HiveChannelStore>(), cache: sl.get<InMemoryChannelStore>()),
    );
    sl.registerLazySingleton<UserGroupRepository>(
      () => UserGroupRepositoryImpl(database: sl.get<HiveUserGroupStore>(), cache: sl.get<InMemoryUserGroupStore>()),
    );

    // BLoC
    sl.registerLazySingleton<AuthBloc>(() => AuthBloc());
    sl.registerFactory<ServerBloc>(() => ServerBloc());
    sl.registerFactoryParam<ChannelBloc, ServerBloc, DirectMessageBloc>((serverBloc, dmBloc) => ChannelBloc(serverBloc: serverBloc, dmBloc: dmBloc));
    sl.registerFactoryParam<UserBloc, AuthBloc, void>((authBloc, _) => UserBloc(authBloc: authBloc));
    sl.registerFactoryParam<NavigationCubit, GlobalKey<NavigatorState>, void>((key, _) => NavigationCubit(navigator: key));
    sl.registerFactoryParam<DirectMessageBloc, UserBloc, void>((userBloc, _) => DirectMessageBloc(userBloc: userBloc));

    // Channel Use Case
    sl.registerFactory<GetAllChannelMemberUseCase>(() => GetAllChannelMemberUseCaseImpl());
    sl.registerFactory<GetChannelByIdUseCase>(() => GetChannelByIdUseCaseImpl());
    sl.registerFactory<GetChannelMemberByIdUseCase>(() => GetChannelMemberByIdUseCaseImpl());
    sl.registerFactory<GetChannelMessagesUseCase>(() => GetChannelMessageUseCaseImpl());
    sl.registerFactory<SendChannelMessageUseCase>(() => SendChannelMessageUseCaseImpl());
    sl.registerFactory<SubscribeChannelMessageUseCase>(() => SubscribeChannelMessageUseCaseImpl());

    // Server Use Case
    sl.registerFactory<GetServerByIdUseCase>(() => GetServerByIdUseCaseImpl());
    sl.registerFactory<JoinServerUseCase>(() => JoinServerUseCaseImpl());
    sl.registerFactory<LeaveServerUseCase>(() => LeaveServerUseCaseImpl());

    // User Use Case
    sl.registerFactory<GetCurrentUserUseCase>(() => GetCurrentUserUseCaseImpl());
    sl.registerFactory<GetUserByIdUseCase>(() => GetUserByIdUseCaseImpl());
  }

  static Future initHive() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive
      ..registerAdapter(UserAdapter(), override: true)
      ..registerAdapter(ServerAdapter(), override: true)
      ..registerAdapter(ChannelAdapter(), override: true)
      ..registerAdapter(MessageAdapter(), override: true)
      ..registerAdapter(MemberAdapter(), override: true)
      ..registerAdapter(UserGroupAdapter(), override: true);
  }
}

abstract class SomethingStore implements Disposable {}

class SomethingStoreImpl implements SomethingStore {
  SomethingStoreImpl() {
    print("Construct something store");
  }
  @override
  FutureOr onDispose() async {
    print("Dispose something store");
    return;
  }
}
