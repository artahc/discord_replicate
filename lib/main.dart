import 'package:discord_replicate/bloc/navigation/navigation_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/repository/auth_repository.dart';
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
  await HiveDatabaseHelper.registerAdapters();

  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // Constant
  final String url = "http://localhost:4000";

  late AuthRepository authRepository = FirebaseAuthRepository();

  // Helper Class
  late GraphQLClientHelper apiClient = GraphQLClientHelper(url: url, tokenProvider: authRepository.getCurrentUserCredential);
  late HiveDatabaseHelper dbHelper = HiveDatabaseHelper();

  // Repository
  late UserRepository userRepository = UserRepository(apiClient: apiClient, dbHelper: dbHelper);
  late ServerRepository serverRepository = ServerRepository(apiClient: apiClient);

  // Bloc
  late ServerBloc serverBloc = ServerBloc(serverRepository: serverRepository);
  late AuthBloc authBloc = AuthBloc(authRepo: authRepository, userRepo: userRepository);
  late NavigationBloc navBloc = NavigationBloc();
  late UserBloc userBloc = UserBloc(userRepo: userRepository, authRepo: authRepository);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServerBloc>(create: (c) => serverBloc),
        BlocProvider<AuthBloc>(create: (c) => authBloc),
        BlocProvider<NavigationBloc>(create: (c) => navBloc),
        BlocProvider<UserBloc>(create: (c) => userBloc),
      ],
      child: MaterialApp(
        theme: AppTheme.darkThemeData,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: Routes.initial,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
