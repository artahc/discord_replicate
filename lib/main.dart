import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/channel_repository.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/repository/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:discord_replicate/service/messaging_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  runApp(Main());
}

Future initializeHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // Constant
  final String url = "http://localhost:4000/graphql";
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  late AuthService authService;

  // Helper Class
  late GraphQLClientHelper client;
  late HiveDatabaseService db;

  // Services
  late MessagingService messageService;

  // Repository
  late UserRepository userRepository;
  late ServerRepository serverRepository;
  late ChannelRepository channelRepository;
  // late ActivityRepository activityRepository = ActivityRepository();

  // Bloc
  late AuthBloc authBloc;
  late UserBloc userBloc;
  late ServerBloc serverBloc;
  late NavigationCubit navBloc;
  late ChannelBloc channelBloc;

  @override
  void initState() {
    super.initState();
    authService = FirebaseAuthService();

    client = GraphQLClientHelper(url: url, tokenProvider: authService.getCredential);
    db = HiveDatabaseService()..initialize();

    userRepository = UserRepository(apiClient: client, database: db);
    serverRepository = ServerRepository(apiClient: client, database: db);
    channelRepository = ChannelRepository(apiClient: client, database: db);

    authBloc = AuthBloc(authService: authService);
    navBloc = NavigationCubit(navigator: rootNavigatorKey, authBloc: authBloc);
    userBloc = UserBloc(userRepo: userRepository, authService: authService, serverRepo: serverRepository, authBloc: authBloc);
    serverBloc = ServerBloc(serverRepository: serverRepository);
    channelBloc = ChannelBloc(channelRepository: channelRepository, serverBloc: serverBloc, userBloc: userBloc);
    messageService = MessagingService(client);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (c) => userRepository),
        RepositoryProvider<ServerRepository>(create: (c) => serverRepository),
        RepositoryProvider<ChannelRepository>(create: (c) => channelRepository),
        RepositoryProvider<MessagingService>(create: (c) => messageService),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ServerBloc>(create: (c) => serverBloc),
          BlocProvider<AuthBloc>(create: (c) => authBloc),
          BlocProvider<NavigationCubit>(create: (c) => navBloc),
          BlocProvider<UserBloc>(create: (c) => userBloc),
          BlocProvider<ChannelBloc>(create: (c) => channelBloc),
        ],
        child: MaterialApp(
          navigatorKey: rootNavigatorKey,
          theme: AppTheme.darkThemeData,
          onGenerateRoute: Routes.generateRoutes,
          initialRoute: Routes.initial,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
