import 'package:discord_replicate/api/remote_api.dart';
import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/model/member/member.dart';
import 'package:discord_replicate/model/message/message.dart';
import 'package:discord_replicate/model/server/server.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/model/user_group/user_group.dart';
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
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/service/channel_service.dart';
import 'package:discord_replicate/api/graphql_client_helper.dart';
import 'package:discord_replicate/external/hive_constants.dart';
import 'package:discord_replicate/service/server_service.dart';
import 'package:discord_replicate/service/user_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp();
  await initializeDependency();
  await initializeHive();

  runApp(Main());
}

Future initializeHive() async {
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

Future initializeDependency() async {
  // final String url = "https://discord-replicate-backend-1029.herokuapp.com/graphql";
  // final String wsUrl = "ws://discord-replicate-backend-1029.herokuapp.com/graphql";

  final String url = "http://localhost:4000/graphql";
  final String wsUrl = "ws://localhost:4000/graphql";

  // GraphQL Client
  GetIt.I.registerFactory<GraphQLClientHelper>(() => GraphQLClientHelper(url, wsUrl));

  // Service
  GetIt.I.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  GetIt.I.registerLazySingleton<UserService>(() => UserServiceImpl());
  GetIt.I.registerLazySingleton<ChannelService>(() => ChannelServiceImpl());
  GetIt.I.registerLazySingleton<ServerService>(() => ServerServiceImpl());
  // GetIt.I.registerLazySingleton<DatabaseService>(() => HiveDatabaseService());

  // Repository
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  GetIt.I.registerLazySingleton<ServerRepository>(() => ServerRepositoryImpl());
  GetIt.I.registerLazySingleton<ChannelRepository>(() => ChannelRepositoryImpl());
  GetIt.I.registerLazySingleton<UserGroupRepository>(() => UserGroupRepositoryImpl());

  // Bloc
  GetIt.I.registerLazySingleton<AuthBloc>(() => AuthBloc());
  GetIt.I.registerFactory<ServerBloc>(() => ServerBloc());
  GetIt.I
      .registerFactoryParam<ChannelBloc, ServerBloc, DirectMessageBloc>((serverBloc, dmBloc) => ChannelBloc(serverBloc: serverBloc, dmBloc: dmBloc));
  GetIt.I.registerFactoryParam<UserBloc, AuthBloc, void>((authBloc, _) => UserBloc(authBloc: authBloc));
  GetIt.I.registerFactoryParam<NavigationCubit, GlobalKey<NavigatorState>, void>((key, _) => NavigationCubit(navigator: key));
  GetIt.I.registerFactoryParam<DirectMessageBloc, UserBloc, void>((userBloc, _) => DirectMessageBloc(userBloc: userBloc));

  GetIt.I.registerFactory<HiveUserStore>(() => HiveUserStore());
  GetIt.I.registerFactory<HiveServerStore>(() => HiveServerStore());
  GetIt.I.registerFactory<HiveChannelStore>(() => HiveChannelStore());
  GetIt.I.registerFactory<HiveUserGroupStore>(() => HiveUserGroupStore());

  GetIt.I.registerFactory<InMemoryChannelStore>(() => InMemoryChannelStore());
  GetIt.I.registerFactory<InMemoryServerStore>(() => InMemoryServerStore());
  GetIt.I.registerFactory<InMemoryUserStore>(() => InMemoryUserStore());
  GetIt.I.registerFactory<InMemoryUserGroupStore>(() => InMemoryUserGroupStore());

  GetIt.I.registerFactory<RemoteApi>(() => RemoteApiImpl());
}

class Main extends StatelessWidget {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final authBloc = GetIt.I.get<AuthBloc>();
    final navBloc = GetIt.I.get<NavigationCubit>(param1: rootNavigatorKey);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (c) => authBloc),
        BlocProvider<NavigationCubit>(create: (c) => navBloc),
      ],
      child: MaterialApp(
        navigatorKey: rootNavigatorKey,
        theme: AppTheme.darkThemeData,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: Routes.initial,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
