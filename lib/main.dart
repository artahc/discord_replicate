import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/room/room_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/activity_repository.dart';
import 'package:discord_replicate/repository/room_repository.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/repository/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:discord_replicate/util/hive_database_helper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp();
  await HiveDatabaseHelper.initialize();

  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // Constant
  final String url = "http://localhost:4000";
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  late AuthService authService;

  // Helper Class
  late GraphQLClientHelper client;
  late HiveDatabaseHelper db;

  // Repository
  late UserRepository userRepository;
  late ServerRepository serverRepository;
  late RoomRepository roomRepository;
  // late ActivityRepository activityRepository = ActivityRepository();

  // Bloc
  late AuthBloc authBloc;
  late UserBloc userBloc;
  late ServerBloc serverBloc;

  late NavigationCubit navBloc;
  late RoomBloc roomBloc;

  @override
  void initState() {
    super.initState();
    authService = FirebaseAuthService();

    client = GraphQLClientHelper(url: url, tokenProvider: authService.getCredential);
    db = HiveDatabaseHelper();

    userRepository = UserRepository(apiClient: client, database: db);
    serverRepository = ServerRepository(apiClient: client, database: db);
    roomRepository = RoomRepository(apiClient: client, database: db);

    authBloc = AuthBloc(authService: authService);
    userBloc = UserBloc(userRepo: userRepository, authService: authService, serverRepo: serverRepository, authBloc: authBloc);
    serverBloc = ServerBloc(serverRepository: serverRepository, userBloc: userBloc);

    navBloc = NavigationCubit(navigator: rootNavigatorKey, authBloc: authBloc);
    roomBloc = RoomBloc(roomRepo: roomRepository, userRepo: userRepository, serverBloc: serverBloc, userBloc: userBloc);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServerBloc>(create: (c) => serverBloc),
        BlocProvider<AuthBloc>(create: (c) => authBloc),
        BlocProvider<NavigationCubit>(create: (c) => navBloc),
        BlocProvider<UserBloc>(create: (c) => userBloc),
        BlocProvider<RoomBloc>(create: (c) => roomBloc),
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
