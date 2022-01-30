import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_group_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/service/channel_service.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
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
  await initializeHive();
  await initializeDependencyContainer();

  runApp(Main());
}

Future initializeDependencyContainer() async {
  final String url = "http://localhost:4000/graphql";

  // GraphQL Client
  GetIt.I.registerFactory<GraphQLClientHelper>(() => GraphQLClientHelper(url));

  // Service
  GetIt.I.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  GetIt.I.registerLazySingleton<UserService>(() => UserServiceImpl());
  GetIt.I.registerLazySingleton<ChannelService>(() => ChannelServiceImpl());
  GetIt.I.registerLazySingleton<ServerService>(() => ServerServiceImpl());
  GetIt.I.registerLazySingleton<DatabaseService>(() {
    var db = HiveDatabaseService();
    db.initialize();
    return db;
  });

  // Repository
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepository());
  GetIt.I.registerLazySingleton<ServerRepository>(() => ServerRepository());
  GetIt.I.registerLazySingleton<ChannelRepository>(() => ChannelRepositoryImpl());
  GetIt.I.registerLazySingleton<UserGroupRepository>(() => UserGroupRepository());

  // Bloc
  GetIt.I.registerLazySingleton<AuthBloc>(() => AuthBloc());
  GetIt.I.registerFactory<ServerBloc>(() => ServerBloc());
  GetIt.I.registerFactoryParam<ChannelBloc, ServerBloc, UserBloc>((serverBloc, userBloc) => ChannelBloc(serverBloc: serverBloc, userBloc: userBloc));
  GetIt.I.registerFactoryParam<UserBloc, AuthBloc, void>((authBloc, _) => UserBloc(authBloc: authBloc));
  GetIt.I.registerFactoryParam<NavigationCubit, GlobalKey<NavigatorState>, void>((key, _) => NavigationCubit(navigator: key));
}

Future initializeHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class Main extends StatelessWidget {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final authBloc = GetIt.I.get<AuthBloc>();
    final userBloc = GetIt.I.get<UserBloc>(param1: authBloc);
    final navBloc = GetIt.I.get<NavigationCubit>(param1: rootNavigatorKey);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (c) => authBloc),
        BlocProvider<UserBloc>(create: (c) => userBloc),
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
