import 'package:discord_replicate/api/remote_api.dart';
import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/interactor/channel/channel_interactor_impl.dart';
import 'package:discord_replicate/interactor/server/server_interactor_impl.dart';
import 'package:discord_replicate/interactor/user/user_interactor_impl.dart';
import 'package:discord_replicate/repository/channel_repository/hivedb_channel_store.dart';
import 'package:discord_replicate/repository/channel_repository/inmemory_channel_store.dart';
import 'package:discord_replicate/repository/server_repository/hivedb_server_store.dart';
import 'package:discord_replicate/repository/server_repository/inmemory_server_store.dart';
import 'package:discord_replicate/repository/server_repository/server_repository_impl.dart';
import 'package:discord_replicate/repository/store.dart';
import 'package:discord_replicate/repository/user_group_repository/hivedb_usergroup_store.dart';
import 'package:discord_replicate/repository/user_group_repository/inmemory_usergroup_store.dart';
import 'package:discord_replicate/repository/user_repository/hivedb_user_store.dart';
import 'package:discord_replicate/repository/user_repository/inmemory_user_store.dart';
import 'package:discord_replicate/repository/user_repository/user_repository_impl.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/interactor/channel/channel_interactor.dart';
import 'package:discord_replicate/interactor/server/server_interactor.dart';
import 'package:discord_replicate/interactor/user/user_interactor.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/model/user_group/user_group.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance;

class AppConfiguration {
  static const String API_URL = "http://localhost:4000/graphql";
  static const String API_WS_URL = "ws://localhost:4000/graphql";

  static Future initServiceLocator() async {
    // GraphQL Client
    sl.registerFactory<GraphQLClientHelper>(() => GraphQLClientHelper(API_URL, API_WS_URL));
    sl.registerLazySingleton<RemoteApi>(() => GraphQLApiImpl());

    // Service / Interactor
    sl.registerLazySingleton<AuthService>(() => FirebaseAuthServiceImpl());
    sl.registerLazySingleton<UserInteractor>(() => UserInteractorImpl());
    sl.registerLazySingleton<ServerInteractor>(() => ServerInteractorImpl());
    sl.registerLazySingleton<ChannelInteractor>(() => ChannelInteractorImpl());
    // sl.registerLazySingleton<DatabaseService>(() => HiveDatabaseService());

    // Repository
    sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
    sl.registerLazySingleton<ServerRepository>(() => ServerRepositoryImpl());
    sl.registerLazySingleton<ChannelRepository>(() => ChannelRepositoryImpl());
    sl.registerLazySingleton<UserGroupRepository>(() => UserGroupRepositoryImpl());

    // Store
    sl.registerFactory<HiveUserStore>(() => HiveUserStore());
    sl.registerFactory<HiveServerStore>(() => HiveServerStore());
    sl.registerFactory<HiveChannelStore>(() => HiveChannelStore());
    sl.registerFactory<HiveUserGroupStore>(() => HiveUserGroupStore());

    sl.registerFactory<InMemoryChannelStore>(() => InMemoryChannelStore());
    sl.registerFactory<InMemoryServerStore>(() => InMemoryServerStore());
    sl.registerFactory<InMemoryUserStore>(() => InMemoryUserStore());
    sl.registerFactory<InMemoryUserGroupStore>(() => InMemoryUserGroupStore());

    // BLoC
    sl.registerLazySingleton<AuthBloc>(() => AuthBloc());
    sl.registerFactory<ServerBloc>(() => ServerBloc());
    sl.registerFactoryParam<ChannelBloc, ServerBloc, DirectMessageBloc>((serverBloc, dmBloc) => ChannelBloc(serverBloc: serverBloc, dmBloc: dmBloc));
    sl.registerFactoryParam<UserBloc, AuthBloc, void>((authBloc, _) => UserBloc(authBloc: authBloc));
    sl.registerFactoryParam<NavigationCubit, GlobalKey<NavigatorState>, void>((key, _) => NavigationCubit(navigator: key));
    sl.registerFactoryParam<DirectMessageBloc, UserBloc, void>((userBloc, _) => DirectMessageBloc(userBloc: userBloc));
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
