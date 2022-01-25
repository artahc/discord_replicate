import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
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

  GetIt.I.registerFactory<GraphQLClientHelper>(() => GraphQLClientHelper(url));
  GetIt.I.registerLazySingleton<DatabaseService>(() {
    var db = HiveDatabaseService();
    db.initialize();
    return db;
  });

  GetIt.I.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepository());
  GetIt.I.registerLazySingleton<ServerRepository>(() => ServerRepository());
  GetIt.I.registerLazySingleton<ChannelRepository>(() => ChannelRepository());

  GetIt.I.registerLazySingleton<AuthBloc>(() => AuthBloc());
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
    final userBloc = UserBloc(authBloc: authBloc);
    final serverBloc = ServerBloc();
    final channelBloc = ChannelBloc(userBloc: userBloc, serverBloc: serverBloc);
    final navBloc = NavigationCubit(navigator: rootNavigatorKey);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (c) => authBloc),
        BlocProvider<UserBloc>(create: (c) => userBloc),
        BlocProvider<ServerBloc>(create: (c) => serverBloc),
        BlocProvider<ChannelBloc>(create: (c) => channelBloc),
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
